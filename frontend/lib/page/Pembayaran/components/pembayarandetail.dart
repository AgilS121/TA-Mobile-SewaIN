import 'package:flutter/material.dart';
import 'package:frontend/models/members.dart';

class PembayaranDetailScreen extends StatefulWidget {
  final int paymentMethod;
  final String accessToken;
  final Map databarang;
  const PembayaranDetailScreen(
      {super.key,
      required this.paymentMethod,
      required this.accessToken,
      required this.databarang});

  @override
  State<PembayaranDetailScreen> createState() => _PembayaranDetailScreenState();
}

class _PembayaranDetailScreenState extends State<PembayaranDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String paymentText;
    Widget paymentMethodDetails;

    switch (widget.paymentMethod) {
      case 0:
        paymentText = 'Pembayaran COD';
        paymentMethodDetails = Center(
          child: Text('Pembayaran COD'),
        );
        break;
      case 1:
      case 2:
        paymentText = 'Pembayaran melalui eWallet';
        paymentMethodDetails = Center(
          child: Text('Pembayaran melalui eWallet'),
        );
        break;
      case 3:
        paymentText = 'Pembayaran Transfer Bank';
        paymentMethodDetails = Padding(
          padding: EdgeInsets.all(10.0),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Bank',
            ),
            value: 'BRI',
            onChanged: (value) {},
            items: ['BRI', 'BNI', 'BCA']
                .map<DropdownMenuItem<String>>((String bank) {
              return DropdownMenuItem<String>(
                value: bank,
                child: Text(bank),
              );
            }).toList(),
          ),
        );
        break;
      default:
        paymentText = '';
        paymentMethodDetails = Container();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pembayaran'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.0),
          Center(
            child: Text(paymentText),
          ),
          SizedBox(height: 20.0),
          paymentMethodDetails,
          Text('data id' + widget.databarang['id'].toString()),
          Text('data harga' + widget.databarang['total_harga'].toString()),
        ],
      ),
    );
  }
}
