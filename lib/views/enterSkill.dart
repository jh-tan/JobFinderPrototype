import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'home.dart';
import '../constant.dart';
import '../models/savedData.dart';

class ViewSkill extends StatefulWidget {
  @override
  _ViewSkillState createState() => _ViewSkillState();
}

class _ViewSkillState extends State<ViewSkill> {
  final UserData user= new UserData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle:true,
        title:Text('Enter your details',
          style: TextStyle(color: Colors.black),  
        )
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget>[
            Text('Choose your highest education qualification',style:kTitleStyle),
            SizedBox(height: 20.0),
            Container(
              width: 350.0,
              child: DropDownField(
                controller: qualificationSelected,
                hintText:"Select your highest qualification level",
                enabled: true,
                items: qualification,
                itemsVisibleInDropdown: 4,
                onValueChanged: (value){
                  setState(() {
                    selectedQualification=value;
                  });
                },
              )
            ),
            SizedBox(height: 30.0,),
            Text('Enter your skill'),
            SizedBox(height:15.0),
            Row(
              children: <Widget>[
                Expanded(
                  child:Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius:BorderRadius.circular(12.0)
                    ),
                    child: TextField(
                      controller: skillSelected,
                      cursorColor:kBlack,
                      decoration:InputDecoration(
                        icon:Icon(
                          Icons.search,
                          size:25.0,
                          color:kBlack
                        ),
                        border: InputBorder.none,
                        hintText: "Enter your skills",
                        hintStyle:kSubtitleStyle.copyWith(
                          color:Colors.black38
                        )
                      )
                    ),
                  )
                ),
                Container(
                  width: 50.0,
                  height: 50.0,
                  margin:EdgeInsets.symmetric(horizontal:12.0),
                  decoration: BoxDecoration(
                    color: kBlack,
                    borderRadius:BorderRadius.circular(12.0)
                  ),
                  child: IconButton(
                    icon:Icon(Icons.add),
                    color: Colors.white,
                    onPressed: (){
                      setState(() {
                      //   enterSkill.add(skillSelected.text);
                        user.saveSkill(skillSelected.text);
                      });
                      skillSelected.text = '';
                    }
                  ),
                )
              ],
            ),
            SizedBox(height: 10.0),
            Wrap(
              children: user.getSkill().isNotEmpty
                ?user.getSkill().map((skill) =>skillTag(skill)).toList()
                :[]
            ),
            SizedBox(height: 10.0),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context)=> MainMenu(user: user)
                )
              );
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.green,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Finish'),
                    Icon(Icons.done_rounded,color: Colors.white),
                  ]
                )
            )
            )
          ]
          )
        ),
      ),
    );
  }

  Widget skillTag(skill){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min ,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(skill),
          IconButton(
            icon:Icon(Icons.close),
            onPressed: (){
              setState(() {
                user.removeSkill(skill);
              });
            },
          )
        ],),
    );
  }
}
final qualificationSelected = TextEditingController();
String selectedQualification="";

final skillSelected = TextEditingController();
List<String> enterSkill=[];

List<String> qualification =[
  "UPSR",
  "SPM",
  "STPM",
  "Polytechnic",
  "Bachelor Degree",
  "Master",
  "Doctorate",
];

