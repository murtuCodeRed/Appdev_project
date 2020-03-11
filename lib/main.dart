import 'dart:math';
import 'package:flutter/material.dart';
import 'package:app2/HomeImages.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp();

  @override
  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: MyHomePage()
        ),
      theme: ThemeData(
        fontFamily: 'Cabin-bold'
      ),
    );
  }
}

class MyHomePage extends StatelessWidget{

  
  

  @override
  Widget build (BuildContext context){

    List bodyarr = [
    Stack(
        fit: StackFit.expand,
              children: [
                Container(
                  child: Image.asset(
                   'dragonjpeg.jpeg',
                   fit: BoxFit.cover,
                  )
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    height: MediaQuery.of(context).size.height/1.4,
                    width: MediaQuery.of(context).size.width/1.2,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25.0),
                              bottomRight: Radius.circular(25.0),
                            ),
                                            child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 6.0
                              ),
                              borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25.0),
                              bottomRight: Radius.circular(25.0),
                            ),
                            ),
                            alignment: Alignment.centerLeft,
                            child: CachedNetworkImage(
                              placeholder: (context, url) => Container(
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.center,
                                child: Container(
                                  child: Image.asset("mrR.jpg"),
                                ),
                              ),
                              fadeInDuration: Duration(milliseconds: 100),
                              fadeOutDuration: Duration(milliseconds: 100),
                              imageUrl: homeImages[Random.secure().nextInt(6)],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.black87,
                              Colors.black54,
                              Colors.black45,
                              Colors.black38,
                              Colors.black26,
                              Colors.transparent,
                              Colors.transparent,
                              Colors.transparent,
                            ])
                          ),
                        ),
                    // Container(
                    //   width: 60,
                    //   height: 50,
                    //   color: Colors.red.withOpacity(0.1),
                    //   child: IconButton(
                    //       icon: Icon(
                    //         Icons.menu,
                    //         color: Colors.black,
                    //       ),
                    //       onPressed: () {
                    //         _key.currentState.openDrawer();
                    //       }),
                    // )
                  ],
                ),
              ),
            )],
      ),

  ];
        return Scaffold(
      appBar: _buildAppBar(),
      bottomSheet: CustomBottom(),
      //bottomNavigationBar: _bottomNavig(),
      body: bodyarr[bodyindex%1]
    );
  }
  }

  _buildAppBar() {
    return AppBar(
      title: Text(
        (bodyindex==0)?"News Letter":
        (bodyindex==1)?"Directory":
        "Notifications",
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Cabin-bold',
          fontSize: 25,
          ),
      ),
      centerTitle: true,
      backgroundColor: Colors.red,
    );
  }

  _bottomNavig(){
    return BottomNavigationBar(
        fixedColor: Colors.pinkAccent,
        backgroundColor: Colors.white54,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Notifications'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text('Directory'),
          ),
        ],
    );
  }

class CustomBottom extends StatefulWidget{
  _customBottom createState() => _customBottom();
}

  int bodyindex = 0;
class _customBottom extends State<CustomBottom>{

  Widget custicon({IconData icon,int index}){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: IconButton(
        disabledColor: Colors.black87,
        focusColor: Colors.orangeAccent,
              icon: Icon(icon), 
              onPressed: (){
                bodyindex = index;
                print(bodyindex);
              }),
    );
  }
  @override
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60.0,
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        boxShadow: [
          BoxShadow(
            color: Colors.orangeAccent,
            blurRadius: 2.0,
            offset: Offset(0.0, 5.0)
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
            custicon(icon: Icons.home,index: 0),
            custicon(icon: Icons.menu,index: 1),
            custicon(icon: Icons.new_releases,index: 2),
        ],
      ),
    );
  }
}