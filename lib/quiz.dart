import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
// Widget activeScreen = const StartScreen(switchScreen); //activeScreen se declara como un widget que contiene otro widget

//Widget? activeScreen; //El signo significa que tambien puede ser un widget o puede ser nulo y esto nos ayuda a no darnos errores

// @override
//   void initState() {// El initState es el estado con el cual iniciara primero sin tomarle importancia al widget build
//     activeScreen = StartScreen(switchScreen);
//     super.initState();
  //}

  // void switchScreen() { //Aqui en el switchScreen volvemos a renderizar la pantalla al presionar el boton y esto hace que cambie a la nueva pantalla
//   setState(() { // lo que quiere decir es que va a iniciar con startScreen pero al presionar el boton cambiara a la pantalla de QuestionsScreen y ahi es donde entra el setState que sirve para renderizar el estado
//     activeScreen = const QuestionsScreen();
//   });
// }

  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  void switchScreen() {
    setState(() {
      activeScreen = 'Questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers
        .add(answer); //add nos permite agregar un nuevo valor a una cadena
    if (selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    // final screenWidget = activeScreen == 'start-screen'
    //     ? StartScreen(switchScreen)
    //     : const QuestionsScreen();
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'Questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 126, 84, 224),
                  Color.fromARGB(255, 51, 21, 90),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: screenWidget),
      ),
    );
  }
}
