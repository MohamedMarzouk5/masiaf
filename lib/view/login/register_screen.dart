import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masiaf/model/user_model.dart';

import '../../view_model/auth_view_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_formfield.dart';
import 'login_screen.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserModel user = UserModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        //leading ده علشان يظهر الزرار اللي بيرجع
        leading: GestureDetector(
            onTap: () {
              Get.off(LoginScreen());
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const CustomText(
                text: "Sign Up,",
                fontSize: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                text: 'Name',
                hint: 'Pesa',
                onSave: (value) {
                  controller.name = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                text: 'Email',
                hint: 'iamdavid@gmail.com',
                onSave: (value) {
                  controller.email = value.toString().trim();
                },
              ),
              const SizedBox(
                height: 40,
              ),
              CustomTextFormField(
                text: 'Password',
                hint: '**********',
                onSave: (value) {
                  controller.password = value;
                },
                // validator: (value) {
                //   if (value == null) {
                //     print('error');
                //   }
                // },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButten(
                onPressed: () {
                  _formKey.currentState!.save();

                  if (_formKey.currentState!.validate()) {
                    controller.createAccountWithEmailAndPassword();
                  }
                },
                text: 'SIGN Up',
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
