import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:masiaf/view/login/login_screen.dart';

import '../core/services/firestore_user.dart';
import '../helper/local_store_data.dart';
import '../model/user_model.dart';
import '../view/control_view.dart';

//بربط بين ال view و ال  model
class AuthViewModel extends GetxController {
  // googleAuth
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // FacebookLogin _facebookLogin = FacebookLogin();
  String? email, password, name;
  final LocalStorageData localStorageData = Get.find();
//ده علشان لما اعمل log in rmail and pass
//ميرجعش ل صفحه الدخول يدخل في الهوم اسكرين علي طول
//rx علشان ال getx
  final Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email;

// for switchListtile
  bool _value = true;
  get value => _value;

  var _userModel;

  get userModel => _userModel;

  String? _userName;
  get userName => _userName;

  @override
  void onInit() {
    //دي لما بستدعي ال كنترولر يعمل حاجه معينه زي يجيب الداتا من النت
    // TODO: implement onInit
    super.onInit();
    //علشان لو حصل اي تغير في الايميل
    _user.bindStream(_auth.authStateChanges());
    if (_auth.currentUser != null) {
      getCurrentUserData(_auth.currentUser!.uid);
    }
// علشان نجيب الاسم
    // localStorageData.getUser.then((value) {
    //   _userName = value!.name;
    // });
    getUserModel();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    // print(googleUser);
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
//علشان في ال فاير بيز يعمل authentication
    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
      // Get.offAll(HomeScreen());
      Get.offAll(const ControlView());
    });
  }

  // void facebookSignInMethod() async {
  //   // final AccessToken result = await FacebookAuth.instance.login();

  //   FacebookLoginResult result = await _facebookLogin.logIn(['email']);
  //   final accessToken = result.accessToken.token;
  //   if (result.status == FacebookLoginStatus.loggedIn) {
  //     final faceCredential = FacebookAuthProvider.credential(accessToken);
  //     await _auth.signInWithCredential(faceCredential).then((user) async {
  //       saveUser(user);
  //     });
  //     Get.to(HomeScreen());
  //   }

  //   // final FacebookAuthCredential facebookAuthCredential =
  //   //     FacebookAuthProvider.credential(result.token);

  //   // await _auth.signInWithCredential(facebookAuthCredential).then((user) {
  //   //   saveUser(user);
  //   // }
  //   // );
  // }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) async {
        getCurrentUserData(value.user!.uid);
      });
      Get.offAll(const ControlView());
    } catch (e) {
      // print(e.message);
      Get.snackbar(
        'Error login account',
        e.toString(),
        // e.message,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        saveUser(user);
      });

      Get.offAll(const ControlView());
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Error login account',
        e.toString(),
        // e.message,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user!.uid,
      email: user.user!.email,

      //الاسم اللي موجود في ال facebook or google
      //لو مكتبتش الاسم
      name: name ?? user.user!.displayName,
      pic: 'default',
    );
    await FireStoreUser().addUserToFireStore(userModel);
    await setUser(userModel);
  }

//عملنا الميثود دي علشان لما الداتا لما تيجي من الفاير بيز نحطها في ال شيرد بيرفرنس علشان لو مسحنا التطبيق ورجعناه تاني يجيب البيانات
  void getCurrentUserData(String uid) async {
    await FireStoreUser().getCurrentUser(uid).then((value) {
      setUser(UserModel.fromJson(value.data() as Map<dynamic, dynamic>));
    });
  }

  setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }

  void logout() async {
    await _auth.signOut();
    Get.offAll(LoginScreen());
  }

  switchListTile(bool value) {
    _value = value;
    update();
  }

  void getUserModel() async {
    await localStorageData.getUser.then((value) {
      _userName = value!.name;
    });
    // await localStorageData.getUser.then((value) {

    //    _userpic = value!.name;
    // });
    update();
  }
}
