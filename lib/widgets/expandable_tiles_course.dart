import 'package:flutter/material.dart';

class CourseExpandableTiles extends StatelessWidget {
  final String courseName,universityName,courseType;
  final String img;
  CourseExpandableTiles({this.courseName,this.universityName,this.courseType,this.img});
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(courseName),
      leading: CircleAvatar(
        backgroundImage: AssetImage(img),
      ),
      children: [
          Column(
            children:[
              Container(
                margin: EdgeInsets.only(left: 75.0),
                child:Row(
                  children:[
                    Expanded(
                      child:Text('Course Name'),
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      flex: 3,
                      child:Text(courseName),
                    ),
                  ]
                )
              ),
              SizedBox(height: 10.0),
              Container(
                margin: EdgeInsets.only(left: 75.0),
                child:Row(
                  children:[
                    Expanded(
                      child:Text('Offered University'),
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      flex:3,
                      child:Text(universityName),
                    ),
                  ]
                )
              ),
              SizedBox(height: 10.0),
              Container(
                margin: EdgeInsets.only(left: 75.0),
                child:Row(
                  children:[
                    Expanded(
                      child:Text('Course Type'),
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      flex:3,
                      child:Text(courseType),
                    ),
                  ]
                )
              ),
            ]
          ),
        SizedBox(height: 10.0)
      ],
    );
  }
}