import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:katana_mobile/features/presentation/pages/home_page.dart';
import 'package:katana_mobile/features/presentation/pages/nlogin_page.dart';
part 'app_router.gr.dart'; 

@MaterialAutoRouter(

 replaceInRouteName: 'Page,Route',              
  routes: <AutoRoute>[              
    AutoRoute(page: NLoginPage, initial: true,path: "/Login"),              
    AutoRoute(page: HomePage,path: "/Home"),              
  ],       
  
)

class AppRouter extends _$AppRouter{}  