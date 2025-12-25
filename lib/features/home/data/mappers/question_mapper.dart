import 'package:hubx_case/features/home/data/models/question_model.dart';
import 'package:hubx_case/features/home/domain/entities/question.dart';

class QuestionMapper {
  static Question toEntity(QuestionModel model) {
    return Question(
      id: model.id,
      title: model.title,
      subtitle: model.subtitle,
      imageUri: model.imageUri,
      uri: model.uri,
      order: model.order,
    );
  }

  static List<Question> toEntityList(List<QuestionModel> models) {
    return models.map((model) => toEntity(model)).toList();
  }
}
