import 'package:e_commerce/persintion_layer/contollers/userBloc/userBloc.dart';
import 'package:e_commerce/persintion_layer/contollers/userBloc/userEvents.dart';
import 'package:e_commerce/persintion_layer/contollers/userBloc/userStates.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/routes/route.dart';
import '../widgets/my_button.dart';
import '../widgets/my_imagelogo.dart';
import '../widgets/my_snakebar.dart';

import '../widgets/my_textfiled.dart';
import 'home.dart';


class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final TextEditingController controller1 = TextEditingController();
    final TextEditingController controller2 = TextEditingController();
    final formKey = GlobalKey<FormState>();
    bool obscureText = true;

    return BlocProvider(
      create: (context) => UserBloc(),
      child: BlocConsumer<UserBloc, UserStates>(
        listener: (context, state) {
          if (state is LogInUserSuccess) {
            if (state.user.status) {
              mySnakeBar(message: '${state.user.message}', context: context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );

            } else {
              mySnakeBar(message: '${state.user.message}', context: context);
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
                        Image(fit:  BoxFit.fitHeight,
                          height: 180.h,

                          image: const AssetImage(
                            'assets/login.png',

                          ),
                        ),
                        Text('Log In',
                            style: GoogleFonts.aboreto(fontSize: 50.sp)),
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
                          controller: controller1,
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
                                  onPressed: () {setState(() {
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
                            )
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        state is LogInUserLoading
                            ? const CircularProgressIndicator()
                            : MyButton(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    BlocProvider.of<UserBloc>(context).add(
                                        LogInUserEvent(
                                            email: controller1.text.trim(),
                                            password: controller2.text.trim()));
                                  }
                                },
                                buttonText: 'Login',
                              ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Expanded(
                                child: Divider(
                              thickness: 2,
                            )),
                            Text(
                              'Or continue With',
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                            const Expanded(
                                child: Divider(
                              thickness: 2,
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyImageLogo(imagePath: 'assets/google.png'),
                            SizedBox(
                              width: 15,
                            ),
                            MyImageLogo(imagePath: 'assets/apple.png'),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Not a member?',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, AppRoute.register);
                              },
                              child: const Text(
                                'Register Now',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
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
