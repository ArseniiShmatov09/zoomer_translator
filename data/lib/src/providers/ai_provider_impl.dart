import 'dart:convert';

import 'package:core/core.dart';
import 'package:data/src/providers/ai_provider.dart';
import 'package:domain/domain.dart';
import 'package:http/http.dart' as http;

class AIProviderImpl implements AIProvider{

  @override
  Future<String> getAIResponse(GetTranslatedPhrasePayload payload) async {
    try {
     final Map<String, dynamic> requestBody = {
        'workerId': AppConstants.workerId,
        'variables': {'input': payload.inputPhrase},
        'workflow': "Main.flow",
      };

      final response = await http.post(
        Uri.parse(AppConstants.apiUrl),
        headers: {
          'Authorization': 'Bearer ${AppConstants.accessToken}',
          'Content-Type': 'application/json',
        },
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return responseData['result'];
      } else {
        return 'Something went wrong...';
      }
    } catch (e) {
      return 'System Error: $e';
    }
  }


}