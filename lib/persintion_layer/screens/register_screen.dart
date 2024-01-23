import 'package:e_commerce/persintion_layer/contollers/userBloc/userBloc.dart';
import 'package:e_commerce/persintion_layer/contollers/userBloc/userEvents.dart';
import 'package:e_commerce/persintion_layer/contollers/userBloc/userStates.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/routes/route.dart';
import '../widgets/my_button.dart';

import '../widgets/my_snakebar.dart';

import '../widgets/my_textfiled.dart';
import 'home.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerEmail = TextEditingController();
    final TextEditingController controller2 = TextEditingController();
    final TextEditingController controller3 = TextEditingController();
    final TextEditingController controller4 = TextEditingController();

    final formKey = GlobalKey<FormState>();
    bool obscureText = true;

    return BlocProvider(
      create: (context) => UserBloc(),
      child: BlocConsumer<UserBloc, UserStates>(
        listener: (context, state) {
          if (state is RegisterUserSuccess) {
            if (state.message.contains('success')) {
              //mySnakeBar(message: '${state.user.message}', context: context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            } else {
              mySnakeBar(message: state.message, context: context);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Image(
                          fit: BoxFit.fitHeight,
                          height: 180.h,
                          image: const AssetImage(
                            'assets/login.png',
                          ),
                        ),
                        Text('Register Now',
                            style: GoogleFonts.aboreto(fontSize: 30.sp)),
                        SizedBox(
                          height: 10.h,
                        ),
                        MyTextFiled(
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          validatorText: 'please enter correct email',
                          prefixIcon: Icons.supervised_user_circle,
                          hintText: 'enter your email',
                          labelText: 'Mail',
                          controller: controllerEmail,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        StatefulBuilder(
                            builder: (context, setState) => MyTextFiled(
                                  suffixIcon: IconButton(
                                    icon: Icon(obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        obscureText = !obscureText;
                                      });
                                    },
                                  ),
                                  obscureText: obscureText,
                                  prefixIcon: Icons.import_contacts_sharp,
                                  hintText: 'enter your password',
                                  labelText: 'password',
                                  controller: controller2,
                                  validatorText: 'validatorText',
                                  keyboardType: TextInputType.visiblePassword,
                                )),
                        const SizedBox(
                          height: 12,
                        ),
                        MyTextFiled(
                          obscureText: false,
                          keyboardType: TextInputType.name,
                          validatorText: 'please enter correct email',
                          prefixIcon: Icons.supervised_user_circle,
                          hintText: 'enter your name',
                          labelText: 'name',
                          controller: controller3,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        MyTextFiled(
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          validatorText: 'please enter correct phone number',
                          prefixIcon: Icons.supervised_user_circle,
                          hintText: 'enter your phone number',
                          labelText: 'phone number',
                          controller: controller4,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        state is RegisterUserLoading
                            ? const CircularProgressIndicator()
                            : MyButton(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    BlocProvider.of<UserBloc>(context).add(
                                        RegisterEvent(
                                            email: controllerEmail.text,
                                            password: controller2.text,
                                            name: controller3.text,
                                            phone: controller4.text));
                                  }
                                },
                                buttonText: 'Register',
                              ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Have an account?',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                              ),
                            ),
                            SizedBox(
                              width: 5.h,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, AppRoute.login);
                              },
                              child: const Text(
                                'LogIn',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
