import 'package:flutter/material.dart';
import 'package:qapp/clas.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const Quizapp()));
}

class Quizapp extends StatefulWidget {
  const Quizapp({Key? key}) : super(key: key);

  @override
  State<Quizapp> createState() => _QuizappState();
}

class _QuizappState extends State<Quizapp> {
  int q = 0;
  List<Icon> plo = [];
  List x = [
    Quiz(
        question: "The moon is just 50 percent of the mass of Earth.",
        answer: false),
    Quiz(question: " Camels have three sets of eyelashes", answer: true),
    Quiz(
        question: 'There is a world championship for throwing mobile phones.',
        answer: true),
    Quiz(question: "A snail can sleep for three months.", answer: false),
    Quiz(question: 'There is no railway system in Iceland', answer: true),
    Quiz(
        question: 'Bats always turn right when leaving a cave.', answer: false),
    Quiz(
        question: 'The world’s oldest country San Marino is in Asia',
        answer: false),
    Quiz(
        question: ' Brazil and France share a 673-kilometre border',
        answer: true),
    Quiz(
        question: ' Colombia’s brightest rainbow is in its river',
        answer: true),
    Quiz(
        question:
            'The construction of the Eiffel tower was completed on March 31, 1887',
        answer: false),
    Quiz(question: 'Melbourne is the capital of Australia', answer: false),
    Quiz(question: " Camels have three sets of eyelashes", answer: true),
    Quiz(question: 'All mammals live on land.', answer: false),
    Quiz(question: 'Santa Claus has his own postal code.', answer: true),
    Quiz(
        question: 'Vanilla is the world’s most expensive spice.',
        answer: false),
    Quiz(
        question:
            'Brazil is the only nation to have played in every World Cup finals tournament.',
        answer: true),
    Quiz(
        question:
            'The Harry Potter film,  is the longest film of the Harry Potter movies.',
        answer: true),
    Quiz(question: 'Goldfish have a two second memory.', answer: false),
    Quiz(
        question: 'Gin is typically included in a Long Island Iced Tea.',
        answer: true),
  ];
  void next() {
    if (q < x.length - 1) {
      q++;
    }
  }

  String qus() {
    return x[q].question;
  }

  bool res() {
    return x[q].answer;
  }

  int reset() {
   return q = 0;

  }

  bool finel() {
    if (q == x.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void tot(bool useranswer) {
    bool correctanswer = res();
    if (finel() == true) {
      // print('finished');
      Alert(
              context: context,
              title: 'FINISHED',
              desc: 'Do you want to continue')
          .show();
      reset();
      plo=[];
    } else {
      if (correctanswer == useranswer) {
        plo.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        plo.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      next();
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: Colors.black,
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            "${qus()}",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 400,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 50,
                    width: double.maxFinite,
                    color: Colors.green,
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            tot(true);
                          });
                        },
                        child: Text(
                          'TRUE ',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 50,
                    width: double.maxFinite,
                    color: Colors.red,
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            tot(false);
                          });
                        },
                        child: Text(
                          'FALSE',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )),
                  ),
                ),
                Row(
                  children: plo,
                )
              ]),
        );
  }
}
