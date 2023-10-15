import 'package:flutter/material.dart';
import '../widget/next_button.dart';
import '../widget/option_card_image.dart';
import '../models/constarts.dart';
import '../models/question_model.dart';
import '../widget/question_widget.dart';
import '../widget/result_box.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List<Question> _questions = [
    Question(
      id: '10',
      title: 'จงเลือกเงาให้ถูกต้อง',
      Image: "../assets/image/shopper.png",
      options: {
        '../assets/image/A_T.png': true,
        '../assets/image/B.png': false,
        '../assets/image/C.png': false
      },
    ),
     Question(
      id: '10',
      title: 'จงเลือกเงาให้ถูกต้อง',
      Image: "../assets/image/farmer.png",
      options: {
        '../assets/image/D.png': false,
        '../assets/image/H.png': false,
        '../assets/image/K.png': true,
      },
    ),
    Question(
      id: '10',
      title: 'จงเลือกเงาให้ถูกต้อง',
      Image: "../assets/image/chef.png",
      options: {
        '../assets/image/I.png': false,
        '../assets/image/F.png': false,
        '../assets/image/J.png': true,
      },
    ),
    Question(
      id: '10',
      title: 'จงเลือกเงาให้ถูกต้อง',
      Image: "../assets/image/mechanic.png",
      options: {
        '../assets/image/K.png': false,
        '../assets/image/E.png': true,
        '../assets/image/G.png': false,
      },
    ),
    Question(
      id: '10',
      title: 'จงเลือกเงาให้ถูกต้อง',
      Image: "../assets/image/diver.png",
      options: {
        '../assets/image/B.png': true,
        '../assets/image/H.png': false,
        '../assets/image/A_T.png': false,
      },
    ),
    Question(
      id: '10',
      title: 'จงเลือกเงาให้ถูกต้อง',
      Image: "../assets/image/shop.png",
      options: {
        '../assets/image/M.png': true,
        '../assets/image/H.png': false,
        '../assets/image/K.png': false,
      },
    ),
    Question(
      id: '10',
      title: 'จงเลือกเงาให้ถูกต้อง',
      Image: "../assets/image/driver.png",
      options: {
        '../assets/image/F.png': true,
        '../assets/image/M.png': false,
        '../assets/image/D.png': false,
      },
    ),
    Question(
      id: '10',
      title: 'จงเลือกเงาให้ถูกต้อง',
      Image: "../assets/image/judge.png",
      options: {
        '../assets/image/G.png': false,
        '../assets/image/C.png': false,
        '../assets/image/D.png': true,
      },
    ),
    Question(
      id: '10',
      title: 'จงเลือกเงาให้ถูกต้อง',
      Image: "../assets/image/artist.png",
      options: {
        '../assets/image/J.png': false,
        '../assets/image/I.png': true,
        '../assets/image/D.png': false,
      },
    ),
    Question(
      id: '10',
      title: 'จงเลือกเงาให้ถูกต้อง',
      Image: "../assets/image/teacher.png",
      options: {
        '../assets/image/E.png': false,
        '../assets/image/I.png': false,
        '../assets/image/G.png': true,
      },
    ),
  ];

  int index = 0;
  int score = 0;
  bool isPressed = false;
  bool isAlreadySelected = false;

  void nextQuestion() {
    if (index == _questions.length - 1) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => ResultBox(
                result: score,
                questionLength: _questions.length,
                onPressed: startOver,
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Center(child: Text('กรูณาเลือกคำตอบ')),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        )); 
      }
    }
  }

  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('เกมจับคู่เงา'),
        backgroundColor: Color.fromRGBO(101, 222, 240, 0.984),
        shadowColor: Colors.blue,
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Score : $score',
              style: const TextStyle(fontSize: 18.0),
            ),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("../assets/image/bg.png"), fit: BoxFit.cover),
        ),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            QuestionWidget(
              indexAction: index,
              img: _questions[index].Image,
              question: _questions[index].title,
              totalQuestion: _questions.length,
            ),
            for (int i = 0; i < _questions[index].options.length; i++)
              GestureDetector(
                onTap: () => checkAnswerAndUpdate(
                    _questions[index].options.values.toList()[i]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    optionCard(
                      imga: _questions[index].options.keys.toList()[i],
                      option: _questions[index].options.keys.toList()[i],
                      color: isPressed
                          ? _questions[index].options.values.toList()[i] == true
                              ? correct
                              : incorrect
                          : Colors.transparent,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
