import 'package:flutter/material.dart';
import 'constant.dart';
import 'company_card.dart';
import 'company_card2.dart';
import 'company.dart';
import 'job_detail.dart';

class Job extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin:EdgeInsets.only(left:18.0),
        child: SingleChildScrollView(
          child:Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children:<Widget>[
              SizedBox(height: 25.0),
              Text(
                'Hi Kent, \nFind your dream job today!',
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
                              hintText: "Search for job title",
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
                        margin:EdgeInsets.only(left:12.0),
                        decoration: BoxDecoration(
                          color: kBlack,
                          borderRadius:BorderRadius.circular(12.0)
                        ),
                        child: Icon(
                          Icons.segment,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ),
                SizedBox(height:35.0),
                Text(
                  "Popular Company",
                  style:kTitleStyle,
                ),
                SizedBox(height:35.0),
                Container(
                  width: double.infinity,
                  height: 190.0,
                  child: ListView.builder(
                    itemCount:companyList.length,
                    scrollDirection:Axis.horizontal,
                    shrinkWrap:true,
                    physics:BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var company = companyList[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => JobDetail(
                                company: company,
                              ),
                            ),
                          );
                        },
                        child: index == 0
                            ? CompanyCard(company: company)
                            : CompanyCard2(company: company),
                      );
                    },
                  ),
                ),
                SizedBox(height: 35.0,),
                Text(
                  'Latest Jobs',
                  style:kTitleStyle
                ),
                ListView.builder(
                  itemCount:50,
                  scrollDirection:Axis.vertical,
                  shrinkWrap:true,
                  physics:ScrollPhysics(),
                  itemBuilder:(_,index)=>Text('new')
                )
            ],
          )
        )
      ),
    );
  }
}