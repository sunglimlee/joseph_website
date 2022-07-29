import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:joseph_website/screen/widgets.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // Scroll 을 위해서 ListView 를 사용했고
      padding: const EdgeInsets.fromLTRB(0, 35, 0, 35),
      children: [
        ResponsiveRowColumn(
          rowMainAxisAlignment: MainAxisAlignment.center,
          rowPadding: const EdgeInsets.all(5),
          columnPadding: const EdgeInsets.all(5),
          layout: ResponsiveWrapper.of(context).isSmallerThan(
                  DESKTOP) // 카드 사이즈 상관없이 화면사이즈를 기준으로 Row 인지 Column 인지 정하는구나.
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          children: const [
            ResponsiveRowColumnItem(
                rowFlex: 1,
                child: ContentTile(content: ContactContentPicture())),
            ResponsiveRowColumnItem(
                rowFlex: 1, child: ContentTile(content: ContactContent())),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        const Center(child: SizedBox(height: 1, child: Divider())),
        const SizedBox(
          height: 30,
        ),
        const Center(child: PageFooter()),
      ],
    );
  }
}

///////////////////////// About Contents ////////////////////////////////////

class ContactContentPicture extends StatelessWidget {
  const ContactContentPicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // 자식들 균등하게 padding 할 때 베스트
      spacing: 20, // to apply margin in the main axis of the wrap
      runSpacing: 20, // to apply margin in the cross axis of the wrap
      children: [
        Center(
            child: Image.asset(
          'assets/images/contact_content.jpg',
          width: 600.0,
          height: 240.0,
          fit: BoxFit.cover,
        )),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class ContactContent extends StatelessWidget {
  const ContactContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // 자식들 균등하게 padding 할 때 베스트
      spacing: 20, // to apply margin in the main axis of the wrap
      runSpacing: 20, // to apply margin in the cross axis of the wrap
      children: [
        Center(
          child: Column(
            children: [
              Text.rich(
                style: TextStyle(
                    fontSize: ResponsiveValue(
                  // 여기서 ResponsiveValue 를 적용했다. // CheckThisOut
                  context,
                  defaultValue: 18.0,
                  valueWhen: const [
                    Condition.largerThan(
                      // 여러개의 조건이 들어갈 수 있네
                      name: TABLET,
                      value: 22.0,
                    ),
                    Condition.smallerThan(
                      // 이름에 따른 조건을 정해서 값을 변경하고
                      name: MOBILE,
                      value: 14.0,
                    ),
                  ],
                ).value),
                const TextSpan(
                  text: 'C O N T A C T',
                ),
              ),
              Text.rich(
                style: TextStyle(
                    fontSize: ResponsiveValue(
                  // 여기서 ResponsiveValue 를 적용했다. // CheckThisOut
                  context,
                  defaultValue: 14.0,
                  valueWhen: const [
                    Condition.largerThan(
                      // 여러개의 조건이 들어갈 수 있네
                      name: TABLET,
                      value: 16.0,
                    ),
                    Condition.smallerThan(
                      // 이름에 따른 조건을 정해서 값을 변경하고
                      name: MOBILE,
                      value: 12.0,
                    ),
                  ],
                ).value),
                const TextSpan(
                  text: 'Joseph',
                ),
              ),
            ],
          ),
        ),
        RichText(
          text: const TextSpan(
            children: [
/*
              WidgetSpan(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(1, 10, 10, 0),
                  child: Icon(
                    Icons.developer_mode_sharp,
                  ),
                ),
              ),
*/
            ],
          ),
        ),
        Text(
          "You are about to take the first step contacting the world best nurse. "
          "\n",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: ResponsiveValue(
              // 여기서 ResponsiveValue 를 적용했다. // CheckThisOut
              context,
              defaultValue: 16.0,
              valueWhen: const [
                Condition.largerThan(
                  // 여러개의 조건이 들어갈 수 있네
                  name: TABLET,
                  value: 18.0,
                ),
                Condition.smallerThan(
                  // 이름에 따른 조건을 정해서 값을 변경하고
                  name: MOBILE,
                  value: 12.0,
                ),
              ],
            ).value,
            //color: Colors.black,
            //fontWeight: FontWeight.w500
          ),
        ),
        TextButton(
          onPressed: () => html.window.open('https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=joseph.patriot@gmail.com', "_blank"),
          child: Text("joseph.patriot@gmail.com", style: TextStyle(
            fontSize: ResponsiveValue(
              // 여기서 ResponsiveValue 를 적용했다. // CheckThisOut
              context,
              defaultValue: 16.0,
              valueWhen: const [
                Condition.largerThan(
                  // 여러개의 조건이 들어갈 수 있네
                  name: TABLET,
                  value: 18.0,
                ),
                Condition.smallerThan(
                  // 이름에 따른 조건을 정해서 값을 변경하고
                  name: MOBILE,
                  value: 12.0,
                ),
              ],
            ).value,
            //color: Colors.black,
            //fontWeight: FontWeight.w500

          )

          ),
        ),
        const SizedBox(
          height: 80,
        ),
      ],
    );
  }
}
