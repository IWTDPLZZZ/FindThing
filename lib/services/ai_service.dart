import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:io';
import 'dart:typed_data';

class GeminiService {
  final GenerativeModel _gemini = GenerativeModel(
    model: 'gemini-2.5-flash-latest',
    apiKey: dotenv.env['API_KEY'] ?? '',
  );

  Future<String> detectThing(String imagePath) async {
    final Uint8List imageBytes = await File(imagePath).readAsBytes();
    final content = [
      Content.multi([
        TextPart(
          'Определи, что за предмет на фотографии, и верни только название предмета.',
        ),
        DataPart('image/jpeg', imageBytes),
      ]),
    ];
    final result = await _gemini.generateContent(content);
    return result.text?.trim() ?? '';
  }
}
