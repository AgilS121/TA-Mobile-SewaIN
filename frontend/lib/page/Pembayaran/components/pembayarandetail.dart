import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/controllers/services.dart';
import 'package:frontend/controllers/tokenManager.dart';
import 'package:frontend/models/members.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';

class PembayaranDetailScreen extends StatefulWidget {
  final int paymentMethod;
  final String accessToken;
  final Map<String, dynamic> databarang;

  const PembayaranDetailScreen(
      {Key? key,
      required this.paymentMethod,
      required this.accessToken,
      required this.databarang})
      : super(key: key);

  @override
  State<PembayaranDetailScreen> createState() => _PembayaranDetailScreenState();
}

class _PembayaranDetailScreenState extends State<PembayaranDetailScreen> {
  String virtualAccount = '';
  bool isLoading = false;
  String selectedBank = 'BRI';
  String id = '';
  String totalHarga = '';
  String name = '';
  String email = '';
  bool isButtonClicked = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchVirtualAccount() async {
    final tokenManager = TokenManager();
    tokenManager.accessToken = widget.accessToken;
    const url = Constans.apiUrl + '/midtrans/buy';
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${tokenManager.accessToken}'
    };

    setState(() {
      isLoading = true;
    });
    try {
      final response = await http.post(Uri.parse(url), headers: headers, body: {
        "name": widget.databarang['name'],
        "email": widget.databarang['email'],
        "id_sewa": widget.databarang['id'].toString(),
        "total_harga": widget.databarang['harga_total'].toString(),
        "bank": selectedBank
      });

      if (response.statusCode == 200) {
        final virtualAccountData = jsonDecode(response.body);
        final vaNumber = virtualAccountData['va_numbers'][0]['va_number'];
        print('sukses');
        setState(() {
          virtualAccount = vaNumber;
          isLoading = false;
        });
      } else {
        // Handle error response
        print('gagal ${response.body} || ${response.statusCode}');
        setState(() {
          virtualAccount = '';
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error : $e');
    }
  }

  void handleBayarButton() {
    // Call your Laravel API to initiate payment process
    // and handle the payment logic

    // Refresh the page to show the updated virtual account
    fetchVirtualAccount();

    // Set isButtonClicked to true to hide the button
    setState(() {
      isButtonClicked = true;
    });
  }

  void handleCopyVirtualAccount() {
    Clipboard.setData(ClipboardData(text: virtualAccount));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Virtual Account copied to clipboard')),
    );
  }

  void handleMidtransSimulatorButton() {
    String simulatorUrl;

    switch (selectedBank) {
      case 'BRI':
        simulatorUrl = 'https://simulator.sandbox.midtrans.com/bri/va/index';
        break;
      case 'BNI':
        simulatorUrl = 'https://simulator.sandbox.midtrans.com/bni/va/index';
        break;
      case 'BCA':
        simulatorUrl = 'https://simulator.sandbox.midtrans.com/bca/va/index';
        break;
      default:
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebView(
          initialUrl: simulatorUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('ini pembayaran detail scree ${widget.databarang['harga_total']}');
    print(
        'ini data data ${widget.databarang['name']} || ${widget.databarang['email']} || ${widget.databarang['id'].toString()} || ${widget.databarang['harga_total']} || $selectedBank');
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
            value:
                selectedBank, // Menggunakan selectedBank sebagai nilai default
            onChanged: (value) {
              setState(() {
                selectedBank =
                    value!; // Memperbarui selectedBank saat dropdown berubah
              });
            },
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Center(
              child: Text(paymentText),
            ),
            SizedBox(height: 20.0),
            paymentMethodDetails,
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: isButtonClicked ? null : handleBayarButton,
              child: Text('Bayar'),
              style: ElevatedButton.styleFrom(
                primary: isButtonClicked ? Colors.transparent : Colors.blue,
              ),
            ),
            SizedBox(height: 20.0),
            isLoading
                ? CircularProgressIndicator()
                : Column(
                    children: [
                      Text('Virtual Account: $virtualAccount'),
                      SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: handleCopyVirtualAccount,
                        child: Text('Copy Virtual Account'),
                      ),
                    ],
                  ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: handleMidtransSimulatorButton,
              child: Text('Midtrans Simulator'),
            ),
          ],
        ),
      ),
    );
  }
}
