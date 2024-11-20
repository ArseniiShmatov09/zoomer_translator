import 'package:data/src/providers/ai_provider.dart';
import 'package:domain/domain.dart';

class AIRepositoryImpl implements AIRepository{
  AIRepositoryImpl({
    required AIProvider aiProvider,
  })  : _aiProvider = aiProvider;
  final AIProvider _aiProvider;

  @override
  Future<String> getAIResponse(GetTranslatedPhrasePayload payload) async {
    return _aiProvider.getAIResponse(payload);
  }
}