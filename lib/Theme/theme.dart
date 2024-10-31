import 'package:flutter/material.dart';
const Color primaryColor = Color(0xFF497DF9);
const Color secondaryColor = Color(0xFF497DF9);
//
const Color a1 = Color(0xFF252531);
const Color textcolor = Color(0xFFffffff);
const Color background_color = Color(0xFF252531);
const Color tab_color = Color(0xFFffffff);
const Color text_color_gray = Color(0xFF808080);
const Color bg_inner_recycler_screen = Color(0xFF2a2d36);
const Color black = Color(0xFF000000);
const Color gray = Color(0xFFA8A8A8);
const Color green = Color(0xFF32CD32);
const Color gray1 = Color(0xFFDFDFE1);
const Color transparent = Color(0x00ffffff);
const Color pink = Color(0xFFF54D6E);
const Color orange = Color(0xFFf17501);
const Color megenta = Color(0xFF2cb0bd);
//
final ThemeData lightTheme = _buildLightTheme();
final ThemeData darkTheme = _buildDarkTheme();
BuildContext context;
ThemeData _buildLightTheme() {
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );
  final ThemeData base = ThemeData(
    appBarTheme: AppBarTheme(
        color: Colors.white,
        brightness: Brightness.dark,
      elevation: 0
    ),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: Color(0xFF787878),
    ),
     bottomAppBarTheme: BottomAppBarTheme(
       elevation: 0,
       color: Colors.white,
     ),
     textTheme: new TextTheme(
       headline1: TextStyle(
         color: Color(0xFF000000),
       ),
       headline2: TextStyle(
         color: Color(0xFF787878),
       ),
       headline3: TextStyle(
         color: Color(0xFFC2C2C2),
       ),
       headline4: TextStyle(
         color: Color(0x80C2C2C2),
       ),
       headline5: TextStyle(
         color: Color(0x40C2C2C2),
       ),
       headline6: TextStyle(
         color: Color(0x20C2C2C2),
       ),
       caption: TextStyle(
         color: Color(0xFF000000),
       ),
       subtitle1: TextStyle(
           color: Color(0xFF000000),

       ),
       subtitle2: TextStyle(
           color: Color(0xFFFFFFFF),
       ),

       // headline2: TextStyle(
       //   color: Color(0xFFF2F2F2),
       // ),
       //For button Text Color
       bodyText1: TextStyle(
           color: Color(0xFFFFFFFF)
       ),
     ),
    primaryTextTheme: TextTheme(
      headline1: TextStyle(
        color: Color(0xFF787878),
      ),
      headline2: TextStyle(
        color: Color(0xFFC2C2C2),
      ),
      headline3: TextStyle(
        color: Color(0x80C2C2C2),
      ),
      headline4: TextStyle(
        color: Color(0x40C2C2C2),
      ),
      headline5: TextStyle(
        color: Color(0xFFECEFF1),
      ),
      headline6: TextStyle(
        color: Color(0x20C2C2C2),
      ),
    ),
    accentTextTheme: TextTheme(
      headline1: TextStyle(
          color: Color(0xFFEF716b)
      ),
      headline2: TextStyle(
          color: Color(0xFF0c0b52)
      ),
      headline3: TextStyle(
          color: Color(0xFF66658a)
      ),
      headline4: TextStyle(
          color: Color(0xAA5c5c8a)
      ),
      headline5: TextStyle(
        color: Color(0xFF497DF9)
      ),
      headline6: TextStyle(
          color: Color(0xFF49BB5F)
      ),
      subtitle1: TextStyle(
        color: Color(0xFF3b5998)
      ),
      subtitle2: TextStyle(
          color: Color(0xFFFBC02D)
      ),
      bodyText1: TextStyle(
        color: Color(0xFFFFFFFF),
      ),
     bodyText2: TextStyle(
       color: Color(0x20C2C2C2),
     ),

    ),
    accentIconTheme: IconThemeData(
        color: Color(0xFF000000)
    ),
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      buttonColor: Color(0xFF000000),
      textTheme: ButtonTextTheme.primary,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      height: 40,
    ),
    //This For button
    buttonColor: Color(0xFF000000),
    // dividerTheme: DividerThemeData(
    //   color:  Color(0x80C2C2C2),
    // ),
    dividerColor: Color(0x80C2C2C2),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
              width: 1, color: Color(0xFFFAFAFA)
          )
      ),
      enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            width: 1, color: Color(0xFFC2C2C2),
          )
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
              width: 1, color: Color(0xFFBDBDBD)
          )
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
              width: 0.5, color: Color(0xFFBDBDBD)
          )
      ),
      errorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
              width: 0.5, color: Color(0xFFBDBDBD)
          )
      ),
      disabledBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
              width: 0.5, color: Color(0xFFBDBDBD)
          )
      ),
    ),
    primarySwatch: myColor,
    cursorColor: Color(0xFF00004d),
    hintColor: Color(0xFFC2C2C2),
    fontFamily: "regular",
    brightness: Brightness.light,
    accentColorBrightness: Brightness.light,
    colorScheme: colorScheme,
    primaryColor: primaryColor,
    indicatorColor: Colors.white,
    toggleableActiveColor: Color(0xFFe57373),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
   // splashFactory: InkRipple.splashFactory,
    accentColor: secondaryColor,
    errorColor: const Color(0xFFB00020),
    //My
    canvasColor: Color(0xFFFFFFFF),
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    backgroundColor:const Color(0xFFFFFFFF),
    bottomAppBarColor: Color(0xFFFFFFFF),
    cardColor: Color(0xFFFFFFFF),

  );
  return base;
}

