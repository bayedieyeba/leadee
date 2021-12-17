import 'package:firebase_auth/firebase_auth.dart';
import 'package:leadeetuto/models/UserModel.dart';

class UserService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<UserModel> get user {
    return _auth.authStateChanges().asyncMap((user) => UserModel(
          uid: user!.uid,
          email: user.email!,
          password: '',
        ));
  }

  Future<UserModel> auth(UserModel userModel) async {
    UserCredential userCredential;
    //UserCredential userCredential = await _auth.signInAnonymously();
    try {
      userCredential = await _auth.signInWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
    } catch (e) {
      userCredential = await _auth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
    }
    userModel.setUid = userCredential.user!.uid;
    return userModel;
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }
}
