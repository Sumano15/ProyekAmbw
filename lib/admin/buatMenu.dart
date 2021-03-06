import 'dart:io';

// ignore_for_file: prefer_const_constructors
import 'package:ambwproyek/admin/liatMenu.dart';
import 'package:ambwproyek/dataclass.dart';
import 'package:ambwproyek/menuService.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

void main() async {
  await Firebase.initializeApp();
}

class BuatMenu extends StatefulWidget {
  final menu? detailMenu;
  const BuatMenu({Key? key, this.detailMenu}) : super(key: key);

  @override
  State<BuatMenu> createState() => _BuatMenuState();
}

class _BuatMenuState extends State<BuatMenu> {
  FilePickerResult? result;
  String? fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileToDisplay;

  final _namaMenuController = TextEditingController();
  final _hargaController = TextEditingController();

  void pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });

      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'jpeg'],
        allowMultiple: false,
      );

      if (result != null) {
        fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        fileToDisplay = File(pickedfile!.path.toString());
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  String URL = "";

  Future uploadFotoToStorage(String _nama, String _harga, String _value) async {
    final path = "menu/$fileName";
    final file = File(pickedfile!.path!.toString());

    Reference ref = FirebaseStorage.instance.ref().child(path);
    await ref.putFile(file);
    await ref.getDownloadURL().then((value) {
      URL = value;
       final dtBaru = menu(nama: _nama, harga: _harga, gambar: URL);
      print('yang bawah ${dtBaru.gambar}');
      print('yang bawah nama ${dtBaru.nama}');
      print('yang bawah harga ${dtBaru.harga}');

      if (_value == "Makanan") {
        DatabaseMakanan.addData(data_makanan: dtBaru);
      } else if (_value == "Minuman") {
        DatabaseMinuman.addData(data_minuman: dtBaru);
      }
    });

  }

  final items = ['Makanan', 'Minuman'];
  String? value;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (fileToDisplay == null)
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: Image.network(
                            "https://i0.wp.com/www.charitycomms.org.uk/wp-content/uploads/2019/02/placeholder-image-square.jpg?ssl=1",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                if (fileToDisplay != null)
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: Image.file(
                            fileToDisplay!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      size: 30,
                    ),
                    onPressed: () {
                      pickFile();
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButton<String>(
              borderRadius: BorderRadius.circular(10),
              itemHeight: 50,
              hint: Text("Kategori"),
              value: value,
              isExpanded: true,
              items: items.map(buildMenuItem).toList(),
              onChanged: (value) {
                setState(() {
                  this.value = value;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _namaMenuController,
              decoration: InputDecoration(
                labelText: 'Nama Menu',
                labelStyle: TextStyle(fontSize: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _hargaController,
              decoration: InputDecoration(
                labelText: 'Harga',
                labelStyle: TextStyle(fontSize: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(240, 188, 98, 1),
                fixedSize: const Size(200, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text("Menu Sudah Ditambahkan"),
                    content: Text("click ok to continue"),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Ok"),
                      ),
                    ],
                  ),
                );
                if (value == "Makanan") {
                  uploadFotoToStorage(_namaMenuController.text, _hargaController.text, value!);
                } else if (value == "Minuman") {
                  uploadFotoToStorage(_namaMenuController.text, _hargaController.text, value!);
                }
                
              },
              child: Text(
                'Add Menu',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Text(item),
    );
  }
}
