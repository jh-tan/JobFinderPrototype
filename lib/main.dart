import 'package:flutter/material.dart';
import 'views/enterSkill.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyJobPro+ Demo',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/images/bbb.png',
          height: 220.0,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,),
        SizedBox(height: 20),
        Text('Welcome to MyJobPro+',
          textAlign: TextAlign.center,
          style:TextStyle(color:Colors.white,fontSize:28)
        ),
        SizedBox(height:20),
        Text('A one-stop job portal for you to seek for a new job and upskill yourself',
          textAlign: TextAlign.center,
          style:TextStyle(color:Colors.white,fontSize:16)
        ),
        SizedBox(height:20),
        Container(
          width: 250,
          child:MaterialButton(
            elevation: 0,
            height: 50,
            onPressed: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context)=> ViewSkill()
                )
              );
            },
            color:Color(0xff25bcbb),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Get Started',
                  style:TextStyle(color:Colors.white,fontSize:28)),
                Icon(Icons.arrow_forward_ios,color:Colors.white)
              ],
            ),
          )
        )
      ],
      ),
      backgroundColor: Color(0xff18203d)
    );
  }
}

