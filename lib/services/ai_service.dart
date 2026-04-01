import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AiService {
  AiService();

  static final Uri _endpoint = Uri.parse('https://api.imagga.com/v2/tags');

  /// Sends [imageFile] to the Imagga tagging endpoint and returns the
  /// top-confidence tag in English, or `null` when recognition fails.
  Future<String?> detectThing(File imageFile) async {
    final auth = dotenv.env['IMAGGA_AUTH'] ?? '';

    final request = http.MultipartRequest('POST', _endpoint)
      ..headers['Authorization'] = 'Basic $auth'
      ..files.add(
        await http.MultipartFile.fromPath('image', imageFile.path),
      );

    try {
      final streamed =
          await request.send().timeout(const Duration(seconds: 30));

      if (streamed.statusCode != 200) return null;

      final body = await streamed.stream.bytesToString();
      final json = jsonDecode(body) as Map<String, dynamic>;

      final result = json['result'] as Map<String, dynamic>?;
      if (result == null) return null;

      final tags = result['tags'] as List<dynamic>?;
      if (tags == null || tags.isEmpty) return null;

      final bestTag = tags[0] as Map<String, dynamic>;
      final tag = bestTag['tag'] as Map<String, dynamic>;
      return tag['en'] as String?;
    } catch (_) {
      return null;
    }
  }
}

class AiEmptyResponseException implements Exception {
  @override
  String toString() => 'AI returned an empty response';
}

class AiServiceException implements Exception {
  AiServiceException(this.message);
  final String message;

  @override
  String toString() => message;
}
