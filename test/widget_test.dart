import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('AIProviderImpl Tests', () {

    final aiProvider = AIProviderImpl();

    test('Valid Input Returns Expected Response', () async {
      final payload = GetTranslatedPhrasePayload(
          inputPhrase: 'кун', userId: 'jj88SlcVuVOhtRimQir4Gw0xXxJ2');
      final response = await aiProvider.getAIResponse(payload);

      expect(response, isNotEmpty);
      expect(response, contains('парень'));
    });

    test('Valid Input Returns Expected Response', () async {
      final payload = GetTranslatedPhrasePayload(
          inputPhrase: 'иксрос',
          userId:
              'jj88SlcVuVOhtRimQir4Gw0xXxJ2');
      final response = await aiProvider.getAIResponse(payload);

      expect(
        response,
        contains('электронная сигарета'),
      );
    });

    test('Valid Input Returns Expected Response', () async {
      final payload = GetTranslatedPhrasePayload(
          inputPhrase: 'пов',
          userId:
          'jj88SlcVuVOhtRimQir4Gw0xXxJ2');
      final response = await aiProvider.getAIResponse(payload);

      expect(
        response,
        contains('точка зрения'),
      );
    });


  });
}
