import 'package:adawal/config/env.dart';
import 'package:adawal/config/locator.dart';
import 'package:adawal/constants/color.dart';
import 'package:adawal/screens/address/address_screen.dart';
import 'package:adawal/view_models/address_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  //this is to get the environment type
  Env.getEnvType(EnvType.dev);
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        builder: (context, child) {
          return ChangeNotifierProvider(create: (_) => AddressProvider(),
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: AppColors.mainColor),
                  useMaterial3: true,
                ),
                home: const AddressScreen()),
          );
        });
  }
}
