import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../constant.dart';
import '../models/category.dart';
import '../models/savedData.dart';
import 'courselist.dart';

class CourseMain extends StatelessWidget {
  final UserData user;
  CourseMain({this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Color(0xFFF6F6F6),
        elevation: 0.0,
        toolbarHeight: 10.0,
      ),
      body: Container(
        margin: EdgeInsets.only(left:18.0),
          child:Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 25.0),
              Text(
                'Hi Kent, \nUpskill yourself and get employed!',
                style:kPageTitleStyle ),
                SizedBox(height: 25.0),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  margin: EdgeInsets.only(right: 18.0),
                  child:Row(
                    children: <Widget>[
                      Expanded(
                        child:Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius:BorderRadius.circular(12.0)
                          ),
                          child: TextField(
                            cursorColor:kBlack,
                            decoration:InputDecoration(
                              icon:Icon(
                                Icons.search,
                                size:25.0,
                                color:kBlack
                              ),
                              border: InputBorder.none,
                              hintText: "Search for anything ",
                              hintStyle:kSubtitleStyle.copyWith(
                                color:Colors.black38
                              )
                            )
                          ),
                        )
                      ),
                    ],
                  )
                ),
                SizedBox(height:15.0),
                Container(
                  margin: EdgeInsets.only(right:18.0),
                  child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Category',style:kTitleTextStyle_Course ),
                    Text('See all',
                      style:kSubtitleTextStyle_Course.copyWith(color: Color(0xFF6E8AFA)) )
                  ],)
                ),
                SizedBox(height:15.0),
                Expanded(
                  child:StaggeredGridView.countBuilder(
                    padding: EdgeInsets.all(0),
                    crossAxisCount: 2,
                    itemCount: categories.length,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseList(
                                title:categories[index].name,
                                user: user,
                              )
                            )
                          );
                        },
                        child:Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(right:18.0),
                          height:index.isEven?200:240,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            // color: Color(0xFF6E8AFA),
                            image:DecorationImage(
                              image:AssetImage(categories[index].image),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(categories[index].name,style:kTitleTextStyle_Course),
                              Text('${categories[index].numOfCourses} Courses',
                                style: TextStyle(color: Color(0xFF0D1333).withOpacity(0.5)
                                ))
                            ],
                          )
                        )
                      );
                    },  
                    staggeredTileBuilder: (index)=>StaggeredTile.fit(1),
                  )
                )
            ],
          ) ,
      ),

    );
  }
}