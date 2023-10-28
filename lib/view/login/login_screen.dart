import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masiaf/view/login/register_screen.dart';

import '../../constant.dart';
import '../../view_model/auth_view_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_button_social.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_formfield.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      text: 'Welcome',
                      fontSize: 30,
                    ),
                    //ده تكست لما ادوس عليها يعمل حاجه
                    GestureDetector(
                      child: const CustomText(
                        text: 'Sign Up',
                        fontSize: 18,
                        color: PrimaryColor,
                      ),
                      onTap: () {
                        Get.to(RegisterView());
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  text: 'Sign in to continue',
                  fontSize: 14,
                  color: Colors.grey,
                  alignment: Alignment.topLeft,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  text: 'Email',
                  hint: 'Email',
                  onSave: (value) {
                    controller.email = value.toString().trim();
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  text: 'Password',
                  hint: '*************',
                  onSave: (value) {
                    controller.password = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: 'ForgotPassword?',
                  alignment: Alignment.topRight,
                  fontSize: 14,
                ),
                const SizedBox(
                  height: 18,
                ),
                CustomButten(
                  text: 'SiGN IN',
                  onPressed: () {
                    _formKey.currentState!.save();
                    if (_formKey.currentState!.validate()) {
                      controller.signInWithEmailAndPassword();
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: '-OR-',
                  alignment: Alignment.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButtenSocial(
                  text: 'Sign In with Facebook',
                  imageName: 'assets/images/facebook.png',
                  onPressed: () {
                    // controller.facebookSignInMethod();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButtenSocial(
                  text: 'Sign In with Google',
                  imageName: 'assets/images/google.png',
                  onPressed: () {
                    controller.googleSignInMethod();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
