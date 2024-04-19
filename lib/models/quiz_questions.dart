class QuizQuestion {
  QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffleAnswers() { //Aqui se crea una copia de la lista de answers y una vez copiada se barajean y se mandan a llamar en questions_screens
    final shuffledList = List.of(answers); //Of permite crear una nueva lista basada en otra lista lo que significa que copia una lista existente
    shuffledList.shuffle();
    return shuffledList;
  }
}
