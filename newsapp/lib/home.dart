import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:newsapp/category.dart';
import 'package:newsapp/model.dart';
import 'package:newsapp/newsview.dart';
import 'package:sizer/sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  /// VARIABLES AND FUNCTIONS

  final List items =[Colors.grey,Colors.black,Colors.blue];

  List<String> navBarItem = ['Top Stories', 'Headlines', 'Popular News', 'Sports News','Entertainment'];

  List<NewsQueryModel> newsModelList = <NewsQueryModel>[];

  List<NewsQueryModel> newsModelListCarousel = <NewsQueryModel>[];

  bool isLoading = true;

  getNewsByQuery(String query)async{
    String url ="https://newsapi.org/v2/everything?q=$query&from=2021-10-13&to=2021-10-23&sortBy=popularity&apiKey=9bca8c8a02fb4e2c8fcce7f2570164a5";
    Response response = await get(Uri.parse(url));
    Map  data = jsonDecode(response.body);
    setState(() {
      data["articles"].forEach((element){

        NewsQueryModel newsQueryModel = new NewsQueryModel();
        newsQueryModel = NewsQueryModel.fromMap(element);
        newsModelList.add(newsQueryModel);
        setState(() {
          isLoading=false;
        });

      });
    });
  }

    getNewsByProvider(String provider)async{
    String url ="https://newsapi.org/v2/top-headlines?sources=$provider&apiKey=9bca8c8a02fb4e2c8fcce7f2570164a5";
    Response response = await get(Uri.parse(url));
    Map  data = jsonDecode(response.body);
    setState(() {
      data["articles"].forEach((element){

        NewsQueryModel newsQueryModel = new NewsQueryModel();
        newsQueryModel = NewsQueryModel.fromMap(element);
        newsModelListCarousel.add(newsQueryModel);
        setState(() {
          isLoading=false;
        });

      });
    });
  }
  



  @override
  void initState(){
    super.initState();
    getNewsByQuery("apple");
    getNewsByProvider("TechCrunch");
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:false,
        
        centerTitle: true,
        backgroundColor: Colors.black54,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Ash',style: TextStyle(color:Colors.white,fontSize: 3.h),),
          Text('News',style: TextStyle(color: Colors.blue,fontSize: 3.h)),
        ],
      )),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
          
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xff1a1a3b),
                  Colors.black,
                ],
          
              )
            ),
          child: Center(
            child: Column(
              
              children: [
                SizedBox(
                  height: 1.h,
                ),
      
      //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<TABS>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>            
                Container(
              height: 6.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: navBarItem.length,
                itemBuilder: (context , index){
                  return InkWell(
                    onTap: (){
      
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Category(Query: navBarItem[index],)));
      
                      
                    },
                    child: Container(
                      
                      
                      alignment: Alignment.center,
                      height: 6.h,
                      
                      
                      padding: EdgeInsets.symmetric(horizontal: 2.h,vertical: 1.h),
                      margin: EdgeInsets.symmetric(horizontal: 0.2.h, ),
                      decoration: BoxDecoration(
                        
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(1.h),
                        
                      ),
                      child: Center(child: Text(navBarItem[index],style: TextStyle(color: Colors.white,fontSize: 2.h),)),
                    ),
                  );
                },)),
      
                 SizedBox(
                  height: 3.h,
                ),
      
      //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<CAROUSEL SLIDER>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  
      
                isLoading? Container(
                  height: 10.h,
                  child: Center(child: CircularProgressIndicator())):CarouselSlider(
                  options: CarouselOptions(
                      height: 25.h, autoPlay: true, enlargeCenterPage: true),
                  items: newsModelListCarousel.map((instance) {
                    return Builder(builder: (BuildContext context) {
                      try{
                      return Container(

                        child : InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsView(instance.newsUrl)));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child : Stack(
                              children : [
                                ClipRRect(
                                  borderRadius : BorderRadius.circular(1.h),
                                  child : Image.network(instance.newsImg , fit: BoxFit.cover, width: double.infinity,)
                                ) ,
                                Positioned(
                                  left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(1.h),
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.black12.withOpacity(0),
                                            Colors.black
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter
                                        )
                                      ),
                                  child : Container(
                                    padding: EdgeInsets.symmetric(horizontal: 0.5.h , vertical: 1.h),
                                    child:Container( margin: EdgeInsets.symmetric(horizontal: 10), child: Text(instance.newsHead , style: TextStyle(fontSize: 1.8.h , color: Colors.white , fontWeight: FontWeight.bold),))
                                  ),
                                  )
                                ),
                              ]
                            )
                          ),
                        )
                      );}catch(e){print(e);return Container();}
                    });
                  }).toList(),
                ),
            SizedBox(
              height: 3.h,
            ),


//<<<<<<<<<<<<<<<<<<<<<<<<<<<TEXT>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.h,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('LATEST NEWS',style: TextStyle(fontSize: 3.h,fontWeight: FontWeight.bold),),
                ],
              ),
            ),

            SizedBox(
              height: 2.h,
            ),
      
      //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<CARD>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>        
      
            
      
      
      
            Container(
          
              child:

              isLoading? CircularProgressIndicator():
               ListView.builder(

                

                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: newsModelList.length,
                itemBuilder: (context , index){

                  try{
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsView(newsModelList[index].newsUrl)));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.5.h),
                  
                  
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.h)
                        ),
                        elevation: 1.0,
                        child: Stack(
                          
                          children: [
                            
                            ClipRRect(
                              borderRadius: BorderRadius.circular(1.h),
                              child: Image.network(newsModelList[index].newsImg )),
                              Positioned(
                                left: 0,bottom: 0,right: 0,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(1.h, 1.5.h, 1.h, 0.5.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1.h),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black.withOpacity(0),
                                      Colors.black
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter
                                  )
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(newsModelList[index].newsHead,style: TextStyle(fontSize: 2.h,fontWeight: FontWeight.bold,color: Colors.white),),
                                    Text( newsModelList[index].newsDes.length > 30 ? "${newsModelList[index].newsDes.substring(0,35)}...." : newsModelList[index].newsDes,style: TextStyle(fontSize: 1.5.h,color: Colors.white))
                                  ],
                                )))
                  
                          ],
                        ),
                      ),
                    ),
                  );}catch(e){print(e);return Container();}
                }
                ),
            ),
            
            SizedBox(
              height: 2.h,
            ),

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<BUTTON>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>          

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(

                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Category(Query: "Technology")));
                  },


                  child: Container(
                    height: 6.h,
                    width: 30.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.h),
                      color: Colors.blue
                      
                    ),
                
                    child: Center(child: Text('SEE MORE',style: TextStyle(color: Colors.white,fontSize: 3.h),)),
                  ),
                )
              ],
            ),

            SizedBox(
              height: 2.h,
            ),
      
            ],
            ),
          ),
        ),
      )
      
 
    );
  }
}

