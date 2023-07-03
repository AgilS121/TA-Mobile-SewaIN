import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/controllers/services/editBarangMemberService.dart';
import 'package:image_picker/image_picker.dart';
import 'package:frontend/controllers/services.dart';
// import 'package:frontend/models/barang.dart';
import 'package:frontend/theme/pallete.dart';
import 'package:http/http.dart' as http;

class EditBarang extends StatefulWidget {
  final Map<String, dynamic> listbarang;
  final String accessToken;

  const EditBarang(
      {Key? key, required this.listbarang, required this.accessToken})
      : super(key: key);

  @override
  _EditBarangState createState() => _EditBarangState();
}

class _EditBarangState extends State<EditBarang> {
  File? _image;
  final picker = ImagePicker();
  int? selectedCategoryId;
  List<dynamic> data = [];
  int? selectedSubCategory;
  List<dynamic> datasub = [];
  TextEditingController nama_barang = TextEditingController();
  TextEditingController deskripsi = TextEditingController();
  TextEditingController harga = TextEditingController();
  TextEditingController stok = TextEditingController();

  List<Map<String, String>> dataInput = [];
  BigInt dataId = BigInt.zero;

  void tambahData(String input) {
    setState(() {
      dataInput.add({"text": input});
    });
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

  Future<void> fetchSubCategories() async {
    final url = Constans.apiUrl + '/subkategori';
    final response = await http.get(Uri.parse(url));
    final jsonData = jsonDecode(response.body);
    final datasubKategori = jsonData['data'];

    print(jsonData);
    setState(() {
      datasub = datasubKategori;
    });
    print(datasub);
  }

  Future<void> getImage(bool isCamera) async {
    final pickedFile = await picker.getImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void fetchData() {
    setState(() {
      nama_barang.text = widget.listbarang['nama_barang'];
      deskripsi.text = widget.listbarang['deskripsi'];
      harga.text = widget.listbarang['harga'].toString();
      stok.text = widget.listbarang['stok'].toString();
      selectedCategoryId = widget.listbarang['kategori'];
      selectedSubCategory = widget.listbarang['subkategori'];
      // _image = File(widget.listbarang['image']);
      dataInput = List<Map<String, String>>.from(
          widget.listbarang['durasi_sewa'].map((durasi) {
        String text = durasi.toString();
        text = text.replaceAll('[', '').replaceAll(']', '');
        text = text.replaceAll('"', '');
        return {'text': text};
      }));
      dataId = widget.listbarang['id'];
    });
    // print('ini id kategori : ${widget.listbarang['image']}');
  }

  @override
  void initState() {
    super.initState();
    fetchCategories();
    fetchSubCategories();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: MyColors.bg),
        title: const Text(
          "Edit Barang",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.black),
        ),
      ),
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: 19, left: 19, bottom: 15, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            'Upload Foto',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 21,
                                color: Colors.black),
                          ),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                GestureDetector(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Icon(
                                        Icons.camera_alt,
                                        color: Colors.black,
                                        size: 35,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Ambil Dari Kamera",
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                    getImage(true);
                                  },
                                ),
                                const SizedBox(height: 10),
                                GestureDetector(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Icon(
                                        Icons.filter,
                                        color: Colors.black,
                                        size: 35,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Pilih Dari Gallery",
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                    getImage(false);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 294,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: MyColors.bg, width: 2),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: _image != null
                              ? Image.file(_image!, fit: BoxFit.cover)
                              : Image.network(Constans.imageUrl +
                                  widget.listbarang['image']),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: nama_barang,
                  decoration: const InputDecoration(
                    labelText: 'Edit Nama Barang',
                    labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 1,
                    ),
                  ),
                  child: TextField(
                    controller: deskripsi,
                    decoration: const InputDecoration(
                      labelText: "Edit Deskripsi Barang",
                      labelStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black),
                      hintText: 'Edit Deskripsi Barang',
                      hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.grey),
                      border: InputBorder.none,
                    ),
                    maxLines: 5,
                  ),
                ),
                const SizedBox(height: 15),
                DropdownButton<int>(
                  value: selectedCategoryId,
                  hint: const Text(
                    'Select Name Kategori',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedCategoryId = value;
                    });
                  },
                  items: data.map<DropdownMenuItem<int>>((list) {
                    return DropdownMenuItem<int>(
                      value: list['id'],
                      child: Text(list['nama_kategori'],
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.black)),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 15),
                DropdownButton<int>(
                  value: selectedSubCategory,
                  hint: const Text('Select Sub Kategori',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black)),
                  onChanged: (value) {
                    setState(() {
                      selectedSubCategory = value;
                    });
                  },
                  items: datasub.map<DropdownMenuItem<int>>((list) {
                    return DropdownMenuItem<int>(
                      value: list['id'],
                      child: Text(list['nama_subkategori'],
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.black)),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: harga,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    labelText: 'Harga',
                    labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: stok,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    labelText: 'Stok',
                    labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Masukkan Data : ',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: ListView.builder(
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
                                      titleTextStyle: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 21,
                                          color: Colors.black),
                                      content: TextField(
                                        onChanged: (value) {
                                          tambahData(value + ' hari');
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
                              child: const Text('Tambah Data',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: Colors.white)),
                            );
                          }
                          final duration = dataInput[index]['text'].toString();
                          final value =
                              duration.replaceAll(RegExp(r'[^0-9]+'), '');
                          final label = '$value hari';
                          return ListTile(
                            title: Text(label),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    padding: const EdgeInsets.only(bottom: 10.0, left: 10, right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        EditBarangMember.barangMember(
                            context,
                            dataId,
                            selectedCategoryId!.toString(),
                            selectedSubCategory!.toString(),
                            nama_barang.text,
                            deskripsi.text,
                            _image!,
                            stok.text,
                            harga.text,
                            dataInput.toString(),
                            widget.accessToken);
                      },
                      child: const Text(
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
          ],
        ),
      ),
    );
  }
}
