import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:uas/pages/home_page.dart';
import 'package:uas/pages/list.dart';
import 'package:uas/pages/tambah_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  late DateTime selectedDate;
  late List<Widget> _children;
  late int currentIndex;


  @override
  void initState() {
    // TODO: implement initState
    updateView(0, DateTime.now());
    super.initState();
  }

  
  void updateView (int index, DateTime? date){
    setState(() {
      if (date !=  null){
        selectedDate = DateTime.parse(DateFormat('yyyy-MM-dd').format(date));
      }

      currentIndex = index;
      _children   = [HomePage(selectedDate: selectedDate,), ListPage()];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (currentIndex == 0) ? CalendarAppBar(
        accent: Colors.lightBlueAccent,
        backButton:false,
        locale: 'id',
        onDateChanged: (value) {
          setState(() {
            print('Selected date : '+ value.toString());
            selectedDate = value;
            updateView(0, selectedDate);
          });
        },
        firstDate: DateTime.now().subtract(Duration(days: 140)),
        lastDate: DateTime.now(),
      ) 
      : PreferredSize(preferredSize: Size.fromHeight(100), 
        child: Container(child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
          child: Text ('List',style: GoogleFonts.montserrat(fontSize: 20),),
        ))),
      floatingActionButton: Visibility(
        visible: (currentIndex == 0) ? true : false,
        child: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: 
              (context) =>Tambah(),))
                .then((value){setState(() {});
                });
          }, 
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(Icons.app_registration_rounded ),
          ),
      ),
      body: _children[currentIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: (){
                updateView(0, DateTime.now());
              },
            icon: Icon(Icons.home)),
            SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: (){
                updateView(1, null);
              }, icon: Icon(Icons.list)),

          ],)) ,
    );
  }
}
