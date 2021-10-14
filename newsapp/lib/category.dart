import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:newsapp/model.dart';
import 'package:newsapp/newsview.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class Category extends StatefulWidget {

  String Query;
  Category({required this.Query});
  

  @override 
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  

   List<NewsQueryModel> newsModelList = <NewsQueryModel>[];
    bool isLoading = true;


    getNewsByQuery(String query)async{
String url="";

      if(query=="Top Stories"){
         url ="https://newsapi.org/v2/everything?q=story&from=2021-10-13&to=2021-10-23&sortBy=popularity&apiKey=9bca8c8a02fb4e2c8fcce7f2570164a5";
      }else if(query=="Headlines"){
        url = "https://newsapi.org/v2/everything?q=headlines&from=2021-10-10&to=2021-10-23&sortBy=popularity&apiKey=9bca8c8a02fb4e2c8fcce7f2570164a5";
      }
      else if(query=="Popular News"){
        url="https://newsapi.org/v2/everything?q=popular&from=2021-10-13&to=2021-10-23&sortBy=popularity&apiKey=9bca8c8a02fb4e2c8fcce7f2570164a5";
      }
      else if(query == "Sports News"){
        url="https://newsapi.org/v2/everything?q=sports&from=2021-10-13&to=2021-10-23&sortBy=popularity&apiKey=9bca8c8a02fb4e2c8fcce7f2570164a5";

      }else if(query=="Entertainment"){
        url = "https://newsapi.org/v2/everything?q=entertainment&from=2021-10-13&to=2021-10-23&sortBy=popularity&apiKey=9bca8c8a02fb4e2c8fcce7f2570164a5";
      }

      
      
      else{
        url="https://newsapi.org/v2/everything?q=$query&from=2021-10-06&to=2021-10-23&sortBy=popularity&apiKey=9bca8c8a02fb4e2c8fcce7f2570164a5";
      }


    
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

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getNewsByQuery(widget.Query);
  }



  @override
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
    
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.h,vertical: 3.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(widget.Query,style: TextStyle(fontSize: 3.h,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          
        
        
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<CARD>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>        
        
            
        
        
        
            Container(
      
              
              
          
              child:

              isLoading?CircularProgressIndicator():
          
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
          ],
        ),
      )
    
    );
  }
}