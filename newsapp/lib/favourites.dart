import 'package:flutter/material.dart';
import 'package:newsapp/category.dart';
import 'package:sizer/sizer.dart';

class FavouritesPage extends StatefulWidget {

  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
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
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF9c116b),
                    Colors.black,
                  ],
            ),
          ),
          child: Column(
            children: [
      
              SizedBox(
                height: 2.h,
              ),
      
      
                          Container(
                margin: EdgeInsets.symmetric(horizontal: 2.h,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('FAVOURITE NEWS',style: TextStyle(fontSize: 3.h,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
      
              SizedBox(
                height: 2.h,
              ),
        
      
      
      
      
              InkWell(
      
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Category(Query: 'pakistan',)));
              },
              child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.h)
                            ),
                            elevation: 1.0,
                            child: Stack(
                              
                              children: [
                                
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(1.h),
                                  child: Image.asset('images/pakistan.jpg')),
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
                                        Text('All of Pakistan',style: TextStyle(fontSize: 2.h,fontWeight: FontWeight.bold,color: Colors.white),),
                                        
                                      ],
                                    )))
                                
                              ],
                            ),
                          ),
      
                          
            ),
      
      
            InkWell(
      
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Category(Query: 'cricket',)));
              },
              child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.h)
                            ),
                            elevation: 1.0,
                            child: Stack(
                              
                              children: [
                                
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(1.h),
                                  child: Image.asset('images/cricket.jpg')),
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
                                        Text('Cricket News',style: TextStyle(fontSize: 2.h,fontWeight: FontWeight.bold,color: Colors.white),),
                                        
                                      ],
                                    )))
                                
                              ],
                            ),
                          ),
            ),
      
      
            InkWell(
      
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Category(Query: 'weather',)));
              },
              child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.h)
                            ),
                            elevation: 1.0,
                            child: Stack(
                              
                              children: [
                                
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(1.h),
                                  child: Image.asset('images/weather.jpg')),
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
                                        Text('Weather News',style: TextStyle(fontSize: 2.h,fontWeight: FontWeight.bold,color: Colors.white),),
                                        
                                      ],
                                    )))
                                
                              ],
                            ),
                          ),
            ),
            ],
          ),),
      ),
    );
  }
}