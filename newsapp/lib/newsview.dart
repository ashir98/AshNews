

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:sizer/sizer.dart';


// ignore: must_be_immutable
class NewsView extends StatefulWidget { 
  
  String url ;
  NewsView(this.url);





  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {

  late String finalUrl;
  final Completer<WebViewController> controller = Completer<WebViewController>();

  @override

  void initState(){

    super.initState();
    if (widget.url.toString().contains("http://")){
      finalUrl = widget.url.toString().replaceAll("http://", "https://");
    }else{
      finalUrl = widget.url;
    }

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


      body: Container(
        child: WebView( 
          initialUrl : finalUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController){

            setState((){
              controller.complete(webViewController);
            });


          }




        ),
      ),


    );

    



  }
}