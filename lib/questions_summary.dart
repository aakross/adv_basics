import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        //Lo que hace singlechildscrillview es que toma un unico child en este caso de Colum y permite tomar las medidas de sizedBox para hace una pantalla scrollable
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                //Daba erro el + ya que Dart al no saber que tipo de dato se iba a recibir te avisa que algo podria salir mal ya que en results_screen tenemos List<Map<String, Object>> y Object es un dato mixto
                //Aqui se convirtio a strign ya que text solo recibe datos de tipo string y no del tipo int
                Text(((data['questions_index'] as int) + 1).toString()),
                Expanded(
                  child: Column(
                    children: [
                      //Se agrego as String ya que por el Object daba error ya quie text espera un dato de tipo string
                      Text(
                        data['questions'] as String,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 5),
                      Text(data['user_answer'] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 247, 152, 231),
                          ),
                          textAlign: TextAlign.left),
                      Text(
                        data['correct_answer'] as String,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 142, 191, 247),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(), //se uso tolist porque map recibe un objeto llamado iterable ya que Row solo acepta widgets y para arreglarlo se agrega tolist
        ),
      ),
    );
  }
}
