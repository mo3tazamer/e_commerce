import 'package:flutter/material.dart';

import '../widgets/my_button.dart';
import '../widgets/my_textfiled.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

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
                Container(
                  height: 165,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black),
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
                controller: controllerName,
                keyboardType: TextInputType.name,
                prefixIcon: Icons.person,
                validatorText: 'must enter your name',
                labelText: 'name',
              ),
              const SizedBox(
                height: 8,
              ),
              MyTextFiled(
                controller: controllerPhone,
                keyboardType: TextInputType.phone,
                prefixIcon: Icons.phone,
                validatorText: 'must enter your phone',
                labelText: 'phone',
              ),
              const SizedBox(
                height: 8,
              ),
              MyTextFiled(
                controller: controllerEmail,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.mail,
                validatorText: 'must enter your email',
                labelText: 'email',
              ),
              const SizedBox(
                height: 8,
              ),
              MyTextFiled(
                controller: controllerPassword,
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
                  buttonText: 'save')
            ]),
          ),
        ),
      ),
    );
  }
}
