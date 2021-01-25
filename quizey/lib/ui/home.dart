import 'package:flutter/material.dart';
import 'package:quizey/model/question.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex=0;
  List questionBank=[
    Question.name("The U.S Declaration of Independance was adopted in 1776", true),
    Question.name("The Supreme law of the land is the constitution", true),
    Question.name("The two rights in the declaration are:"
                     "/n life"
                     "/n pursuit of happiness", true),
    Question.name("The U.S Constitution has 26 amendments.", false),
    Question.name("Freedom of religion means:/n you can practice any religion,"
    "or not practice a religion.", true),
    Question.name("Journalist is a branch or part of the government", false),
    Question.name("The congress does not make federal laws", false),    
    Question.name("There are 100 U.S senators", true),
    Question.name("We elect a U.S for four years", false), 
    Question.name("We elect a U.S representative for 2 years", true),
    Question.name("We vote for president in january", false),
    Question.name("who veteos bills is the president", true),     
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle:true,
        // backgroundColor: Colors.blueGrey,
      ),
      // backgroundColor: Colors.blueGrey,
      // we use Builder here to use a [context] that is descendant of [Scaffold]
      // or else scaffold will retuen null
      body:Builder(
              builder:(BuildContext context)=> Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Center(
                child: Image.asset("images/flag.png",width:250,
                height:180
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius:BorderRadius.circular(14.4),
                    border: Border.all(
                      color:Colors.blueGrey.shade400, style: BorderStyle.solid,
                    )
                  ),
                  height: 120,
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(questionBank[_currentQuestionIndex].questionText,
                    style: TextStyle(fontSize:15, color:Colors.white),
                    ),
                  ),),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(onPressed: ()=>_prevQuestion(),
                                    color: Colors.blueGrey.shade900,
                                    child: Icon(Icons.arrow_back,color:Colors.white),
                                    ),
                                    
                                    RaisedButton(onPressed: ()=>_checkAnswer(true,context),
                                    color: Colors.blueGrey.shade900,
                                    child: Text("TRUE",style: TextStyle(color:Colors.white),),
                                    ),
                                    
                                    RaisedButton(onPressed: ()=>_checkAnswer(false,context),
                                    color: Colors.blueGrey.shade900,
                                    child: Text("FALSE",style: TextStyle(color:Colors.white),),
                                    ),
                                    
                                    RaisedButton(onPressed: ()=>_nextQuestion(),
                                    color: Colors.blueGrey.shade900,
                                    child: Icon(Icons.arrow_forward,color:Colors.white),
                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                              ],
                                            ),
                                          ),
                        ) ,
                                      
     );      
   }
  _checkAnswer(bool userChoice,BuildContext context){
                  
    if(userChoice == (questionBank[_currentQuestionIndex].isCorrect)){
      final snackBar= SnackBar(
        backgroundColor: Colors.green,
        duration: Duration(milliseconds: 500),
        content: Text("Correct!"));
        Scaffold.of(context).showSnackBar(snackBar);
        debugPrint("Yes Correct Hurray!");
        _updateQuestion();
    }else{
                                        
       debugPrint("Incorrect");
       final snackBar= SnackBar(
       backgroundColor: Colors.red,
      duration: Duration(milliseconds: 500),
      content: Text("InCorrect!"));
      Scaffold.of(context).showSnackBar(snackBar);
      _updateQuestion();
      }
    }
        _updateQuestion(){
          setState(() {
             _currentQuestionIndex= (_currentQuestionIndex + 1) % questionBank.length;                     
           });
  }
                                  
       _nextQuestion() {
          _updateQuestion();
                  
        }
                  
      _prevQuestion() {
        setState(() {
          _currentQuestionIndex= (_currentQuestionIndex - 1) % questionBank.length;                     
      });
  }
}
      
    

