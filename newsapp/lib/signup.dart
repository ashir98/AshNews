import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
// import 'package:newsapp/login.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SignUp extends StatefulWidget {
  

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  
  


 
  bool _obscureText = true;
  



  GlobalKey<FormState>  formkey = GlobalKey<FormState>();

        final TextEditingController nameController = TextEditingController();
        final TextEditingController contactController = TextEditingController();
        final TextEditingController emailController = TextEditingController();
        final TextEditingController passwordController = TextEditingController();
        final TextEditingController dobController = TextEditingController();
 

  @override
 
  Widget build(BuildContext context) {
   return Sizer(
      builder: (context,Orientation,DeviceType){




        void register()async{
          FirebaseAuth auth = FirebaseAuth.instance;
          FirebaseFirestore db = FirebaseFirestore.instance;

          final String name = nameController.text;
          final String dob = dobController.text;
          final String contact = contactController.text;
          final String email = emailController.text;
          final String password = passwordController.text;


          try {
            final UserCredential user = await auth.createUserWithEmailAndPassword(email: email, password: password);
            await db.collection("users").doc(user.user?.uid).set({

              "name": name,
              "dob": dob,
              "email": email, 
              "contact": contact, 
              
            });
            Navigator.of(context).pushNamed("/LogIn");
            print("user is registered");
          } catch (e) {
            print(e);
          }


          
          
        }
        


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
                  Colors.purple.withOpacity(0.5),
                  Colors.black,
                ],
               )
             ),
             child: Center(
               child: Column(
                 children: [
                   Container(
                     margin: EdgeInsets.only(top: 10.h),
                     child: Row(
                       
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text('Welome to',style:TextStyle(fontSize: 3.5.h,color: Colors.white)),
                         SizedBox(width: 1.h,),
                         Text('Ash',style:TextStyle(fontSize: 4.5.h,color: Colors.white,fontWeight: FontWeight.bold)),
                         Text('News',style:TextStyle(fontSize: 4.5.h,color: Colors.blue,fontWeight: FontWeight.bold),)
                       ],
                     ),
                   ),
                    
                   Column(
                     children: [
                    
                       Padding(
                            padding:  EdgeInsets.only(top:5.h),
                            child: Text('Sign up now !',style: TextStyle(fontSize: 3.h,fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(height: 3.h,),
                    
                    
                    
                       Form(
                         key: formkey,
                         // ignore: deprecated_member_use
                         autovalidate: true,
                         child: Column(
                    
                           children: [
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<NAME>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>                             

                               Padding(
                               padding:  EdgeInsets.all(2.h),
                               child: TextFormField(

                                 controller: nameController,


                                 validator:(value) {
                                   if(value==null || value.isEmpty){
                                     return "Required";
                                   }else{
                                     return null;
                                   }
                                 },
                                 
                                 
                                 
                    

                                 
                                           textAlign: TextAlign.justify,
                                           style: TextStyle(color: Colors.white, fontSize: 2.h),

                                              cursorRadius: Radius.circular(2.h),
                                              cursorColor: Colors.purple,
                                              cursorHeight: 3.h,

                                           
                                           decoration: InputDecoration(

                                             enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    width: 0.4.h,
                                                    color: Colors.purple
                                                  ),
                                                  borderRadius: BorderRadius.circular(5.h)
                                                ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.h),
                                                borderSide: BorderSide(color: Colors.purple, width: 0.4.h)
                                              ),  
                                              focusedErrorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.h),
                                                borderSide: BorderSide(color: Colors.deepOrange, width: 0.4.h)
                                              ), 

                                              

                                            fillColor: Colors.grey,
                                            filled: true, 
                                            
                                            hintText: 'Enter Full Name',
                                            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                                            prefixIcon: Icon(Icons.person,color: Colors.white.withOpacity(0.5), size: 3.h, ),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(5.h)
                                            )
                                            ),
                                 ),
                             ),



//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<DOB>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


                              Padding(
                               padding:  EdgeInsets.all(2.h),
                               child: TextFormField(
                                 keyboardType: TextInputType.datetime,

                                 controller: dobController,


                                 validator:(value) {
                                   if(value==null || value.isEmpty){
                                     return "Required";
                                   }else{
                                     return null;
                                   }
                                 },
                                 
                                 
                                 
                    

                                 
                                           textAlign: TextAlign.justify,
                                           style: TextStyle(color: Colors.white, fontSize: 2.h),

                                              cursorRadius: Radius.circular(2.h),
                                              cursorColor: Colors.purple,
                                              cursorHeight: 3.h,

                                           
                                           decoration: InputDecoration(

                                             enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    width: 0.4.h,
                                                    color: Colors.purple
                                                  ),
                                                  borderRadius: BorderRadius.circular(5.h)
                                                ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.h),
                                                borderSide: BorderSide(color: Colors.purple, width: 0.4.h)
                                              ),  
                                              focusedErrorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.h),
                                                borderSide: BorderSide(color: Colors.deepOrange, width: 0.4.h)
                                              ), 

                                              

                                            fillColor: Colors.grey,
                                            filled: true, 
                                            
                                            hintText: 'Enter Date of Birth',
                                            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                                            prefixIcon: Icon(Icons.date_range_rounded,color: Colors.white.withOpacity(0.5), size: 3.h, ),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(5.h)
                                            )
                                            ),
                                 ),
                             ),











