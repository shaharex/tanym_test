import 'package:tanymtest_app/src/features/tests/ui/quiz/models/question_status.dart';

class Question {
  final String shkala;
  final String questionText;
  QuestionStatus status;

  Question(this.shkala, this.questionText,
      {this.status = QuestionStatus.NotReached});
}
