// ignore_for_file: deprecated_member_use, unnecessary_new
import 'package:percent_indicator/percent_indicator.dart';

import 'package:flutter/material.dart';
import 'package:quiz/model/question.dart';
class quizApp extends StatefulWidget {
  const quizApp({ Key? key }) : super(key: key);

  @override
  _quizAppState createState() => _quizAppState();
}

class _quizAppState extends State<quizApp> {
    
    int score=0;
    int trueAns=0;   
    int _currentQuestionIndex=0;
    List questionBank=[
      Question.name( "Tunisia become a republic on 25 July 1957 ?.",true,5),
      Question.name( "Black sea is on the north of Tunisia ? .",false,2),
      Question.name( "Algeria is to the west of Tunisia  ?",true,5),
      Question.name( "Nabeul is the capital of Tunisia ? ",false,2),
      Question.name( "Pound is the currency of Tunisia  ?",false,5),
      Question.name( "Arabic is the offical  language of Tunisia ? ",true,2),
   Question.name( "Tunisia become a French protectorate on 1881 ? ",true,2),

    ] ;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
          appBar: AppBar(
            title: const Text("True Citizen"),
            centerTitle: true,

            backgroundColor: Colors.red.shade900,
          ) ,
          backgroundColor: Colors.grey.shade100,
          body: _currentQuestionIndex<questionBank.length ?(_getQuestion()
          ):(_getResult())
    );
  }
  _nextQuestion() {
    setState(() {
                _currentQuestionIndex=(_currentQuestionIndex+1);
                score-=2;
  
    });

  }
  _checkAnswer(bool ans) {
    if(ans==questionBank[_currentQuestionIndex].isCorrect)
    {
     // final snackBar = SnackBar(duration: Duration(milliseconds: 500),backgroundColor:Colors.green,content: Text('GG  MF'));
      //ScaffoldMessenger.of(context).showSnackBar(snackBar);  
        setState(() {
                   score=( questionBank[_currentQuestionIndex].pts )+score;
                   trueAns=trueAns+1;

        });
    }
    else
    {
       // final snackBar = SnackBar(duration: Duration(milliseconds: 500), backgroundColor: Colors.red, content: Text('Noo   MF Noob'));
        //ScaffoldMessenger.of(context).showSnackBar(snackBar); 
        
    }
    setState(() {
              _currentQuestionIndex=(_currentQuestionIndex+1);

    });
  }
  _getQuestion ()
  {

    return (Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Center(child: Image.asset("images/flag.png", width: 250,height: 180, ),
                  
                  
                  
                  ),
                                  Center( child: Container(margin: EdgeInsets.only(bottom:20), child:Text("every time u  skip question  u wil get -2")),),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(18.0, 5, 18.0, 18.0) ,
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.transparent,
                        borderRadius: BorderRadius.circular(14.5),
                        border: Border.all(
                          color:Colors.black,
                          style: BorderStyle.solid
                        )
                      ),
                      height: 120,
                      child:  Center(
                        child: Padding(
                           padding: const EdgeInsets.fromLTRB(18.0, 5, 18.0, 18.0) ,
                          child: Text(questionBank[_currentQuestionIndex].questionText,style: const TextStyle(color: Colors.black,fontSize: 16.5),),
                        ),
                      ),
                    ),
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround ,
                      children: [
                           
                          RaisedButton(onPressed: ()=>_checkAnswer(true),
                          color:Colors.red.shade900,
                          child: Text("True",style: TextStyle(color: Colors.white,)),
                          
                          
                          
                          )
                          ,
                          RaisedButton(onPressed: ()=>_checkAnswer(false),
                          color:Colors.red.shade900,
                          child: Text("False",style: TextStyle(color: Colors.white,),),
                          
                          
                          
                          
                          ),
                         _currentQuestionIndex < questionBank.length-1 ? (RaisedButton(onPressed: ()=>_nextQuestion(),
                          color: Colors.red.shade900,
                          child: Icon(Icons.forward , color: Colors.white,))
                           
                          
                          
                          ):Container()
                             
                    ],
                  ),
                  const Spacer(),
              ] 
              
              ,),
          ));
  }
  reset() {
    setState(() {
      score=0;
      trueAns=0;
      _currentQuestionIndex=0;
    });
  } 
  _getResult()
  {
    return (
      Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
                    width: 500,
                    height: 500,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Text("Your Score",style: TextStyle (fontSize: 50.0,fontWeight: FontWeight.bold,color:Colors.lightBlue ),)
                                    ,Padding( 
                                      
                                      padding: const EdgeInsets.only(top:.0),
                                      child: Container(margin: EdgeInsets.only(top: 40), width: 500,color: Colors.lightBlue , child: Center(child: Text("${score}" , style: TextStyle( color: Colors.white,fontWeight: FontWeight.bold,fontSize:44.9 ),))),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 20),
                                        child: new CircularPercentIndicator(
                                                    radius: 120.0,
                                                    lineWidth: 15.0,
                                                    animation: true,
                                                    animationDuration: 1500,
                                                    percent:trueAns/questionBank.length,
                                                    center:  Text("${((trueAns/questionBank.length)*100).toInt()}%"),
                                                    progressColor: Colors.lightBlue,
                                                  ),


                                    ) ,
                                    Center(
                                      child: Container(
                                        margin: EdgeInsets.only(top:40),
                                        child: RaisedButton(color: Colors.red, onPressed: ()=> reset(),child: Icon(Icons.replay ,color: Colors.white,),),
                                      ),
                                    ) ,                    Container(height: 120,)

                                    
                                    ],
                                    
                                    
                                    ),
                    ),
                  )
    );
  }

  
}