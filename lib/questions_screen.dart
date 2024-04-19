import 'package:flutter/material.dart';
import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void anwersQuestion() {
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 1; //Aqui le estamos diciendo a Dart que currentQuestionIndex va a ser igual a el valor actual + 1
    setState(() {
      currentQuestionIndex++; //Esto hace lo mismo que los dos anteriores ejemplos de incrementar + 1 el valor actual de currentQuestionIndex
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[
        currentQuestionIndex]; //Aqui se pasa currentQuestionIndex por lo que es el estado actual
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffleAnswers().map(
              (asnwer) {
                // El operador spread lo que hace es crear una copia de la lista y pasarla, se utilizao el spread porque en un children no pueden estar una lista dentro de una lista
                //El item es la forma en que se llamaran los datos que contiene AnswerQuestions, puede llevar cualquier otro nombre pero se suigere ese
                return AnswerButton(
                  answerText: asnwer,
                  onTap: anwersQuestion,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
