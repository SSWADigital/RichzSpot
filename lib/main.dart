import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import 'package:homital/HomePageTabs/HomeScreen.dart';
import 'package:homital/UI/BasicHeathScreen.dart';
import 'package:homital/UI/tampilan.dart';
import 'package:homital/admin/home_admi.dart';
import 'package:homital/pengguna/home_pengguna.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:homital/Account/Signin.dart';
import 'Theme/theme.dart';
import 'UI/HomePage.dart';
import 'UI/IntroducationScreen.dart';
import 'bloc/theme_change_bloc.dart';
import 'bloc/theme_change_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();

  runApp(MyApp());
}

String iduser;

String st_jab;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Color(0xFFFFFFFF),
      // Color for Android
      statusBarBrightness: Brightness.dark,
      // Dark == white status bar -- for IOS.
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color(0xFFFFFFFF),
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    FlutterStatusbarcolor.setStatusBarColor(Color(0xFFFFFFFF));
    FlutterStatusbarcolor.setNavigationBarColor(Color(0xFFFFFFFF));
    // ignore: missing_required_param
    return BlocProvider<ThemeChangeBloc>(
      create: (_) => ThemeChangeBloc(),
      child: BlocBuilder<ThemeChangeBloc, ThemeChangeState>(
          builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "RichzSpot",
          home: //SignIn(), //HomePage(),
              //  iduser == null ? HomePage() : IntroducationScreen(),

              FutureBuilder(
                  future: _ambildata(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ),
                      );
                    } else {
                      if (iduser == null) {
                        return SignIn();
                      } else {
                        if (st_jab != "T") {
                          return HomePagePengguna();
                        } else {
                          return HomePageAdmin();
                        }
                      }
                      // return iduser == null
                      //     ? IntroducationScreen()
                      //     : HomePagePengguna();
                    }
                  }),
          themeMode: state.themeState.themeMode,
          darkTheme: darkTheme,
          theme: lightTheme,
        );
      }),
    );
  }
}

Future<void> _ambildata() async {
  final prefs = await SharedPreferences.getInstance();

  iduser = (prefs.get('pegawai_id'));
  st_jab = (prefs.get('role_kode'));
  print(iduser);
  return iduser;
}
