import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State <Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
Widget activeScreen = const StartScreen(); //activeScreen se declara como un widget que contiene otro widget

void switchScreen() { //Aqui en el switchScreen volvemos a renderizar la pantalla al presionar el boton y esto hace que cambie a la nueva pantalla
  setState(() { // lo que quiere decir es que va a iniciar con startScreen pero al presionar el boton cambiara a la pantalla de QuestionsScreen y ahi es donde entra el setState que sirve para renderizar el estado
    activeScreen = const QuestionsScreen();
  });
}

  @override
  Widget build(context){
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
            child: activeScreen,
      ),
      ),
    );
  }
}