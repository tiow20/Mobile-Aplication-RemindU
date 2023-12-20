import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:uas/models/database.dart';

class Tambah extends StatefulWidget {
  const Tambah({super.key});

  @override
  State<Tambah> createState() => _TambahState();
}

class _TambahState extends State<Tambah> {
  final AppDb database = AppDb();
  bool isExpense = true;
  late int type;
  List<String> list = ['Tugas 1', 'Tugas 2', 'Tugas 3'];
  late String dropDownValue = list.first;
  TextEditingController judulController = TextEditingController();
  TextEditingController catatanController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  Category? selectedCategory;

  Future insert(String judul, String catatan, DateTime date, int categoryId)async{
    //insert db
    DateTime now = DateTime.now();
    final row = await database.into(database.notes).insertReturning(NotesCompanion.insert(
      name: judul, 
      categoryid: categoryId, 
      notedate: date,
      ket: catatan, 
      createdAt: now, 
      updateAt: now));
      print('data : ' + row.toString());
  }

   Future <List<Category>> getAllCategory (int type) async {
  return await database.getAllCategoryRepo(type);
 }
 @override
  void initState() {
    // TODO: implement initState
    type = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(title: Text ("Tambah")),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                
            children: [
            Switch(
              value: isExpense, 
              onChanged: (bool value) {
                setState(() {
                  isExpense = value;
                  type = (isExpense) ? 1 :2;
                  selectedCategory = null;
                });
              }, 
              inactiveTrackColor: Colors.blue[200],
              inactiveThumbColor: Colors.blue,
              activeColor: Colors.red,),
              Text(isExpense ? 'Aktivitas' : 'Tugas', style: GoogleFonts.montserrat(fontSize: 14),)
          ],
          ),
          SizedBox(height: 10,),
          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Kategori : ', 
                  style: GoogleFonts.montserrat(fontSize: 16),),
              ),
          FutureBuilder<List<Category>>(
            future: getAllCategory(type),
            builder: (context,snapshot){
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  if(snapshot.data!.length > 0 ){
                    selectedCategory = snapshot.data!.first ;
                    print('Apanih : ' + snapshot.toString());
                    return Padding(
            padding: const EdgeInsets.symmetric(horizontal : 16),
            child: DropdownButton<Category>(
              value: (selectedCategory == null) 
              ? snapshot.data!.first 
              : selectedCategory,
              isExpanded: true,
              icon: Icon(Icons.arrow_downward), 
              items: snapshot.data!.map((Category item ) {
                return DropdownMenuItem<Category>(
                  value: item,
                  child: Text(item.name),
                ); 
              }).toList(), 
                  onChanged: (Category? value){
                    setState(() {
                      selectedCategory = value;
                    });
                  }),
          );
                  }else{
                    return Center(
                    child: Text("data kosong"),
                  );
                  }
                }else {
                  return Center(
                    child: Text("Tidak ada data"),
                  );
                }
              }
            }
            ),
          
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              controller: judulController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(), labelText: "Judul"
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              controller: catatanController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(), labelText: "Catatan"
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              readOnly: true,
              controller: dateController,
              decoration: InputDecoration(
                labelText: "Jatuh Tempo"),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context, 
                    initialDate: DateTime.now(), 
                    firstDate: DateTime(2000), 
                    lastDate: DateTime(2099));
                  if (pickedDate != null){
                    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          
                    dateController.text = formattedDate;
                  }
                },),
          ),
         

          SizedBox( height: 25,),
          Center(
            child: ElevatedButton(
              onPressed: (){
                insert(
                  judulController.text,
                  catatanController.text, 
                  DateTime.parse(dateController.text), 
                  selectedCategory!.id);
                Navigator.pop(context,true);
                
              }, 
              child: 
              Text("Save")))
            ],
          ) ),
      ),);
  }
}