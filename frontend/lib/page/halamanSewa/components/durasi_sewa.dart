import 'package:flutter/material.dart';
import 'package:frontend/page/halamanSewa/components/custom_radio.dart';

class DurasiSewaPage extends StatefulWidget {
  @override
  _DurasiSewaPageState createState() => _DurasiSewaPageState();
}

class _DurasiSewaPageState extends State<DurasiSewaPage> {
  int? _selectedDuration = 1;

  List<Map<String, dynamic>> _durations = [
    {'id': 1, 'text': '1 jam'},
    {'id': 2, 'text': '2 jam'},
    {'id': 3, 'text': '3 jam'},
    {'id': 4, 'text': '4 jam'},
  ];

  @override
  Widget build(BuildContext context) {
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
                  },
                ),
              ),
            )
            .toList(),
      ),
    ]);
  }
}
