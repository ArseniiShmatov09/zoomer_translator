import 'package:domain/domain.dart';

abstract class AIProvider {

  Future<String> getAIResponse(GetTranslatedPhrasePayload payload);
}
