import 'dart:convert';
import 'dart:io';

import 'package:core/core.dart';
import 'package:data/src/providers/ai_provider.dart';
import 'package:domain/domain.dart';

class AIProviderImpl implements AIProvider {
  @override
  Future<String> getAIResponse(GetTranslatedPhrasePayload payload) async {
    try {
      final Map<String, dynamic> requestBody = {
        'workerId': AppConstants.workerId,
        'variables': {'input': payload.inputPhrase},
        'workflow': "Main.flow",
      };

      HttpClient httpClient = HttpClient();
      httpClient.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

      final request = await httpClient.postUrl(Uri.parse(AppConstants.apiUrl));
      request.headers.set('Authorization', 'Bearer ${AppConstants.accessToken}');
      request.headers.set('Content-Type', 'application/json');
      request.add(utf8.encode(json.encode(requestBody)));

      final response = await request.close();

      if (response.statusCode == 200) {
        final responseBody = await response.transform(utf8.decoder).join();
        final responseData = json.decode(responseBody);
        return responseData['result'];
      } else {
        return 'Something went wrong...';
      }
    } catch (e) {
      return 'System Error: $e';
    }
  }
}