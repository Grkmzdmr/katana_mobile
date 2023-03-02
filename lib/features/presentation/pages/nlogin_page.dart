import 'package:katana_mobile/features/presentation/components/link_button.dart';
import 'package:katana_mobile/features/presentation/components/login_button.dart';
import 'package:katana_mobile/features/presentation/components/socialmedia_button.dart';
import 'package:flutter/material.dart';
import 'package:katana_mobile/features/presentation/components/login_input.dart';
import 'package:sizer/sizer.dart';

class NLoginPage extends StatefulWidget {
  const NLoginPage({super.key});

  @override
  State<NLoginPage> createState() => _NLoginPageState();
}

class _NLoginPageState extends State<NLoginPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/images/signin_balls.png"),
              Text(
                "Hoşgeldin.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.sp),
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
              const LoginField(hintText: 'Email'),
              SizedBox(height: 3.h),
              const LoginField(hintText: 'Şifre'),
              SizedBox(height: 3.h),
              LoginButton(),
              LinkButton(text: "Kayıt ol", onPressed: (){
                
              })

            ],
          ),
        ),
      ),
    );
  }
}
