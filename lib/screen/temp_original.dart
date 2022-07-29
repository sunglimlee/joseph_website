import 'package:flutter/material.dart';
import 'package:joseph_website/data/dummy_data.dart';
import 'package:joseph_website/screen/about.dart';
import 'package:joseph_website/screen/widgets.dart';
import 'package:responsive_framework/responsive_framework.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  /* QnA
  Appbar 의 width 정하는 방법
   */
  @override
  Widget build(BuildContext context) {
    //List<TileData> tileData = TileData.staticTileData;
    return Scaffold(
      // 여기서부터 작업을 해야하는데 뭐부터 해야할 지 모르겠다는 거지.. 값을 ResponsiveWidget 에 맞게 넣어주어야 하는데..
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: const Color(0xffFFFFFF),
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: const Color(0xffd4d4d4),
              height: 1.0,
            ),
          ),
          centerTitle: true,
          title: CustomAppBar(),
          leading: ResponsiveVisibility(
            // CheckThisOut 이 부분을 새롭게 보이게 할 것인지 정의하네
            hiddenWhen: const [Condition.largerThan(name: TABLET)], // 이럴때는 감추어라.
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
          ),
          actions: [
            // CheckThisOut
            const ResponsiveVisibility(
              visible: false,
              visibleWhen: [Condition.largerThan(name: TABLET)],
              child: MenuTextButton(titleText: 'Courses'),
            ),
            const ResponsiveVisibility(
              visible: false,
              visibleWhen: [Condition.largerThan(name: TABLET)],
              child: MenuTextButton(titleText: 'About'),
            ),
            IconButton(
              icon: const Icon(Icons.mark_email_unread_rounded),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.logout_rounded),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Center(
        // Scaffold 의 Body 부분이다. 여기가 중요한 부분이지. 근데 너무 짧은데??
        child: ListView(
          // Scroll 을 위해서 ListView 를 사용했고
          padding: const EdgeInsets.all(15.0),
          children: [
            const Center(child: PageHeader()),
            // 그림은 따로 줄인다고 해놓지 않았네... 앞에서 글로벌하게 변경하는 건가?
            const SizedBox(
              height: 30, // 아마도 여기서도 공간을 조건에 맞게 줄일 수 있는 여지가 있겠네.. 위젯을 밖으로 빼서,
            ),
            ResponsiveRowColumn(
              // 이부분이 압권이다. ResponsiveRowColumn 이란게 있네 // CheckThisOut
              rowMainAxisAlignment: MainAxisAlignment.center,
              rowPadding: const EdgeInsets.all(30),
              columnPadding: const EdgeInsets.all(30),
              layout: ResponsiveWrapper.of(context).isSmallerThan(
                  DESKTOP) // 카드 사이즈 상관없이 화면사이즈를 기준으로 Row 인지 Column 인지 정하는구나.
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              children: [
                ResponsiveRowColumnItem(
                  // 그래서 여기에 적용해야 할 자식들을 여기다 넣어주고
                    rowFlex: 1,
                    child: ContentTile(content: JobDescription())),
                ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: ContentTile(content: WhatRPNDo())),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(child: PageFooter()),
          ],
        ),
      ),
    );
  }
}
