import 'package:flutter/material.dart';

class JobExpandableTiles extends StatelessWidget {
  final String jobTitle,city,salary;
  final String img;
  JobExpandableTiles({this.jobTitle,this.city,this.salary,this.img});
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(jobTitle),
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
                      child:Text('Job Title'),
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      flex: 3,
                      child:Text(jobTitle),
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
                      child:Text('City'),
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      flex:3,
                      child:Text(city),
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
                      child:Text('Salary'),
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      flex:3,
                      child:Text(salary),
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