ThemeData _buildDarkTheme() {
  final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );
  final ThemeData base = ThemeData(
    appBarTheme: AppBarTheme(
        color: Colors.black,
        brightness: Brightness.light
    ),
    primaryIconTheme: IconThemeData(
        color: Colors.white
    ),
    iconTheme: IconThemeData(
        color: Color(0xFFFFFFFF)
    ),
    textTheme: TextTheme(
        caption: TextStyle(
            color: Color(0xFFFFFFFF)
        ),
      subtitle1: TextStyle(
        color: Color(0xFF787878),

      ),
      subtitle2: TextStyle(
        color: Color(0xFFC2C2C2),
      ),
      headline1: TextStyle(
        color: Color(0x80C2C2C2),
      ),
      headline2: TextStyle(
        color: Color(0xFFF2F2F2),
      ),
      headline3: TextStyle(
        color: Color(0xFFF2F2F2),
      ),
      //For button Text Color
      bodyText1: TextStyle(
          color: Color(0xFF000000)
      ),
      //These 3 for devider
      headline4: TextStyle(
        color: Color(0xFFC2C2C2),
      ),
      headline5: TextStyle(
        color: Color(0x80C2C2C2),
      ),
      headline6: TextStyle(
        color: Color(0x20C2C2C2),
      ),

    ),
    accentTextTheme: TextTheme(

      subtitle1: TextStyle(
        color: Color(0xFFdb4437),
      ),
      subtitle2: TextStyle(
        color: Color(0xFF3b5998),
      ),
      headline1: TextStyle(
          color: Color(0xFFFF6F00)
      ),
      headline2: TextStyle(
          color: Color(0xFF000000)
      ),
      bodyText1: TextStyle(
        color: Color(0xFFFFFFFF),
      ),
      bodyText2: TextStyle(
        color: Color(0xFFFFFFFF),
      ),

    ),
    accentIconTheme: IconThemeData(
        color: Color(0xFFFFFFFF)
    ),
    popupMenuTheme: PopupMenuThemeData(
        color: Color(0xFF252531)
    ),
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      buttonColor: Color(0xFFFFFFFF),
      textTheme: ButtonTextTheme.primary,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      height: 40,
    ),
    //This For button
    buttonColor: Color(0xFFFFFFFF),
    dividerColor: Color(0x80C2C2C2),
    inputDecorationTheme: InputDecorationTheme(
      border: UnderlineInputBorder(
          borderSide: BorderSide(
              width: 1, color: Color(0xFFFAFAFA)
          )
      ),
      enabledBorder:  UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1, color: Color(0xFFC2C2C2),
          )
      ),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              width: 1, color: Color(0xFFBDBDBD)
          )
      ),
      focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              width: 0.5, color: Color(0xFFBDBDBD)
          )
      ),
      errorBorder:  UnderlineInputBorder(
          borderSide: BorderSide(
              width: 0.5, color: Color(0xFFBDBDBD)
          )
      ),
      disabledBorder:  UnderlineInputBorder(
          borderSide: BorderSide(
              width: 0.5, color: Color(0xFFBDBDBD)
          )
      ),
    ),
    cursorColor: Color(0xFFFFFFFF),
    hintColor: Color(0xFFC2C2C2),
    fontFamily: "regular",
    brightness: Brightness.light,
    accentColorBrightness: Brightness.light,

    primaryColor: primaryColor,
    indicatorColor: Colors.white,
    toggleableActiveColor: Color(0xFF00E676),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    splashFactory: InkRipple.splashFactory,
    accentColor: secondaryColor,
    errorColor: const Color(0xFFB00020),
    dialogBackgroundColor: Color(0xFF424242),
    primarySwatch: myColor,
    primaryColorDark: const Color(0xFF000000),
    primaryColorLight: secondaryColor,
    //
    canvasColor: const Color(0xFF000000),
    scaffoldBackgroundColor: const Color(0xFF000000),
    backgroundColor: const Color(0xFFFFFFFF),
    cardColor: Color(0xFF2a2d36),
  );

  return base ;
}

//final changeColor = ChangeColor();
const  MaterialColor myColor = const MaterialColor(
    0xFF497DF9,
    const <int, Color>{
      50: const Color(0xFF497DF9),
      100: const Color(0xFF497DF9),
      200: const Color(0xFF497DF9),
      300: const Color(0xFF497DF9),
      400: const Color(0xFF497DF9),
      500: const Color(0xFF497DF9),
      600: const Color(0xFF497DF9),
      700: const Color(0xFF497DF9),
      800: const Color(0xFF497DF9),
      900: const Color(0xFF497DF9),
    }
);