//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<CONTACT>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


                             
                               Padding(
                               padding:  EdgeInsets.all(2.h),
                               child: TextFormField(

                                 controller: contactController,


                                 validator:(value) {
                                   if(value==null || value.isEmpty){
                                     return "Required";
                                   }else{
                                     return null;
                                   }
                                 },
                                 
                                 
                                 
                    

                                 
                                           textAlign: TextAlign.justify,
                                           style: TextStyle(color: Colors.white, fontSize: 2.h),

                                              cursorRadius: Radius.circular(2.h),
                                              cursorColor: Colors.purple,
                                              cursorHeight: 3.h,
                                              keyboardType: TextInputType.phone,

                                           
                                           decoration: InputDecoration(

                                             enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    width: 0.4.h,
                                                    color: Colors.purple
                                                  ),
                                                  borderRadius: BorderRadius.circular(5.h)
                                                ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.h),
                                                borderSide: BorderSide(color: Colors.purple, width: 0.4.h)
                                              ),  
                                              focusedErrorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.h),
                                                borderSide: BorderSide(color: Colors.deepOrange, width: 0.4.h)
                                              ), 

                                              

                                            fillColor: Colors.grey,
                                            filled: true, 
                                            
                                            hintText: 'Enter Phone Number',
                                            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                                            prefixIcon: Icon(Icons.contact_phone_rounded,color: Colors.white.withOpacity(0.5), size: 3.h, ),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(5.h)
                                            )
                                            ),
                                 ),
                    
                    
                             ),



                             


                            

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<EMAIL>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


                    
                    
                             Padding(
                               padding:  EdgeInsets.all(2.h),
                               child: TextFormField(
                                 keyboardType: TextInputType.emailAddress,

                                 controller: emailController,


                                 validator: (value){
                                   if(value==null || value.isEmpty){
                                     return "Required";
                                   }else if(!value.contains('@')){
                                     return "Enter a valid Email";
                                   }else{
                                     return null;
                                   }
                                 },
                                 

                                 
                                           textAlign: TextAlign.justify,
                                           style: TextStyle(color: Colors.white, fontSize: 2.h),

                                              cursorRadius: Radius.circular(2.h),
                                              cursorColor: Colors.purple,
                                              cursorHeight: 3.h,

                                           
                                           decoration: InputDecoration(

                                             enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    width: 0.4.h,
                                                    color: Colors.purple
                                                  ),
                                                  borderRadius: BorderRadius.circular(5.h)
                                                ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.h),
                                                borderSide: BorderSide(color: Colors.purple, width: 0.4.h)
                                              ),  
                                              focusedErrorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.h),
                                                borderSide: BorderSide(color: Colors.deepOrange, width: 0.4.h)
                                              ), 

                                              

                                            fillColor: Colors.grey,
                                            filled: true, 
                                            
                                            hintText: 'Enter Email',
                                            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                                            prefixIcon: Icon(Icons.email_rounded,color: Colors.white.withOpacity(0.5), size: 3.h, ),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(5.h)
                                            )
                                            ),
                                 ),
                    
                    
                             ),
                                
                                
                                
                                
                    //<<<<<<<<<<<<<<<<<<<<<<<<<<PASSWORD>>>>>>>>>>>>>>>>>>>>>>>            
                                
                                
                                
                                Padding(
                                  padding:  EdgeInsets.all(2.h),
                                  child: TextFormField(


                                    controller: passwordController,
                                    obscureText: _obscureText,


                                    validator: (value){
                                      if(value==null || value.isEmpty){
                                        return "Required";
                                      }else if(value.length<6){
                                        return "Password length should be atleast 6 characters";
                                      }else{
                                        return null;
                                      }
                                    },
                                          
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(color: Colors.white, fontSize: 2.h),
                                              cursorRadius: Radius.circular(2.h),
                                              cursorColor: Colors.purple,
                                              cursorHeight: 3.h,
                                              decoration: InputDecoration(
                                              
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(  width: 0.4.h,color: Colors.purple),
                                                  borderRadius: BorderRadius.circular(5.h)
                                                ),

                                                focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.h),
                                                borderSide: BorderSide(color: Colors.purple, width: 0.4.h)
                                              ),

                                               focusedErrorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.h),
                                                borderSide: BorderSide(color: Colors.deepOrange, width: 0.4.h)
                                              ), 

                                               fillColor: Colors.grey,
                                               filled: true,
                                               hintText: 'Enter Password',
                                               hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                                               prefixIcon: Icon(Icons.vpn_key,color: Colors.white.withOpacity(0.5), size: 3.h, ),
                                               suffixIcon: GestureDetector(
                                                 onTap: (){

                                                   setState(() {
                                                     _obscureText=!_obscureText;
                                                   });
                                                   
                                                   
                                                 },
                                                 child: Icon(_obscureText?Icons.visibility_rounded:Icons.visibility_off_rounded,color: Colors.purple,),
                                                 

                                               ),
                                                 border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(5.h),
                                              
                                            )
                                               ),
                                    ),
                    
                    
                    
                                ),
                                SizedBox(height: 4.h,),
                    
                              ///<<<<<<<<<<<<<<<<<<<<<<<<BUTTON>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                             
                                InkWell(
                                  onTap:(){
                                    if(formkey.currentState!.validate()){
                                      register();
                                    }
                                  } ,


                                  child: Container(
                                    height: 6.h,
                                    width: 15.h,
                                    decoration:  BoxDecoration(
                                      color: Colors.purple,
                                      borderRadius: BorderRadius.circular(5.h)
                                    ),
                                    child: Center(child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 2.h),),),
                                  ),
                                ),
                    
                                SizedBox(height: 2.h,),
                    
                    
                              //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<TEXT>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>                
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Already have an Account?",style: TextStyle(color: Colors.white,fontSize: 2.h),),
                                    TextButton(onPressed: (){Navigator.pushNamed(context, '/LogIn');}, child: Text("Sign In",style: TextStyle(fontSize: 2.5.h,color: Colors.blue,fontWeight: FontWeight.w500)))
                                  ],
                                )
                    
                    
                                
                    
                             
                           ],
                    
                         )),   
                    
                       Container(
                         margin: EdgeInsets.only(top: 20.h),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text('Created By Syed Ashir Ali',style: TextStyle(fontSize: 1.7.h,fontWeight: FontWeight.bold,color: Colors.grey),)
                    
                           ],
                         ),
                       ),
                    
                    
                     ],
                   ),
                 ],
               ),
             ),
           ),
         ),
        
         
        
        
        
        
        );

        

      });
  }
}
