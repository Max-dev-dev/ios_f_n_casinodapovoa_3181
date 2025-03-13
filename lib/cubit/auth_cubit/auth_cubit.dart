import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_cubit.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isLoggedIn,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String phoneNumber,
  }) = _AuthState;
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState()) {
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final firstName = prefs.getString('firstName') ?? '';
    final lastName = prefs.getString('lastName') ?? '';
    final phoneNumber = prefs.getString('phoneNumber') ?? '';

    if (firstName.isNotEmpty && phoneNumber.isNotEmpty) {
      emit(AuthState(
          isLoggedIn: true,
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber));
    }
  }

  Future<void> login(
      String firstName, String lastName, String phoneNumber) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstName', firstName);
    await prefs.setString('lastName', lastName);
    await prefs.setString('phoneNumber', phoneNumber);

    emit(AuthState(
        isLoggedIn: true,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber));
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('firstName');
    await prefs.remove('lastName');
    await prefs.remove('phoneNumber');

    emit(const AuthState());
  }
}
