
import 'package:todo_app/models/Question.dart';

class Case{

  String title;
  String description;
  String imageURL;
  List<Question> questions = [];

  Case({this.title, this.description, this.questions, this.imageURL});

}