import 'package:flutter/material.dart';
import '../constant.dart';
import '../widgets/successful_dialog.dart';
import '../models/savedData.dart';
import '../models/course.dart';


class DetailsScreen extends StatelessWidget {
  final Course course;
  final UserData user;
  DetailsScreen({this.course,this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFF5F4EF),
          image: DecorationImage(
            image: AssetImage("assets/images/ux_big.png"),
            alignment: Alignment.topRight,
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, top: 0, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    ],
                  ),
                  SizedBox(height: 30),
                  ClipPath(
                    clipper: BestSellerClipper(),
                    child: Container(
                      color: Colors.amber[800],
                      padding: EdgeInsets.only(
                          left: 10, top: 5, right: 20, bottom: 5),
                      child: Text(
                        "BestSeller".toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(course.name, style: kTitleStyle),
                  SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      Icon(Icons.person),
                      SizedBox(width: 5),
                      Text("18K"),
                      SizedBox(width: 20),
                      Icon(Icons.star_rate,color: Colors.yellow,),
                      SizedBox(width: 5),
                      Text("4.8")
                    ],
                  ),
                  SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: course.price,
                          style: kTitleStyle.copyWith(fontSize: 32),
                        ),
                        TextSpan(
                          text: "\RM888",
                          style: TextStyle(
                            color: kBlack.withOpacity(.5),
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0)
                  ),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child:Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Course Content", style: kTitleStyle),
                            SizedBox(height: 30),
                            CourseContent(
                              number: "01",
                              duration: 5.35,
                              title: "Welcome to the Course",
                              isDone: true,
                            ),
                            CourseContent(
                              number: '02',
                              duration: 19.04,
                              title: "Design Thinking - Intro",
                              isDone: false,
                            ),
                            CourseContent(
                              number: '03',
                              duration: 15.35,
                              title: "Design Thinking Process",
                              isDone: false,
                            ),
                            CourseContent(
                              number: '04',
                              duration: 5.35,
                              title: "Customer Perspective",
                              isDone: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ),
              ),
            ),
            BottomAppBar(
              child: Container(
              padding: EdgeInsets.all(20),
              height: 100,
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        user.subscribeCourse(course);
                        showDialog(context: context,
                          builder: (context){
                            return SuccessfulDialogBox(
                              buttonText:'Confirmed' ,
                              title: 'Success',
                              description: 'Course purchase success!',
                              from: context,
                            );
                          }
                        );
                      },
                      child:Container(
                        alignment: Alignment.center,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: kBlack,
                        ),
                        child: Text(
                          "Buy Now",
                          style: kTitleStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ),
                  )
                ],
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseContent extends StatelessWidget {
  final String number;
  final double duration;
  final String title;
  final bool isDone;
  const CourseContent({
    Key key,
    this.number,
    this.duration,
    this.title,
    this.isDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: <Widget>[
          Text(
            number,
            style: kTitleStyle.copyWith(
              color: kBlack.withOpacity(.15),
              fontSize: 32,
            ),
          ),
          SizedBox(width: 20),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$duration mins\n",
                  style: TextStyle(
                    color: kBlack.withOpacity(.5),
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: title,
                  style: kTitleStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(left: 20),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black
            ),
            child: isDone
              ?Icon(Icons.play_arrow, color: Colors.white)
              :Icon(Icons.lock, color: Colors.white),
          )
        ],
      ),
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}