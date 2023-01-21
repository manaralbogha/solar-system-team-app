import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:solar_system_team/modules/login_screen/cubit/cubit.dart';
import 'package:solar_system_team/modules/login_screen/cubit/states.dart';
import 'package:solar_system_team/shared/network/local/cache_helper.dart';

import '../../shared/components/text_form_filed_widget.dart';
import '../../shared/const/const.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Center(
        child: Text(
          "SOLAR SYSTEM",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
    return BlocProvider(
      create: ((BuildContext context) => LoginCubit()),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.login.data!.role![0] == "Team") {
              final snackBar = SnackBar(
                  content: Text(
                    "${state.login.message}",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  backgroundColor: Colors.green.shade300);
              CacheHelper.saveData(
                  key: 'token', value: state.login.data!.token!.token);
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              token = CacheHelper.getData(key: 'token');

              Navigator.popAndPushNamed(context, '/HomeSolarSystemTeamScreen');
            } else {
              // ignore: prefer_const_constructors
              final snackBar = SnackBar(
                content: const Text('email not found',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20)),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }
          if (state is LoginErrorState) {
            print(state.errorMassage);

            final snackBar = SnackBar(
              content: Text("${state.errorMassage}",
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
              backgroundColor: Colors.red,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            appBar: appBar,
            body: Form(
              key: cubit.formKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      opacity: 0.4,
                      // colorFilter: ColorFilter.mode(

                      //     Colors.white.withOpacity(0.5), BlendMode.dstATop),
                      // alignment: Alignment.topCenter,

                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/shutterstock_581537176.0.jpg',
                      ),
                    ),
                  ),
                  // height: (MediaQuery.of(context).size.height -
                  //         appBar.preferredSize.height -
                  //         MediaQuery.of(context).padding.top) *
                  //     1,
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.01,
                      ),
                      const Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.08,
                      ),
                      buildTextFormFiled(
                        controller: cubit.emailController,
                        iconPri: Icon(Icons.email),
                        lableText: ('Email'),
                        textType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Email ';
                          }
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return "Please enter a valid email address";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.01,
                      ),
                      buildTextFormFiled(
                        obscureText: cubit.obscureText,
                        lableText: ('Password'),
                        controller: cubit.passwordController,
                        iconPri: Icon(Icons.password),
                        iconSuf: InkWell(
                          child: cubit.obscureText
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                          onTap: () {
                            cubit.changePasswordStatus();
                          },
                        ),
                        textType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                        },
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.470,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          //enableFeedback: true,
                          // splashFactory: NoSplash.splashFactory,
                          // animationDuration: Duration(milliseconds: 100),
                          // fixedSize: MaterialStateProperty.all(
                          //   const Size(double.infinity, 50)),
                          minimumSize: MaterialStateProperty.all(
                              const Size(double.infinity, 50)),
                          overlayColor:
                              MaterialStateProperty.all(Colors.lightGreen),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.userLogIn(
                                email: cubit.emailController.text,
                                password: cubit.passwordController.text);
                          }
                        },
                        child: const Text(
                          'LogIn',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.022,
                      ),
                      // TextButton(
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, '/RegisterScreen');
                      //   },
                      //   child: const Text(
                      //     'NEW ACCOUNT ?',
                      //     style: TextStyle(fontSize: 20),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
