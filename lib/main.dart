import 'package:flutter/material.dart';
import 'package:joseph_website/screen/landing_page.dart';
import 'package:joseph_website/theme/theme_manager.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:joseph_website/theme/theme_constants.dart';

void main() {
  runApp(MyApp());
}

ThemeManager _themeManager = ThemeManager(); // ThemeManager() 사용하기 위한 인스턴스 생성


class MyApp extends StatefulWidget { // 역시 예상대로 StateFulWidget 을 사용
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void dispose() { // tree 에서 완전히 없어질 때 불려진다.
    _themeManager.removeListener(themeListener); // 리스너 해제
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener); // 리스너 등록
    super.initState();
  }

  themeListener(){
    if(mounted){ // tree 에 있으면
      setState(() { // 두개의 StatefulWidget 인데 부모꺼를 어떻게 실행시키는지 보자

      });
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!), // 안드로이드 방법
        // max screen size : 1800
        breakpoints: const [
          ResponsiveBreakpoint.resize(350, name: MOBILE),
          ResponsiveBreakpoint.autoScale(660, name: TABLET),
          ResponsiveBreakpoint.resize(800, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
        ],
      ),
      title: "Joseph's WebPage",
      debugShowCheckedModeBanner: false,
      theme: lightTheme, // 각각 라이트띰
      darkTheme: darkTheme, // 다크띰을 적용
      themeMode: _themeManager.themeMode, // 초기 Theme mode 적용
      home:
      const LandingPage(),
    );
  }
}
