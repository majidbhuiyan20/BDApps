class QuizQuestion {
  int id;
  String question;
  List<String> options;
  int answerIndex;
  int? mark;

  QuizQuestion({
    required this.id,
    required this.question,
    required this.options,
    required this.answerIndex,
    this.mark = 0,
  });

  QuizQuestion.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        question = json['question'] ?? "",
        options = (json['options'] as List?)?.cast<String>() ?? [],
        answerIndex = json['answerIndex'] ?? 0,
        mark = json['mark'] ?? 0;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['options'] = options;
    data['answerIndex'] = answerIndex;
    data['mark'] = mark;
    return data;
  }
}
