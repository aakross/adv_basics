import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data) {
        return Row(
          children: [
            Text(((data['questions_index'] as int) + 1).toString()), //Daba erro el + ya que Dart al no saber que tipo de dato se iba a recibir te avisa que algo podria salir mal ya que en results_screen tenemos List<Map<String, Object>> y Object es un dato mixto
                 //Aqui se convirtio a strign ya que text solo recibe datos de tipo string y no del tipo int
            Column(
              children: [
                Text(data['questions'] as String), //Se agrego as String ya que por el Object daba error ya quie text espera un dato de tipo string
                const SizedBox(height: 5),
                Text(data['user_answer'] as String),
                Text(data['correct_answer'] as String),
              ],
            )
          ],
        );
      }).toList(), //se uso tolist porque map recibe un objeto llamado iterable ya que Row solo acepta widgets y para arreglarlo se agrega tolist
    );
  }
}
