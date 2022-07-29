import 'package:flutter/material.dart';
import 'package:joseph_website/screen/widgets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(

      // Scroll 을 위해서 ListView 를 사용했고
      padding: const EdgeInsets.fromLTRB(0, 35, 0, 35),
      children: const [
        Center(child: PageHeader()),
        // 그림은 따로 줄인다고 해놓지 않았네... 앞에서 글로벌하게 변경하는 건가?
        SizedBox(
          height: 30, // 아마도 여기서도 공간을 조건에 맞게 줄일 수 있는 여지가 있겠네.. 위젯을 밖으로 빼서,
        ),
/*
              ResponsiveRowColumn( // QnALayout // 이걸 컨테이너의 일종이라고 생각하니깐 좀 쉽게 접근되는구나.
                rowMainAxisAlignment: MainAxisAlignment.end,
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
                      child: ContentTile(tileData: tileData[0])),
                  ResponsiveRowColumnItem(
                      rowFlex: 1, child: ContentTile(tileData: tileData[1])),
                ],
              ),
*/
        Center(child: Text("JOSEPH (JUWON) LEE", style: TextStyle(fontSize: 20),)),
        SizedBox(
          height: 30,
        ),
        Center(child: SizedBox(height: 1, width: 40 ,child: Divider())),
        SizedBox(
          height: 30,
        ),
        Center(child: Text("REGISTERED PRACTICAL NURSE", style: TextStyle(fontSize: 12),)),
        SizedBox(
          height: 30,
        ),
        Center(child: SizedBox(height: 1, child: Divider())),
        SizedBox(
          height: 30,
        ),
        Center(child: PageFooter()),

      ],
    );
  }
}
