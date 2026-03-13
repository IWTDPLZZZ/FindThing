import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeminiService {
  final GenerativeModel _gemini = GenerativeModel(
    model: 'gemini-1.5-flash-latest',
    apiKey: dotenv.env['API_KEY'] ?? '',
  );
}