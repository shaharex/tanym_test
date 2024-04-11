import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tanymtest_app/src/features/tests/components/animation/animation_page.dart';
import 'package:tanymtest_app/src/features/tests/components/animation/data/animation_data.dart';
import 'package:tanymtest_app/src/features/tests/models/question.dart';
import 'package:tanymtest_app/src/features/tests/ui/result/test_result_page.dart';

class QuizProvider extends ChangeNotifier {
  BuildContext context;

  QuizProvider(this.context);
  final List<Question> questions = [
    Question('Д',
        "Я часто легко отвлекаюсь от дела, становлюсь рассеянным и мечтательным"),
    Question('Н', "Я устаю быстрее, чем большинство окружающих меня людей"),
    Question('И', "Иногда я могу похвастаться"),
    Question('О', "У меня часто бывает веселое настроение."),
    Question('Д', "Меня часто одолевают грустные мысли"),
    Question('О', "Я люблю общение с людьми"),
    Question(
        'Н', "Нередко чувствую, что у меня немеют или холодеют руки и ноги"),
    Question('О', "Я быстро забываю об огорчениях"),
    Question('Н', "Иногда ощущаю стук в висках и пульсацию в области шеи"),
    Question('О', "Я люблю развлекаться в веселой компании"),
    Question('Д', "В моей семье есть нервные люди"),
    Question('И',
        "Бывает что я с уверенностью говорю о вещах, в которых слабо разбираюсь"),
    Question('Д', "Временами чувствую себя беспомощным"),
    Question('О', "У меня много хороших знакомых"),
    Question('Н', "У меня часто болит голова"),
    Question('О', "Я почти всегда подвижен и активен"),
    Question('Н',
        "Если я сидел, а потом резко встал, то у меня темнеет в глазах и кружиться голова"),
    Question('Д', "Иногда я ссылаюсь на болезнь, чтобы избежать неприятностей"),
    Question('И', "Бывает, что я проявляю интерес к запретным темам"),
    Question('Д', "У меня часто бывают приступы плохого настроения"),
    Question(
        'О', "Мои друзья поражаются моей работоспособности и неутомимости"),
    Question('Н', "Я человек чувствительный и возбуждаемый"),
    Question('О', "Все проблемы в жизни разрешимы"),
    Question('Н', "У меня бывают приступы дрожи"),
    Question('О', "Я люблю рассказывать анекдоты и веселые истории"),
    Question('Д', "Временами мне хотелось навсегда уйти из дома"),
    Question('Д', "Я часто волнуюсь из-за пустяков"),
    Question('И', "В свое оправдание я иногда кое-что выдумываю"),
    Question('Н', "Иногда вдруг весь покрываюсь потом"),
    Question('И', "Бывает, что я не выполняю своих обещаний"),
    Question('Д', "Порой мне кажется, что я не на что не гожусь"),
    Question('И', "Не все мои знакомые мне нравятся"),
    Question('Н', "Часто у меня нет аппетита"),
    Question('О', "Легко могу развеселить самую скучную компанию"),
    Question('Д', "Привычки некоторых членов семьи меня раздражают"),
    Question(
        'О', "Я легко нахожу тему для разговора даже с незнакомым человеком"),
    Question('Н',
        "Мне кажется, что я постоянно нахожусь в каком-то напряжении и мне трудно расслабиться"),
    Question('Д', "Часто мне хочется умереть"),
    Question('О', "Меня считают человеком веселым и общительным"),
    Question('Д', "Я все принимаю близко к сердцу"),
    Question('Н',
        "У меня часто возникают боли «под ложечкой» и различные неприятные ощущения в животе"),
    Question('О', "Я всегда готов поговорить и со знакомыми и с незнакомыми"),
    Question('Н',
        "Если я чем-то сильно взволнован или раздражен, то чувствую это как бы всем телом"),
    Question('Д', "Я много мечтаю, но никому об этом не говорю"),
    Question('Н',
        "Иногда я полон энергии так, что все горит в моих руках, а иногда - совсем вялый"),
    Question('И', "Я не всегда говорю правду"),
    Question('О', "На спор я могу сделать все, что угодно"),
    Question('Д',
        "Я так остро переживаю неприятности, что долго не могу выкинуть из головы мысли об этом"),
    Question('Н', "Я часто чувствую себя вялым и усталым"),
    Question('О', "Я люблю подшучивать над другими"),
    Question('Д', "Критика и замечания всегда очень задевают меня"),
    Question('Н', "Мне часто снятся кошмары"),
    Question('О', "Я способен дать волю чувствам и повеселиться в компании"),
    Question(
        'Д', "Иногда без видимой причины чувствую себя вялым и подавленным"),
    Question('Н', "У меня часто бывает бессонница"),
    Question('И', "Иногда я передаю слухи и сплетни"),
    Question('О', "Я ко всему отношусь достаточно легко"),
    Question('Д',
        "Почти ежедневно думаю о том, насколько бы я лучше жил, если бы меня преследовали неудачи"),
    Question('О', "Я — уверенный в себе человек"),
    Question('Н', "Меня часто беспокоит чувство вины"),
    Question('О', "Я хожу быстро"),
    Question(
        'Д', "Нередко бывают ситуации, когда легко потерять надежду на успех"),
    Question('Н',
        "Часто мне не спиться из-за того, что в голову лезут разные мысли"),
    Question('Д', "Мне кажется, что другие часто смеются надо мной"),
    Question('О', "Я — человек беспечный"),
    Question('И', "Иногда у меня бывают такие мысли, которых нужно стыдиться"),
    Question('Н', "У меня часто бывают сильные сердцебиения"),
    Question('Д', "Даже среди людей я чувствую себя одиноким"),
    Question('О', "Иногда я много говорю и мне трудно остановиться"),
    Question('Н',
        "Я постоянно нуждаюсь в друзьях, которые меня понимают, могут ободрить, утешить"),
    Question('Д',
        "Иногда я отказываюсь от начатого дела, так как не верю в свои силы"),
    Question('Н',
        "У меня бывают периоды, когда меня сильно раздражают яркий свет, яркие краски, сильный шум, хотя на других людей это так не действует"),
    Question('И', "У меня есть плохие привычки"),
  ];
  int counter1 = 0;
  int counter2 = 0;
  int counter3 = 0;
  int counter4 = 0;
  final animation_data = AnimationData();
  int animation_index = 0;
  int currentIndex = 0;
  List<String> selectedEmotions = [];
  bool testSubmitted = false;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<String> getUserId() async {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      return user.uid;
    }
    throw Exception('No user logged in');
  }

  void answerQuestion(String value) {
    if (questions[currentIndex].shkala == "И" && value == "Yes") {
      counter1++;
    } else if (questions[currentIndex].shkala == "Д" && value == "Yes") {
      counter2++;
    } else if (questions[currentIndex].shkala == "Н" && value == "Yes") {
      counter3++;
    } else if (questions[currentIndex].shkala == "О" && value == "Yes") {
      counter4++;
    }
    nextQuestion();
  }

  void setSelectedEmotion(String emotion) {
    if (!selectedEmotions.contains(emotion)) {
      selectedEmotions.add(emotion);
      updateEmotionsInFirestore();
      notifyListeners();
      saveEmotionList();
    }
  }

  void removeSelectedEmotion(String emotion) {
    selectedEmotions.remove(emotion);
    updateEmotionsInFirestore();
    notifyListeners();
    saveEmotionList();
  }

  List<String> _listOfEmotions = [];
  void updateEmotionsInFirestore() {
    _listOfEmotions = selectedEmotions;
  }

  void saveEmotionList() async {
    try {
      String userId = await getUserId();
      CollectionReference emotionList =
          _fireStore.collection('users').doc(userId).collection('result');
      var existingData = await emotionList.limit(1).get();
      if (existingData.docs.isNotEmpty) {
        var docId = existingData.docs.first.id;
        await emotionList.doc(docId).set({
          'list_of_emotions': _listOfEmotions,
        }, SetOptions(merge: true));
      } else {
        await emotionList.add({
          'list_of_emotions': _listOfEmotions,
        });
      }
    } catch (e) {
      print('Error submitting test: $e');
    }
  }

  void nextQuestion() {
    if (currentIndex < questions.length - 1) {
      currentIndex++;
      if ((currentIndex + 1) % 25 == 0) {
        if (currentIndex != questions.length - 1) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AnimationPage(
                      data: animation_data.items[animation_index %
                          (animation_data.items.length - 1)]))).then((value) {
            animation_index =
                (animation_index + 1) % (animation_data.items.length - 1);
            notifyListeners();
          });
        }
      } else {
        notifyListeners();
      }
    } else {
      Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AnimationPage(data: animation_data.items.last)))
          .then((value) {
        submitTest();
      });
    }
  }

  void submitTest() async {
    try {
      String userId = await getUserId();
      testSubmitted = true;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TestResultPage(
            counter1: counter1,
            counter2: counter2,
            counter3: counter3,
            counter4: counter4,
          ),
        ),
      );

      CollectionReference resultList =
          _fireStore.collection('users').doc(userId).collection('result');
      var existingData = await resultList.limit(1).get();

      DateTime now = DateTime.now();
      String formattedDate =
          "${now.day.toString().padLeft(2, '0')}.${now.month.toString().padLeft(2, '0')}.${now.year}";

      if (existingData.docs.isNotEmpty) {
        var docId = existingData.docs.first.id;
        await resultList.doc(docId).set({
          'name_of_test': 'Личный опросник ИСН',
          'data': formattedDate,
          'depression': counter1,
          'neuroticism': counter2,
          'sincerity': counter3,
          'sociability': counter4,
        }, SetOptions(merge: true));
      } else {
        await resultList.add({
          'name_of_test': 'Личный опросник ИСН',
          'data': formattedDate,
          'depression': counter1,
          'neuroticism': counter2,
          'sincerity': counter3,
          'sociability': counter4,
        });
      }
    } catch (e) {
      print('Error submitting test: $e');
    }
  }
}
