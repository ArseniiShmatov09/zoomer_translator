import 'package:domain/domain.dart';

class GetTranslatedPhraseUseCase
    implements FutureUseCase<GetTranslatedPhrasePayload, String> {
  GetTranslatedPhraseUseCase({
    required AIRepository aiRepository,
  }) : _aiRepository = aiRepository;
  final AIRepository _aiRepository;

  @override
  Future<String> execute(GetTranslatedPhrasePayload payload) {
    return _aiRepository.getAIResponse(payload);
  }
}
