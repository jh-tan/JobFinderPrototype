import 'package:flutter/material.dart';
import '../widgets/expandable_tiles_course.dart';
import '../models/savedData.dart';
import '../constant.dart';

class CourseSubscribed extends StatelessWidget {
  final UserData user;
  CourseSubscribed({this.user});

  @override
  Widget build(BuildContext context) {
    print(user.getSubscribeCourse());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=>Navigator.pop(context),
          icon:Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
        ),
        title:Text('Course Subscribed',style:kTitleStyle),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index){
          return CourseExpandableTiles(
            courseName: user.getSubscribeCourse()[index].name,
            universityName:user.getSubscribeCourse()[index].offerUniversity ,
            courseType:user.getSubscribeCourse()[index].type ,
            img:user.getSubscribeCourse()[index].image ,
          );
        },
        itemCount: user.getSubscribeCourse().length,
      ),
    );
  }
}