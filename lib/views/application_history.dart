import 'package:flutter/material.dart';
import '../widgets/expandable_tiles_job.dart';
import '../models/savedData.dart';
import '../constant.dart';

class ApplicationHistory extends StatelessWidget {
  final UserData user;
  ApplicationHistory({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=>Navigator.pop(context),
          icon:Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
        ),
        title:Text('Application History',style:kTitleStyle),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index){
          return JobExpandableTiles(
            jobTitle: user.getAppliedJob()[index].job,
            city: user.getAppliedJob()[index].city,
            salary: user.getAppliedJob()[index].salary,
            img: user.getAppliedJob()[index].image,
            );
        },
        itemCount: user.getAppliedJob().length,
      ),
    );
  }
}