import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

mixin LoginApi {
  Future<bool> doLogin(String email, String password);
  Future<bool> registerUser(String email, String password);
  Future<bool> isLogged();

  Future<bool> doLogout();
}

@Injectable(as: LoginApi)
class LoginApiAdapter implements LoginApi {
  var firebaseAuth = FirebaseAuth.instance;

  @override
  Future<bool> doLogin(String email, String password) async {
    try {
      final credentials =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> registerUser(String email, String password) async {
    try {
      final credentials =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> isLogged() async {
    return firebaseAuth.currentUser != null;
  }

  @override
  Future<bool> doLogout() async {
    try {
      await firebaseAuth.signOut();
      return true;
    } catch (_) {
      return false;
    }
  }
}
