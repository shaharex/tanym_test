import 'package:tanymtest_app/src/features/tests/models/question.dart';
import 'package:tanymtest_app/src/features/tests/models/question_status.dart';

class QuestionTracker {
  List<Question> questions;

  QuestionTracker(this.questions);

  void updateProgress(int currentQuestionIndex) {
    for (int i = 0; i < questions.length; i++) {
      if (i < currentQuestionIndex) {
        questions[i].status = QuestionStatus.Passed;
      } else if (i == currentQuestionIndex) {
        questions[i].status = QuestionStatus.Current;
      } else {
        questions[i].status = QuestionStatus.NotReached;
      }
    }
  }
}
