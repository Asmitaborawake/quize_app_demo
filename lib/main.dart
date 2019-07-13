import 'package:flutter/material.dart';
import 'quizebrain.dart';

Quizebrain quizeBrain = Quizebrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [

  ];



 int questionNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
              quizeBrain.getQuestionText(questionNumber),

                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 25.0,
                color: Colors.white
                ),
              ),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,

              child: Text('True',

                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white
                ),

              ),
              onPressed: (){
                //the user pick true
                bool correctAnswer = quizeBrain.getQuestionNumber(questionNumber);
                if (correctAnswer == true){
                  print('user got right');
                }else {
                  print('user got it wrong');
                }

                setState(() {

                  questionNumber = questionNumber + 1;
                  print(questionNumber);


                });


              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text('False',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white
                ),

              ),
              onPressed: (){
                //the user pick false
                bool correctAnswer = quizeBrain.getQuestionNumber(questionNumber);
                if (correctAnswer == false){
                  print('user got right');
                }else {
                  print('user got it wrong');
                }
                setState(() {

                   questionNumber = questionNumber + 1;
                   print(questionNumber);



                });

              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )

          ],
        );

  }
}
