import 'dart:convert';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'registration_state.dart';

class RegistrationCubit extends HydratedCubit<RegistrationState> {
  RegistrationCubit()
      : super(RegistrationState(
            name: "",
            email: "",
            password: "",
            profession: "",
            isLoggedIn: false));

  void saveDataLocally(name, email, password, profession, status) {
    print('Data saved locally');
    try {
      emit(
        RegistrationState(
            name: name,
            email: email,
            password: password,
            profession: profession,
            isLoggedIn: status),
      );
    } catch (e) {
      print("Error updating data $e");
    }
  }

  List getLocaldata() {
    return [state.name, state.password];
  }

  void updateLoginStatus(status) {
    print('login status updated');
    emit(
      RegistrationState(
          name: state.name,
          email: state.email,
          password: state.password,
          profession: state.profession,
          isLoggedIn: status),
    );
  }

  bool loginValidity() {
    return state.isLoggedIn;
  }

  @override
  RegistrationState fromJson(Map<String, dynamic> json) =>
      RegistrationState.fromMap(json);

  @override
  Map<String, dynamic> toJson(RegistrationState state) => state.toMap();
}
