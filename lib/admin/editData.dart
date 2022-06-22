import 'dart:io';

import 'package:ambwproyek/admin/home.dart';
import 'package:ambwproyek/admin/liatMenu.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../dataclass.dart';
import '../menuService.dart';

class EditData extends StatefulWidget {
  final menu? detData;
  final String? kategori;
  final String? id;
  const EditData({Key? key, this.detData, this.kategori, this.id})
      : super(key: key);

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  FilePickerResult? result;
  String? fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileToDisplay;
  final namaMenu = TextEditingController();
  final hargaMenu = TextEditingController();
  String? kategori;
  String? gambarMenu;
  String? idmenu;
  void dispose() {
    namaMenu.dispose();
    hargaMenu.dispose();
    super.dispose();
  }

  @override
  void initState() {
    namaMenu.text = widget.detData?.nama ?? "";
    hargaMenu.text = widget.detData?.harga ?? "";
    gambarMenu = widget.detData?.gambar ?? "";
    kategori = widget.kategori ?? "";
    idmenu = widget.id ?? "";
    super.initState();
  }

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

  Future uploadFotoToStorage() async {
    final path = "menu/$fileName";
    // final file = File(pickedfile!.path.toString());
    final file = File(pickedfile!.path!.toString());

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
    String imageUrl = await ref.getDownloadURL();
    print(imageUrl);
    URL = imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data'),
        backgroundColor: Color(0xFFF0BB62),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
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
                                gambarMenu!.toString(),
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
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: namaMenu,
                  decoration: InputDecoration(
                    labelText: 'Nama Menu',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: hargaMenu,
                  decoration: InputDecoration(
                    labelText: 'Harga Menu',
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
                    uploadFotoToStorage();
                    final dtBaru = menu(
                        nama: namaMenu.text.toString(),
                        harga: hargaMenu.text.toString(),
                        gambar: URL);
                    if (kategori == "makanan") {
                      DatabaseMakanan.updateData(
                          data_makanan: dtBaru, id: idmenu.toString());
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("Your Data has been updated"),
                          content: Text("click ok to continue"),
                          actions: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(ctx);
                              },
                              child: Text("Ok"),
                            ),
                          ],
                        ),
                      );
                    } else if (kategori == "minuman") {
                      print(idmenu.toString());
                      DatabaseMinuman.updateData(
                          data_minuman: dtBaru, id: idmenu.toString());
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("Your Data has been updated"),
                          content: Text("click ok to continue"),
                          actions: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(ctx);
                              },
                              child: Text("Ok"),
                            ),
                          ],
                        ),
                      );
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
        ),
      ),
    );
  }
}
