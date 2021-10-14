
import 'package:flutter/material.dart';
import 'package:newsapp/favourites.dart';
import 'package:newsapp/home.dart';
import 'package:newsapp/login.dart';
import 'package:newsapp/profile.dart';
import 'package:newsapp/search.dart';
import 'package:newsapp/signup.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  
  runApp(MaterialApp(
    theme: ThemeData.dark(),
     
    debugShowCheckedModeBanner: false,
    home: SignUp(),
    routes: {
      '/SignUp':(_)=>SignUp(),
      '/LogIn':(_)=>LogIn(),
      '/Home': (_)=>HomePage(),
      '/NewsApp':(_)=>MyNewsApp()

    },
    

  ));
}

// ignore: must_be_immutable
class MyNewsApp extends StatefulWidget {


  @override
  _MyNewsAppState createState() => _MyNewsAppState();
}

class _MyNewsAppState extends State<MyNewsApp> {

  int currentIndex=0;
  final screens=[

    HomePage(),
    SearchPage(),
    FavouritesPage(),
    ProfilePage()


  ];


  @override
  Widget build(BuildContext context) {
return  Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: screens,) ,

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black54,
          selectedItemColor: Colors.blue,

          unselectedItemColor: Colors.grey,
          currentIndex: currentIndex,
          onTap:(index)=> setState(()=>currentIndex = index,),

          

          items: [
             BottomNavigationBarItem(
              icon: Icon(Icons.home, ),
              label: "Home",
              
      
            ),


             BottomNavigationBarItem(
              icon: Icon(Icons.search, ),
              label: "Search",
              
       
            ),


            BottomNavigationBarItem(
              icon: Icon(Icons.favorite,),
              label: "Favourites",
              
              
            ),


             BottomNavigationBarItem(
              
              icon: Icon(Icons.person, ),
              label: "Profile",
              
              
            ),
          ],
        ),
        
      );

      }
 );
  
}
}