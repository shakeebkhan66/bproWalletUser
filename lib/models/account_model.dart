class Account {
  final String holderName;
  final String accountNumber;
  final String bankName;
  bool? accountStatus;

  Account({
    required this.holderName,
    required this.accountNumber,
    required this.bankName,
    this.accountStatus
  });

  factory Account.fromFirestore(Map<String, dynamic> data) {
    return Account(
      holderName: data['accountHolderName'],
      accountNumber: data['accountNumber'],
      bankName: data['accountMethodType'],
      accountStatus: data['accountStatus']
    );
  }
}
