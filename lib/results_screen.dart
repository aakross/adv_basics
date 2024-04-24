import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

//Un Map es una estructura de datos muy simple que asigna valores a key's
  List<Map<String, Object>> getSummaryData() {
    //Se especifica que es una lista de del tipo Map, para el kye seran identificadores de cadena y para los valores seran de tipo objeto ya que permite todo tipo de valores y los permite guardar en el map
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'questions_index':
              i, //questions_index se agrego porque list map es de tipo string
          'questions': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuesitons = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      //Where te permite crear otra lista sin modificar la original en este caso esta creando una nueva lista con las respuestas correctas

      return data['user_answer'] == data['correct_answer'];
    }).length; //Agregando length nos dara el resultado en numeros ya que sin eso solo nos daria una lista nueva con las preguntas contestadas

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You asnwered $numCorrectQuestions out of $numTotalQuesitons questions correctly!',
              style: const TextStyle(
                  color: Color.fromARGB(255, 215, 201, 248), fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Restart Quiz!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
