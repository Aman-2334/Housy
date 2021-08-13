part of 'registration_cubit.dart';

class RegistrationState {
  final dynamic name;
  final dynamic email;
  final dynamic password;
  final dynamic profession;
  final dynamic isLoggedIn;

  const RegistrationState(
      {this.name, this.email, this.password, this.profession, this.isLoggedIn});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'profession': profession,
      'isLoggedIn': isLoggedIn,
    };
  }

  factory RegistrationState.fromMap(Map<String, dynamic> map) {
    return RegistrationState(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      profession: map['profession'],
      isLoggedIn: map['isLoggedIn'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegistrationState.fromJson(String source) =>
      RegistrationState.fromMap(json.decode(source));
}
