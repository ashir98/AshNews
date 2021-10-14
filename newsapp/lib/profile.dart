import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';





class ProfilePage extends StatefulWidget {
  

  @override
  _ProfilePageState createState() => _ProfilePageState();




  





}

class _ProfilePageState extends State<ProfilePage> {

  String name = "loading...";
  String email = "loading...";
  String contact = "Loading...";
  String dob = "Loading...";



    void getData()async{
    User? user  = await FirebaseAuth.instance.currentUser;
    var vari= await FirebaseFirestore.instance.collection("users").doc(user!.uid).get();
    setState(() {
      name=vari.data()!['name'];
      dob=vari.data()!['dob'];
      email=vari.data()!['email'];
      contact=vari.data()!['contact'];
    });
    
    

    
  }
  @override
  void initState() {
    getData();
    
    super.initState();
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
      body: SingleChildScrollView(
        child: Container(
          height: 100.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
      
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.teal,
                    Colors.black,
                  ],
      
      
            )
          ),
          child: Center(
            child: Container(
              
              
              child: Column(
                children: [
                  SizedBox(height: 2.h,),
                  
      
                                        Container(
                      height: 40.h,
                      width: 45.h,
          
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        color: Colors.teal,
                        child: Center(
                          child: Padding(
                            padding:  EdgeInsets.only(top:3.h),
                            child: Column(
                              children: [
      
                                Text('PROFILE',style: TextStyle(fontSize: 4.h,fontWeight: FontWeight.w500,color: Colors.white),),
      
                                SizedBox(height: 2.h,),
                                
                                Padding(
                                  padding:  EdgeInsets.only(left: 3.h ,right: 5.h),
                                  child: Row(
                                    children: [
                                      Icon(Icons.person, color: Colors.white,size: 4.h,),
                                      SizedBox(width: 1.w,),
                                      Text('Name: ',style: TextStyle(color: Colors.black,fontSize: 2.2.h,fontWeight: FontWeight.w900),),
                                      
      
                                      Text(name,style: TextStyle(fontSize: 2.2.h,color: Colors.white,fontWeight: FontWeight.w600),),
                                    ],
                                  ),
                                ),
      
                          
      
                                
                                SizedBox(height: 2.h,),
      
                                
                                Padding(
                                  padding:  EdgeInsets.only(left: 3.h),
                                  child: Row(
                                    children: [
                                      Icon(Icons.email_rounded, color: Colors.white,size: 4.h,),
                                      SizedBox(width: 1.w,),
                                      Text('Email: ',style: TextStyle(color: Colors.black,fontSize: 2.2.h,fontWeight:FontWeight.w900),),
                                      
      
                                      Text(email,style: TextStyle(fontSize: 2.2.h,color: Colors.white,fontWeight: FontWeight.w600),),
                                    ],
                                  ),
                                ),
      
                                 SizedBox(height: 2.h,),
      
                                 Padding(
                                  padding:  EdgeInsets.only(left: 3.h),
                                  child: Row(
                                    children: [
                                      Icon(Icons.date_range_rounded,color: Colors.white,size: 4.h,),
                                      SizedBox(width: 1.w,),
                                      Text('DOB: ',style: TextStyle(color: Colors.black,fontSize: 2.2.h,fontWeight: FontWeight.w900),),
                                      
      
                                      Text(dob,style: TextStyle(fontSize: 2.2.h,color: Colors.white,fontWeight: FontWeight.w600),),
                                    ],
                                  ),
                                ),
      
                                SizedBox(height: 2.h,),
      
      
      
      
      
      
                                Padding(
                                  padding:  EdgeInsets.only(left: 3.h ,right: 5.h),
                                  child: Row(
                                    children: [
                                      Icon(Icons.contact_phone_rounded,color: Colors.white,size: 4.h,),
                                      SizedBox(width: 1.w,),
                                      Text('Phone: ',style: TextStyle(color: Colors.black,fontSize: 2.2.h,fontWeight: FontWeight.w900),),
                                      
      
                                      Text(contact,style: TextStyle(fontSize: 2.2.h,color: Colors.white,fontWeight: FontWeight.w600),),
                                    ],
                                  ),
                                ),
                                
      
                                SizedBox(height: 2.h,),
      
          
                                
      
      
                           ]
                           ),
                          ),
                        ),
                      ),
                    ),
      
      
                  
      
                  SizedBox(height: 12.h,),
      
                  
      
                
      Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
      
                    onTap: (){
                      FirebaseAuth.instance.signOut().then((value){
                      Navigator.pushNamedAndRemoveUntil(context, '/LogIn', (_) => false);
                                        }).catchError((e){print(e);});
                    },
      
      
                    child: Container(
                      height: 6.h,
                      width: 15.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.h),
                        color: Colors.teal
                        
                      ),
                  
                      child: Center(child: Text('Sign Out',style: TextStyle(color: Colors.white,fontSize: 2.h),)),
                    ),
                  )
                ],
              ),
      
      
      
      
      
                ],
                
              ),
            ),
          ),
        ),
      )
    );
  }
}