import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas/models/database.dart';
import 'package:uas/models/notes_with_categories.dart';


class HomePage extends StatefulWidget {
  final DateTime selectedDate;
  const HomePage({Key? key, required this.selectedDate }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AppDb database = AppDb();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Container(
                        child: Icon(Icons.indeterminate_check_box_sharp, color: Colors.green,),
                        decoration: BoxDecoration(color: Colors.white, 
                        borderRadius: BorderRadius.circular(8)),
                      ),
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tugas", 
                            style: GoogleFonts.montserrat( color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),), 
                          SizedBox(height: 10,),
                          
                        ],
                      )
                    ],),
                    Row(children: [
                      Container(
                        child: Icon(Icons.indeterminate_check_box_sharp, color: Colors.red,),
                        decoration: BoxDecoration(color: Colors.white, 
                        borderRadius: BorderRadius.circular(8)),
                      ),
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Aktivitas", 
                            style: GoogleFonts.montserrat( color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),), 
                          SizedBox(height: 10,),
                          
                        ],
                      )
                    ],)
                  ],

                ),
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(16)
                ),
              ),
            ),
            StreamBuilder<List<NotesWithCategory>>(
                stream: database.getNotesByDateRepo(widget.selectedDate),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      if (snapshot.data!.length > 0) {
                        return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Card(
                                  elevation: 10,
                                  child: ListTile(
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: () {}),
                                        SizedBox(
                                          width: 10,
                                        ),
                                                                              ],
                                    ),
                                    
                                    leading: Container(
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: (snapshot.data![index].category
                                                    .type ==
                                                1)
                                            ? Icon(
                                                Icons.download,
                                                color: Colors.blue[400],
                                              )
                                            : Icon(
                                                Icons.upload,
                                                color: Colors.red[400],
                                              )),
                                   
                                  ),
                                ),
                              );
                            });
                      } else {
                        return Center(
                          child: Column(children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text("Belum ada transaksi",
                                style: GoogleFonts.montserrat()),
                          ]),
                        );
                      }
                    } else {
                      return Center(
                        child: Text("Belum ada transaksi"),
                      );
                    }
                  }
                })
          ],
        ),           
    
          )
        
    );
  }
}