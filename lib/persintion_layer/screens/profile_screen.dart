import 'package:e_commerce/core/cachehelper/cachehelper.dart';
import 'package:e_commerce/core/theme/color_manager.dart';
import 'package:e_commerce/persintion_layer/widgets/my_snakebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/routes/route.dart';
import '../contollers/userBloc/userBloc.dart';
import '../contollers/userBloc/userEvents.dart';
import '../contollers/userBloc/userStates.dart';
import '../widgets/my_button.dart';
import '../widgets/profile_text.dart';

class ProFileScreen extends StatelessWidget {
  const ProFileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(ProFileUserEvent()),
      child: BlocConsumer<UserBloc, UserStates>(
        listener: (context, state) {
          if (state is LogoutUserSuccess) {
            mySnakeBar(context: context, message: state.message);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: UserBloc.profileData != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorManager.primary,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                width: MediaQuery.of(context).size.width * .7,
                                height: MediaQuery.of(context).size.height * .3,
                              ),
                              CircleAvatar(
                                radius: 80,
                                foregroundImage: NetworkImage(
                                    (UserBloc.profileData!.data!.image) ?? ''),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ProFileText(
                          text:
                              'User Name: ${UserBloc.profileData!.data!.name}',
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ProFileText(
                          text: 'Phone: ${UserBloc.profileData!.data!.phone}',
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ProFileText(
                          text: 'Email: ${UserBloc.profileData!.data!.email}',
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ProFileText(
                          text: 'Payment',
                        ),
                        Padding(
                          padding:  EdgeInsets.all(8.0.w),
                          child: MyButton(
                            buttonText: 'Sign Out',
                            onTap: () {
                              CacheHelper.removeData(key: 'token');
                              BlocProvider.of<UserBloc>(context)
                                  .add(LogoutUserEvent());
                              Navigator.pushReplacementNamed(
                                  context, AppRoute.login);
                            },
                          ),
                        ),
                      ])
                : const Center(
                    child: Center(child: CircularProgressIndicator())),
          );
        },
      ),
    );
  }
}
