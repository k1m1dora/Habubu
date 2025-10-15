import 'dart:convert';
import 'package:http/http.dart' as http;

class DictionaryService {
  final String word; // Store the word for lookup

  DictionaryService(this.word); // Constructor to initialize the word

  static const String _apiKey = '32c6fdc8-b147-492b-b651-146b00d46193';
  static const String _baseUrl =
      'https://www.dictionaryapi.com/api/v3/references/sd2/json';

  // Fetch word data
  Future<Map<String, String>?> fetchWordData() async {
    final String url = '$_baseUrl/$word?key=$_apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        if (data.isNotEmpty && data[0] is Map<String, dynamic>) {
          return {
            'definition': (data[0]['shortdef'] as List<dynamic>?)?.join(', ') ??
                'No definition available.',
            'pronunciation':
            data[0]['hwi']?['prs']?[0]?['mw'] ?? 'No pronunciation available.',
          };
        }
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
    return null;
  }
}
