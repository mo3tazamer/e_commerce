import 'package:e_commerce/persintion_layer/components/my_button.dart';
import 'package:e_commerce/persintion_layer/components/my_textfiled.dart';
import 'package:e_commerce/persintion_layer/contollers/userBloc/userBloc.dart';
import 'package:e_commerce/persintion_layer/contollers/userBloc/userEvents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/my_snakebar.dart';
import '../contollers/userBloc/userStates.dart';

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
    return BlocConsumer<UserBloc, UserStates>(
      listener: (context, state) {
        if (state is LogInUserSuccess) {
          //print(state);
         mySnakeBar(message: '${state.user.message}', context: context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(backgroundColor: Colors.blue),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Stack(children: [
                        Container(
                          padding: const EdgeInsets.all(45),
                          alignment: AlignmentDirectional.centerEnd,
                          height: 158,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black26),
                          child: const Text('upload Image'),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            maxRadius: 65,
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
                              BlocProvider.of<UserBloc>(context)
                                  .add(RegisterEvent(
                                email: controllerEmail.text,
                                password: controllerPassword.text,
                                name: controllerName.text,
                                phone: controllerPhone.text,
                              ));
                            }
                          },
                          buttonText: 'Register'),
                      const SizedBox(
                        height: 20,
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
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              'LogIn',
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
    );
  }
}
