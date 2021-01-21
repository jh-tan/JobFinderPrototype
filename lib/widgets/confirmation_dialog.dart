import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../views/course_main.dart';
import '../models/company.dart';
import '../constant.dart';
import '../models/savedData.dart';
import 'successful_dialog.dart';

class ConfirmationDialogBox extends StatefulWidget {
  final Image img;
  final Company company;
  final UserData user;

  const ConfirmationDialogBox({Key key,this.company,this.img,this.user}) : super(key: key);

  @override
  _ConfirmationDialogBoxState createState() => _ConfirmationDialogBoxState();
}

class _ConfirmationDialogBoxState extends State<ConfirmationDialogBox> {
  @override
  Widget build(BuildContext context) {
    print(widget.user.getSkill());
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
  contentBox(context){
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(top:20),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black,offset: Offset(0,10),
              blurRadius: 10
              ),
            ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Application Confirmation',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
              SizedBox(height: 15,),
              Text('Matching all the jobs requirement can increase the chance to get accepted',
                style: TextStyle(fontSize: 14),textAlign: TextAlign.center,),
              SizedBox(height: 15,),
              Text('Jobs requirement'),
              SizedBox(height: 8.0,),
              Wrap(
                children: widget.company.requirements
                  .map(
                    (e) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0,vertical: 2.0),
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
                        e,
                        style: kSubtitleStyle,
                      ),
                    ),
                ).toList()
              ),
              SizedBox(height: 8.0),
              Text('Your skills'),
              SizedBox(height: 8.0),
              Wrap(
                children: widget.user.getSkill()
                  .map(
                    (e) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0,vertical: 2.0),
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
                        e,
                        style: kSubtitleStyle,
                      ),
                    ),
                ).toList()
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 FlatButton(
                    onPressed: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context)=> CourseMain(user: widget.user,)
                        )
                      );
                    },
                    child: Text('Upskill now',style: TextStyle(fontSize: 18))
                  ),
                 FlatButton(
                    onPressed: (){
                      Navigator.of(context, rootNavigator: true).pop();
                      showDialog(context: context,
                        builder: (context){
                        return SuccessfulDialogBox(
                          buttonText:'Confirmed' ,
                          title: 'Success',
                          description: 'Job application sent. Good luck!',
                          from: context,
                        );
                        }
                      );
                      widget.user.applyJob(widget.company);       
                    },
                    child: Text('Apply anyway',style: TextStyle(fontSize: 18))
                 )
                ]
              )
            ],
          ),
        ),
      ],
    );
  }
}