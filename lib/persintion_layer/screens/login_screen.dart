
import 'package:e_commerce/persintion_layer/contollers/home_bloc.dart';
import 'package:e_commerce/persintion_layer/contollers/userBloc/userBloc.dart';
import 'package:e_commerce/persintion_layer/contollers/userBloc/userEvents.dart';
import 'package:e_commerce/persintion_layer/contollers/userBloc/userStates.dart';
import 'package:e_commerce/persintion_layer/screens/home.dart';
import 'package:e_commerce/persintion_layer/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/my_button.dart';
import '../widgets/my_imagelogo.dart';
import '../widgets/my_snakebar.dart';
import '../widgets/my_textfiled.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode textField1Focus = FocusNode();
    final FocusNode textField2Focus = FocusNode();
    final TextEditingController controller1 = TextEditingController();
    final TextEditingController controller2 = TextEditingController();
    final formKey = GlobalKey<FormState>();
    bool obscureText = true;

    return BlocProvider(create: (context) => UserBloc(),
      child: BlocConsumer<UserBloc, UserStates>(
        listener: (context, state) {
          if (state is LogInUserSuccess  ) {
            if (state.user.status) {
              mySnakeBar(message: '${state.user.message}', context: context);

              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  HomeScreen(),
                  ));
            }else {
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
                        Image(
                          height: 180.h,
                          width: 180.w,
                          image: const AssetImage(
                            'assets/login.jpg',
                          ),
                        ),
                        Text('Log In', style: GoogleFonts.aboreto(fontSize: 50)),
                        SizedBox(
                          height: 10.h,
                        ),
                        MyTextFiled(
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          validatorText: 'please enter correct email',
                          focusNode: textField1Focus,
                          prefixIcon: Icons.supervised_user_circle,
                          hintText: 'enter your email',
                          labelText: 'Mail',
                          controller: controller1,
                          textInputAction: TextInputAction.next,
                          focusNode2: textField2Focus,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        StatefulBuilder(
                          builder: (context, setState) {
                            return MyTextFiled(
                                suffixIcon: IconButton(
                                  icon: Icon(obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(
                                      () {
                                        obscureText = !obscureText;
                                      },
                                    );
                                  },
                                ),
                                obscureText: obscureText,
                                focusNode: textField2Focus,
                                prefixIcon: Icons.import_contacts_sharp,
                                hintText: 'enter your password',
                                labelText: 'password',
                                controller: controller2,
                                textInputAction: TextInputAction.done,
                                validatorText: 'validatorText',
                                keyboardType: TextInputType.visiblePassword);
                          },
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
                                            email: controller1.text,
                                            password: controller2.text));
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterScreen(),
                                    ));
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
