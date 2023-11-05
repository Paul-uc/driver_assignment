import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String phoneNo;
  final String password;

  const UserModel({
    this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.password,
    required this.phoneNo,
  });

  toJson() {
    return {
      "First Name": firstName,
      "Last Name": lastName,
      "Username": username,
      "Email": email,
      "Phone": phoneNo,
      "Password": password,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      email: data["Email"],
      firstName: data["First Name"],
      lastName: data["Last Name"],
      username: data["Username"],
      password: data["Password"],
      phoneNo: data["Phone"],
    );
  }
}
