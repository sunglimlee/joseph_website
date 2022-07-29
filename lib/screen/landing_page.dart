import 'package:flutter/material.dart';
import 'package:joseph_website/screen/about.dart';
import 'package:joseph_website/screen/contact.dart';
import 'package:joseph_website/screen/widgets.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:joseph_website/screen/home.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  var bodyForPage = 'HOMESCREEN';

  @override
  Widget build(BuildContext context) {
    // 자 아주 중요하다. 내가 원하는대로 되는지 보자. 갑자기 데이터를 주고 받는게 헷갈린다.

    //List<TileData> tileData = TileData.staticTileData;
    return SizedBox( // QnAAppbar Appbar 의 사이즈를 정하는 부분
      width: 1200,
      child: Scaffold(
        // 여기서부터 작업을 해야하는데 뭐부터 해야할 지 모르겠다는 거지.. 값을 ResponsiveWidget 에 맞게 넣어주어야 하는데..
        appBar: PreferredSize( // appBar 베스트
          preferredSize: Size.fromHeight(ResponsiveValue(
            context,
            defaultValue: 70.0,
            valueWhen: const [
              Condition.smallerThan(
                name: MOBILE,
                value: 60.0,
              ),
              Condition.largerThan(
                name: TABLET,
                value: 100.0,
              )
            ],
          ).value!),
          child: CustomAppBar(
            width: 1200, toggleViewFunction: toggleScreenForBody,
          ),
        ),
        body: Center(
          child: SizedBox(width: 1270,
            // Scaffold 의 Body 부분이다. 여기가 중요한 부분이지. 근데 너무 짧은데??
            child: navigationForBody(bodyForPage),
          ),
        ),
      ),
    );
  }
  void toggleScreenForBody(String param) {
    setState(() {
      bodyForPage = param;
    } );
  }

  Widget navigationForBody(String param) {
    switch(param) {
      case 'ABOUTSCREEN' : {
        return const AboutScreen();
      }
      case 'CONTACTSCREEN' : {
        return const ContactScreen();
      }
      default : {
        return const HomeScreen();
      }
    }
  }
}


