
import 'package:flutter/material.dart';
import 'package:newsapp/category.dart';
import 'package:sizer/sizer.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        
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
            height: 100.h,
          
          
            decoration: BoxDecoration(
              gradient: LinearGradient(
          
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xff1d2951),
                  Colors.black,
                ],
          
              )
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
                    Text('SEARCH NEWS',style: TextStyle(fontSize: 3.h,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
      
             


          //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<SEARCH BAR>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                Center(
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 2.h),
                      
                      
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          textInputAction: TextInputAction.search,
                          onSubmitted: (value){
                             if (value==""){
                                    print("BLANK SEARCH");
                                  }else{
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Category(Query:value)));
                                  }
          
                          },
                          
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search_rounded),
                            hintText: "Search News",
                            fillColor: Colors.grey,
                            filled: true,
                            border: OutlineInputBorder(
          
          
                              borderRadius: BorderRadius.circular(5.h),
                              borderSide: BorderSide(
                                color: Colors.indigo,
                                width: 0.4.h
                              ),
                            ),
          
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.h),
                              borderSide: BorderSide(
                                color: Colors.indigo,
                                width: 0.4.h
                              ),
                            ),
          
                            enabledBorder :OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.h),
                              borderSide: BorderSide(
                                color: Colors.indigo,
                                width: 0.4.h,
                              )
                            )
                            
          
                            
                          ),
                        ),
                      )),
                ),
                SingleChildScrollView(
                  child: Container(
                    
                    height:50.h,
                    width: 50.h,
                    child: Image.asset("images/logo.gif") ,),
                )
              ],
            ),
          ),
        ));
  }
}
