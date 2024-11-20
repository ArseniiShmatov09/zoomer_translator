import 'package:domain/src/payloads/payloads.dart';

abstract class AIRepository {

  Future<String> getAIResponse(GetTranslatedPhrasePayload payload);
}