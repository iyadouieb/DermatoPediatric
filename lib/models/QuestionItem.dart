
import 'package:todo_app/models/Question.dart';
import 'package:todo_app/res/Cases.dart';

class QuestionItem{

  String expandedValue;
  String headerValue;
  bool isExpanded;

  QuestionItem({this.expandedValue, this.headerValue, this.isExpanded = false});

}

List<QuestionItem> GenerateQuestionItems(int index){
  List<QuestionItem> QuestionItems = [];
  List<Question> caseQuestions = cases[index].questions;

  caseQuestions.map((e) {
    QuestionItem questionItem = QuestionItem(expandedValue: e.answer, headerValue: e.question);
    QuestionItems.add(questionItem);
  }).toList();
  return QuestionItems;
}