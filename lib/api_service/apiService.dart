import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiSerive {
  final String _SECRET_KEY = "123";
  final String _URL = "api.openai.com";

  ApiSerive();

  Future<String> generateResponse(String prompt) async {
    var url = Uri.https(_URL, "/v1/completions");
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_SECRET_KEY'
        },
        body: jsonEncode({
          'model': 'text-davinci-003',
          'prompt': prompt,
          'temperature': 0,
          'max_token': 2000,
          'top_p': 1,
          'frequency_penalty': 0.0,
          'presence_penalty': 0.0
        }));
    Map<String, dynamic> newResponse = jsonDecode(response.body);
    return newResponse['choices'][0]['text'];
  }
}
