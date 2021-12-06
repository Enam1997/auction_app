
import 'package:auction_app/Screen/AddProductForm/addproduct_screen.dart';
import 'package:auction_app/Screen/Analytics/analytics_screen.dart';
import 'package:auction_app/Screen/Dashbord/dashbord_screen.dart';
import 'package:auction_app/Screen/Galllery/galley_screen.dart';
import 'package:auction_app/Screen/Profile/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomeScreen>{
  var currentIndex=0;
  final pages =[
    GalleryScreen(),
    DashbordScreen(),
    AddProoductScreen(),
    AnalyticsScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),
            title: Text("Gallery"),backgroundColor: kPrimaryColor,),
        BottomNavigationBarItem(icon: Icon(Icons.dashboard),
            title: Text("Dashboard"),backgroundColor: kPrimaryColor,),
        BottomNavigationBarItem(icon: Icon(Icons.add),
            title: Text("Post"),backgroundColor: kPrimaryColor,),
        BottomNavigationBarItem(icon: Icon(Icons.analytics),
            title: Text("Analytics"),backgroundColor: kPrimaryColor,),
        BottomNavigationBarItem(icon: Icon(Icons.people),
            title: Text("Profile"),backgroundColor: kPrimaryColor,)
      ],
        onTap: (index){
          setState((){
            currentIndex= index;
          });
        },
      ),
      body: pages[currentIndex],
    );
  }
  
  
  
}