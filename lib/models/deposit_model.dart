class DepositModel {
  final String userId;
  final String username;
  final double amount;
  final String typeOfAmount;
  final String paymentType;
  String image;
  final String status;
  final String stateOfUser;
  final String accountNumber;
  final String bProAccountUserName;
  final String bProAccountPassword;
  final DateTime timestamp;

  DepositModel({
    required this.userId,
    required this.username,
    required this.amount,
    required this.typeOfAmount,
    required this.paymentType,
    required this.image,
    required this.status,
    required this.stateOfUser,
    required this.accountNumber,
    required this.bProAccountUserName,
    required this.bProAccountPassword,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'username': username,
      'amount': amount,
      'typeOfAmount': typeOfAmount,
      'paymentType': paymentType,
      'image': image,
      'status': status,
      'stateOfUser': stateOfUser,
      'accountNumber': accountNumber,
      'bProAccountUserName': bProAccountUserName,
      'bProAccountPassword': bProAccountPassword,
      'timestamp': timestamp,
    };
  }
}
