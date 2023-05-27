import 'package:flutter/material.dart';
import 'package:frontend/page/halamanSewa/components/custom_radio.dart';

class DurasiSewaPage extends StatefulWidget {
  final List<List<String>> durasi_sewa;
  final ValueChanged<int>? onChanged;

  const DurasiSewaPage({super.key, required this.durasi_sewa, this.onChanged});
  @override
  DurasiSewaPageState createState() => DurasiSewaPageState();
}

class DurasiSewaPageState extends State<DurasiSewaPage> {
  int? _selectedDuration = 1;

  // List<Map<String, dynamic>> _durations = [
  //   {'id': 1, 'text': '1 jam'},
  //   {'id': 2, 'text': '2 jam'},
  //   {'id': 3, 'text': '3 jam'},
  //   {'id': 4, 'text': '4 jam'},
  // ];
  List<Map<String, dynamic>> _durations = [];

  @override
  void initState() {
    super.initState();
    _durations = [];
    _selectedDuration = getSelectedDuration();
    int id = 1;
    for (var listDurasi in widget.durasi_sewa) {
      for (var durasi in listDurasi) {
        String text = durasi.toString();
        text = text.replaceAll('[', '').replaceAll(']', '');
        text = text.replaceAll('"', '');
        _durations.add({'id': id, 'text': text});
        id++;
      }
    }
  }

  int convertDurationToInteger(String duration) {
    String text = duration.replaceAll(
        RegExp(r'[^0-9]'), ''); // Menghapus karakter non-numerik
    int value = int.tryParse(text) ??
        0; // Mengubah string menjadi integer, nilai default 0 jika tidak dapat di-parse
    return value;
  }

  int getSelectedDuration() {
    return _selectedDuration!;
  }

  @override
  Widget build(BuildContext context) {
    print("ini selected : ${_selectedDuration}");
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Durasi Sewa',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
      SizedBox(height: 10),
      Column(
        children: _durations
            .map(
              (duration) => ListTile(
                onTap: () {
                  setState(() {
                    _selectedDuration = duration['id'];
                  });
                },
                title: Text(duration['text']),
                trailing: CustomRadio(
                  value: duration['id'],
                  groupValue: _selectedDuration!,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedDuration = value!;
                    });
                    widget.onChanged?.call(value!);
                  },
                ),
              ),
            )
            .toList(),
      ),
    ]);
  }
}
