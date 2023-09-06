import 'package:flutter/material.dart';
import 'Home.dart';
import 'about.dart';
import 'contact.dart';
import 'events.dart';
import 'merchandise.dart';
import 'my_drawer_header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage=DrawerSections.dashboard;
  @override
  Widget build(BuildContext context) {
    var container;
    if(currentPage == DrawerSections.dashboard){
      container=Home();
    }else if (currentPage == DrawerSections.events){
      container=events();
    }else if (currentPage == DrawerSections.merchandise){
      container=merchandise();
    }else if (currentPage == DrawerSections.contactUs){
      container=contact();
    }else if (currentPage == DrawerSections.aboutUs){
      container=about();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF941D11),
        title: Text("#MAROON SQUAD"),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        //list of menu
        children: [
          menuItem(1,"Home",Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2,"Events",Icons.event_outlined,
              currentPage == DrawerSections.events ? true : false),
          menuItem(3,"Merchandise",Icons.shopping_cart_outlined,
              currentPage == DrawerSections.merchandise ? true : false),
          menuItem(4,"Contact Us",Icons.contact_phone,
              currentPage == DrawerSections.contactUs ? true : false),
          menuItem(5,"About Us",Icons.person,
              currentPage == DrawerSections.aboutUs ? true : false),

        ],
      ),
    );
  }

  Widget menuItem(int id,String title, IconData icon,bool selected){
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: (){
          Navigator.pop(context);
          setState(() {
            if(id ==1){
              currentPage = DrawerSections.dashboard;
            }else if(id==2){
              currentPage = DrawerSections.events;
            }else if(id==3){
              currentPage = DrawerSections.merchandise;
            }else if(id==4){
              currentPage = DrawerSections.contactUs;
            }else if(id==5){
              currentPage = DrawerSections.aboutUs;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.only(top: 20.0,right: 50.0,bottom: 20.0),
          child: Row(
            children: [
              Expanded(child: Icon(
                icon,
                size: 30,
                color: Colors.black,
              ),
              ),
              Expanded(
                flex: 3,
                child: Text(title,style: TextStyle(color: Colors.black,fontSize: 24),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections{
  dashboard,
  events,
  contactUs,
  aboutUs,
  merchandise
}