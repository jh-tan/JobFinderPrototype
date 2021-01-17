import 'package:flutter/material.dart';
import 'package:jobproject_1/coursedetail.dart';
import 'course.dart';
import 'constant.dart';


class CourseList extends StatelessWidget {

  final String title;
  CourseList({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSilver,
      appBar: AppBar(
        backgroundColor: kSilver,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kBlack,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          this.title,
          style: kTitleStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:Column(
        children:courseData.map((course)=>
        GestureDetector(onTap:(){
           Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen()
              )
            );
        },child:courseCard(course,context))).toList()
        ),
      )
    );
  }

  Widget courseCard(course,context){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget> [
        Expanded(
          flex: 5,
          child: Image.asset(course['image'],
            height: 130,
          )
        ),
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                SizedBox(height:10.0),
                Text(course['name'],style:kTitle_courseList,),
                SizedBox(height:5.0),
                Text(course['offerUniversity']),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 5.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border:
                        Border.all(color: kBlack.withOpacity(.5)),
                  ),
                  child: Text(
                    course['type'],
                    style: kSubtitleStyle,
                  ),
                ),
                SizedBox(height: 5.0),
                Text('Price : ${course['price']}'),
                SizedBox(height: 5.0),
                Text('Level : ${course['level']}'),
              ],
            )
        ),
      ],
      ),
    );
  }
}
