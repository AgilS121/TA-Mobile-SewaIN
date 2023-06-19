class Midtrans {
  final BigInt id;
  final BigInt id_sewa;
  final String status;
  final String payment_type;
  final DateTime transaction_time;
  final String gross_amount;
  final String transaction_id;
  final String va_number;
  final String bank;

  Midtrans({
    required this.id,
    required this.id_sewa,
    required this.status,
    required this.payment_type,
    required this.transaction_time,
    required this.gross_amount,
    required this.transaction_id,
    required this.va_number,
    required this.bank,
  });

  factory Midtrans.fromJson(Map<String, dynamic> json) {
    return Midtrans(
        id: BigInt.from(json['id'] ?? 0),
        id_sewa: BigInt.from(json['id_sewa'] ?? 0),
        status: json['status'] ?? '',
        payment_type: json['payment_type'] ?? '',
        transaction_time: json['transaction_time'] ?? '',
        gross_amount: json['gross_amount'] ?? '',
        transaction_id: json['transaction_id'] ?? '',
        va_number: json['va_number'] ?? '',
        bank: json['bank'] ?? '');
  }
}
