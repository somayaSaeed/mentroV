// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'package:mentroverso/core/utils/constants.dart';
//
// class DeepSeekService {
//   final String apiKey = Constant.apiKey;
//   final String apiUrl = 'https://openrouter.ai/api/v1/chat/completions';
//
//
//
//   Stream<String> streamResponse(String prompt) async* {
//     try {
//       final request = http.Request('POST', Uri.parse(apiUrl))
//         ..headers.addAll({
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $apiKey',
//         })
//         ..body = jsonEncode({
//           "model": "deepseek/deepseek-chat:free",
//           "messages": [{"role": "user", "content": prompt}],
//           "stream": true,
//         });
//
//       final response = await http.Client().send(request);
//       String buffer = "";
//
//       if (response.statusCode == 200) {
//         await for (var chunk in response.stream.transform(utf8.decoder)) {
//           buffer += chunk;
//
//           // Ensure we process complete JSON objects only
//           List<String> messages = buffer.split("\n");
//           buffer = ""; // Reset buffer
//
//           for (var message in messages) {
//             if (message.startsWith("data: ")) {
//               message = message.replaceFirst("data: ", "").trim();
//             }
//
//             if (message.isNotEmpty && message != "[DONE]") {
//               try {
//                 final jsonResponse = jsonDecode(message);
//                 final content = jsonResponse["choices"]?[0]?["delta"]?["content"] ?? "";
//
//                 if (content.isNotEmpty) {
//                   yield content;
//                 }
//               } catch (e) {
//                 print("JSON Parsing Error: $e \n Raw Response: $message");
//               }
//             }
//           }
//         }
//       } else {
//         yield 'Error: ${response.statusCode} - ${await response.stream.bytesToString()}';
//       }
//     } catch (e) {
//       yield 'Error: $e';
//     }
//   }
//
//   Future<String> analyzeFile(String content) async {
//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $apiKey',
//       },
//       body: jsonEncode({
//         "model": "deepseek/deepseek-chat:free",
//         "messages": [
//           {"role": "user", "content": "Analyze this file: $content"}
//         ],
//       }),
//     );
//
//     if (response.statusCode == 200) {
//       final jsonResponse = jsonDecode(response.body);
//       return jsonResponse["choices"][0]["message"]["content"] ?? "No response";
//     } else {
//       throw Exception('Failed to analyze file');
//     }
//   }
//
//
//
// }


import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:mentroverso/core/utils/constants.dart';

class DeepSeekService {
  final String apiKey = dotenv.env['API_KEY'] ?? 'fallback_key_or_error';
  final String apiUrl = 'https://openrouter.ai/api/v1/chat/completions';

  Stream<String> streamResponse(String prompt) async* {
    try {
      final request = http.Request('POST', Uri.parse(apiUrl))
        ..headers.addAll({
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        })
        ..body = jsonEncode({
          "model": "deepseek/deepseek-chat:free",
          "messages": [{"role": "user", "content": prompt}],
          "stream": true,
        });

      final response = await http.Client().send(request);
      String buffer = "";

      if (response.statusCode == 200) {
        await for (var chunk in response.stream.transform(utf8.decoder)) {
          buffer += chunk;
          List<String> messages = buffer.split("\n");
          buffer = ""; // Reset buffer

          for (var message in messages) {
            if (message.startsWith("data: ")) {
              message = message.replaceFirst("data: ", "").trim();
            }

            if (message.isNotEmpty && message != "[DONE]") {
              try {
                final jsonResponse = jsonDecode(message);
                final content = jsonResponse["choices"]?[0]?["delta"]?["content"] ?? "";

                if (content.isNotEmpty) {
                  // Ensure response is well-formatted
                  yield _formatResponse(content);
                }
              } catch (e) {
                print("JSON Parsing Error: $e \n Raw Response: $message");
              }
            }
          }
        }
      } else {
        yield '⚠️ Error: ${response.statusCode} - ${await response.stream.bytesToString()}';
      }
    } catch (e) {
      yield '⚠️ Error: $e';
    }
  }

  Future<String> analyzeFile(String content) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        "model": "deepseek/deepseek-chat:free",
        "messages": [
          {"role": "user", "content": "Analyze this file: $content"}
        ],
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      String result = jsonResponse["choices"][0]["message"]["content"] ?? "No response";

      return _formatResponse(result);
    } else {
      throw Exception('⚠️ Failed to analyze file');
    }
  }


  Stream<String> generateSuggestedCoursesMessage(List<String> courses) async* {
    if (courses.isEmpty) {
      yield "I couldn't find any course recommendations.";
      return;
    }

//     final String prompt = """
// You are a helpful AI assistant. Provide the user with links and make sure the links are clickable to help them improve in the following recommended courses:
//
// ${courses.map((course) => "- $course").join("\n")}
//
// Format your response in a professional, structured manner. Use headings, bullet points, and emojis where appropriate to make it clear and engaging.
// """;

    final String prompt = """
You are a helpful AI assistant. The user has received the following course recommendations:

${courses.map((course) => "- $course").join("\n")}

🎯 Your job:
- For each course, search for a real online course (e.g., on Coursera, edX, Udemy, or similar).
- Include a real clickable link for each.
- Format clearly using markdown: **[Course Name](https://link.com)**
- Use headings, bullet points, and emojis where helpful to make it friendly and readable.
- Only use real links – do not make up URLs.

Example:
- **[Python for Beginners – Coursera](https://www.coursera.org/learn/python)**
- **[Intro to AI – edX](https://www.edx.org/course/artificial-intelligence)**

Respond in a structured format.
""";


    final request = http.Request('POST', Uri.parse(apiUrl))
      ..headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
        'Accept': 'text/event-stream', // Important for streaming
      })
      ..body = jsonEncode({
        "model": "deepseek/deepseek-chat:free",
        "messages": [
          {"role": "user", "content": prompt}
        ],
        "stream": true,
      });

    final response = await http.Client().send(request);

    if (response.statusCode == 200) {
      final stream = response.stream
          .transform(utf8.decoder)
          .transform(const LineSplitter());

      await for (var line in stream) {
        line = line.trim();

        if (line.isEmpty || line.startsWith(":")) {
          continue; // Skip empty lines or comments like ': OPENROUTER PROCESSING'
        }

        if (line.startsWith("data: ")) {
          final jsonString = line.substring(6).trim();

          if (jsonString == "[DONE]") break;

          try {
            final jsonResponse = jsonDecode(jsonString);
            final content = jsonResponse["choices"]?[0]?["delta"]?["content"] ?? "";

            if (content.isNotEmpty) {
              yield content;
            }
          } catch (e) {
            print("JSON Parsing Error: $e\nRaw line: $line");
          }
        }
      }
    } else {
      final errorBody = await response.stream.bytesToString();
      yield '⚠️ Error: ${response.statusCode} - $errorBody';
    }
  }





  /// Formats the AI response into a structured output
  String _formatResponse(String content) {
    return """
 
$content  
 
""";
  }
}


