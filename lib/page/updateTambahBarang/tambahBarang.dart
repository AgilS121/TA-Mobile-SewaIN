import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/services/addBarangMemberService.dart';
import 'package:frontend/controllers/services/kategoriService.dart';
import 'package:frontend/models/kategori.dart';
import 'package:image_picker/image_picker.dart';
import 'package:frontend/theme/pallete.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;

class TambahBarang extends StatefulWidget {
  final String accessToken;
  const TambahBarang({Key? key, required this.accessToken}) : super(key: key);

  @override
  State<TambahBarang> createState() => _TambahBarangState();
}

class _TambahBarangState extends State<TambahBarang> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File? _image;
  // final picker = ImagePicker();
  // String? _imageName;

  int? selectedCategoryId; // Menyimpan ID kategori yang dipilih
  List<dynamic> data = [];
  int? selectedSubCategory;
  List<dynamic> datasub = [];
  TextEditingController nama_barang = TextEditingController();
  TextEditingController deskripsi = TextEditingController();
  TextEditingController harga = TextEditingController();
  TextEditingController stok = TextEditingController();

  List<String> dataInput = [];

  void tambahData(String input) {
    setState(() {
      dataInput.add(input);
    });
  }

  void dispose() {
    nama_barang.dispose();
    deskripsi.dispose();
    harga.dispose();
    stok.dispose();
    super.dispose();
  }

  Future<void> fetchCategories() async {
    final url = Constans.apiUrl + '/kategori';
    final response = await http.get(Uri.parse(url));
    final jsonData = jsonDecode(response.body);
    final dataKategori = jsonData['data'];

    print(jsonData);
    setState(() {
      data = dataKategori;
    });
    print(data);
  }

  Future<void> fetchsubCategories() async {
    final url = Constans.apiUrl + '/subkategori';
    final response = await http.get(Uri.parse(url));
    final jsonData = jsonDecode(response.body);
    final datasubKategori = jsonData['data'];

    print(jsonData);
    setState(() {
      datasub = datasubKategori;
    });
    print(data);
  }

  Future<void> getImage() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCategories();
    fetchsubCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: MyColors.bg),
        elevation: 0,
      ),
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.only(right: 19, left: 19, bottom: 15),
      child: Form(
        key: _formKey,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Column(
            children: [
              // GestureDetector(
              //   onTap: () {
              //     showDialog(
              //       context: context,
              //       builder: (BuildContext context) {
              //         return AlertDialog(
              //           title: Text('Upload Foto'),
              //           content: SingleChildScrollView(
              //             child: ListBody(
              //               children: <Widget>[
              //                 // GestureDetector(
              //                 //   child: Text('Ambil dari Kamera'),
              //                 //   onTap: () {
              //                 //     Navigator.pop(context);
              //                 //     getImage(true);
              //                 //   },
              //                 // ),
              //                 SizedBox(height: 10),
              //                 GestureDetector(
              //                   child: Text('Pilih dari Galeri'),
              //                   onTap: () {
              //                     Navigator.pop(context);
              //                     getImage();
              //                   },
              //                 ),
              //               ],
              //             ),
              //           ),
              //         );
              //       },
              //     );
              //   },
              //   child: Container(
              //     height: 294,
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       border: Border.all(color: MyColors.bg, width: 2),
              //     ),
              //     child: Center(
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Icon(Icons.cloud_upload),
              //           SizedBox(height: 10),
              //           Text('Upload Foto', style: TextStyle(fontSize: 14)),
              //           if (_image != null)
              //             Image.file(_image!, height: 300.0, width: 300.0)
              //           else
              //             Container(),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                    image: _image == null
                        ? null
                        : DecorationImage(
                            image: FileImage(_image ?? File('')),
                            fit: BoxFit.cover)),
                child: Center(
                  child: IconButton(
                      onPressed: () {
                        getImage();
                      },
                      icon: Icon(
                        Icons.image,
                        size: 50,
                        color: Colors.black38,
                      )),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: nama_barang,
                decoration: InputDecoration(
                  labelText: 'Nama Barang',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 1,
                  ),
                ),
                child: TextField(
                  controller: deskripsi,
                  decoration: InputDecoration(
                    hintText: 'Deskripsi Barang',
                    border: InputBorder.none,
                  ),
                  maxLines: 5,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              DropdownButton<int>(
                value: selectedCategoryId,
                hint: Text('Select Name Kategori'),
                onChanged: (value) {
                  setState(() {
                    selectedCategoryId = value;
                  });
                },
                items: data.map<DropdownMenuItem<int>>((list) {
                  return DropdownMenuItem<int>(
                    value: list['id'],
                    child: Text(list['nama_kategori']),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 15,
              ),
              DropdownButton<int>(
                value: selectedSubCategory,
                hint: Text('Select Sub Kategori'),
                onChanged: (value) {
                  setState(() {
                    selectedSubCategory = value;
                  });
                },
                items: datasub.map<DropdownMenuItem<int>>((list) {
                  return DropdownMenuItem<int>(
                    value: list['id'],
                    child: Text(list['nama_subkategori']),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: harga,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: 'Harga',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              TextField(
                controller: stok,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: 'Stok',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Masukkan Data : ',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: dataInput.length + 1,
                    itemBuilder: (context, index) {
                      if (index == dataInput.length) {
                        return ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Tambah Data'),
                                  content: TextField(
                                    onChanged: (value) {
                                      tambahData(value + 'hari');
                                      Navigator.pop(context);
                                    },
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: const Text('Tambah Data'),
                        );
                      }
                      return ListTile(
                        title: Text(dataInput[index]),
                      );
                    },
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 50,
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      AddBarangMember.addBarang(
                          context,
                          selectedCategoryId!.toString(),
                          selectedSubCategory!.toString(),
                          nama_barang.text,
                          deskripsi.text,
                          _image!,
                          stok.text,
                          harga.text,
                          dataInput.toString(),
                          widget.accessToken);
                      // print(selectedCategoryId.toString());
                      // print(selectedSubCategory.toString());
                      // print(nama_barang.toString());
                      // print(deskripsi.toString());
                      print('ini data gambar');
                      print(_image);
                      // print(stok.toString());
                      // print(harga.toString());
                      // print(dataInput.toString());
                    },
                    child: Text(
                      'Simpan',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    ));
  }
}
