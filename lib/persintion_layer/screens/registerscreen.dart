import 'package:e_commerce/persintion_layer/components/my_button.dart';
import 'package:e_commerce/persintion_layer/components/textfiled.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final FocusNode nameFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 90,
          backgroundColor: Colors.blue,
          title: const Text('Register here'),
          centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Stack(children: [
                Container(padding: const EdgeInsets.all(45),
                  alignment: AlignmentDirectional.centerEnd,
                  height: 165,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black26),
                  child:  const Text('upload Image'),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    maxRadius: 75,
                  ),
                ),
              ]),
              const SizedBox(
                height: 12,
              ),
              MyTextFiled(
                focusNode: nameFocus,
                controller: controllerName,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                prefixIcon: Icons.person,
                validatorText: 'must enter your name',
                focusNode2: phoneFocus,
                labelText: 'name',
              ),
              const SizedBox(
                height: 8,
              ),
              MyTextFiled(
                focusNode: phoneFocus,
                controller: controllerPhone,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                prefixIcon: Icons.phone,
                validatorText: 'must enter your phone',
                focusNode2: emailFocus,
                labelText: 'phone',
              ),
              const SizedBox(
                height: 8,
              ),
              MyTextFiled(
                focusNode: emailFocus,
                controller: controllerEmail,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.mail,
                validatorText: 'must enter your email',
                focusNode2: passwordFocus,
                labelText: 'email',
              ),
              const SizedBox(
                height: 8,
              ),
              MyTextFiled(
                focusNode: passwordFocus,
                controller: controllerPassword,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: Icons.password_rounded,
                validatorText: 'must enter your password',
                labelText: 'password',
              ),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(content: Text('Processing Data')),
                      // );
                    }
                  },
                  buttonText: 'Register')
            ]),
          ),
        ),
      ),
    );
  }
}
