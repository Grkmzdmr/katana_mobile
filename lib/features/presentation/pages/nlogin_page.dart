import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:katana_mobile/core/constants/palette.dart';
import 'package:katana_mobile/features/presentation/components/link_button.dart';
import 'package:katana_mobile/features/presentation/components/login_button.dart';
import 'package:katana_mobile/features/presentation/components/socialmedia_button.dart';
import 'package:flutter/material.dart';
import 'package:katana_mobile/features/presentation/components/login_input.dart';
import 'package:katana_mobile/features/presentation/login_cubit/login_cubit.dart';
import 'package:katana_mobile/features/presentation/pages/home_page.dart';
import 'package:sizer/sizer.dart';

import '../components/show_flusbar.dart';

class NLoginPage extends StatefulWidget {
  const NLoginPage({super.key});

  @override
  State<NLoginPage> createState() => _NLoginPageState();
}

class _NLoginPageState extends State<NLoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final tokenBox = Hive.box("tokenBox");

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            LoginCubit(_usernameController, _passwordController, formKey),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset("assets/images/signin_balls.png"),
                Text(
                  "Hoşgeldin.",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 50.sp),
                ),
                SizedBox(height: 10.h),
                SocialMediaButton(
                  iconPath: "assets/images/g_logo.svg",
                  label: "Google ile giriş yap.",
                  horizontalPadding: 5.w,
                ),
                SizedBox(height: 2.h),
                const Text("Ya da"),
                SizedBox(height: 5.h),
                LoginField(
                  hintText: 'Email',
                  controller: _usernameController,
                  visibility: false,
                ),
                SizedBox(height: 3.h),
                LoginField(
                  hintText: 'Şifre',
                  controller: _passwordController,
                  visibility: true,
                ),
                SizedBox(height: 3.h),
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginEmptyBoxError) {
                      showFlushbar(
                              "Hata", "Kullanıcı adı ve şifre boş bırakılamaz")
                          .show(context);
                    }

                    if (state is LoginError) {
                      showFlushbar("Hatalı Giriş",
                              "Kullanıcı adınızı ve şifrenizi kontrol ediniz.")
                          .show(context);
                    }

                    if (state is LoginFinished) {
                      tokenBox.put("token", state.loginResponseData.data);
                      context.router.replaceNamed("/Home");
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return const CircularProgressIndicator(
                        color: Palette.white,
                      );
                    }
                    return LoginButton(
                      onPressed: () {
                        context.read<LoginCubit>().login(
                              _usernameController.text,
                              _passwordController.text,
                            );
                      },
                    );
                  },
                ),
                LinkButton(text: "Kayıt ol", onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
