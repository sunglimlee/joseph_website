import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';



class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key, width, toggleViewFunction}) : _width = width, _toggleViewFunction = toggleViewFunction, super(key: key);
  double? _width;
  // https://stackoverflow.com/questions/50085748/pass-a-function-with-parameters-to-a-voidcallback
    final Function(String) _toggleViewFunction; // function 베스트

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
  ///width doesn't matter

  @override
  Size get preferredSize => const Size(200, kToolbarHeight);
}

// https://stackoverflow.com/questions/43122113/sizing-elements-to-percentage-of-screen-width-height ROW Column size 베스트
// https://mightytechno.com/flutter-row-widget/ Row 관련 베스트
// https://stackoverflow.com/questions/49991444/create-a-rounded-button-button-with-border-radius-in-flutter 라운드버턴 rounded Button 베스트
class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    widget._width ??= mediaQueryWidth; // QnADartGrammar 값이 없다는 뜻이지 null 이란 뜻이 아니다. 미리 null check 해야함.
    return Align(
      //alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Theme.of(context).dividerColor))),
        alignment: Alignment.center,
        //color: Colors.grey[200],
        // we can set width here with conditions
        width: widget._width,
        //height: kToolbarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                width: 30,
                child: ResponsiveVisibility(
                  // CheckThisOut 이 부분을 새롭게 보이게 할 것인지 정의하네
                  hiddenWhen: const [Condition.largerThan(name: TABLET)],
                  // 이럴때는 감추어라.
                  child: Container(),
                ),
              )
            ]),
            Expanded(
              // 여기서 Expanded 를 하고 그밑에 Row 로 한번 더 감사주면 그게 늘어나지 않는구나.
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ResponsiveVisibility(
                    visible: false,
                    visibleWhen: const [Condition.largerThan(name: MOBILE),],
                    replacement: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),child: IconButton(onPressed: () => widget._toggleViewFunction("HOMESCREEN") , icon: const Icon(Icons.home),)),
                    child:

                    OutlinedButton(

                      //style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.black),),
                      onPressed: () => widget._toggleViewFunction("HOMESCREEN"),
                      child: const Text("HOME"),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  ResponsiveVisibility(
                    visible: false,
                    visibleWhen: const [Condition.largerThan(name: MOBILE)],
                    replacement: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),child: IconButton(onPressed: () => widget._toggleViewFunction("ABOUTSCREEN") , icon: const Icon(Icons.account_circle_rounded),)),
                    child: OutlinedButton(
                      onPressed: () => widget._toggleViewFunction("ABOUTSCREEN"),
                      child: const Text("ABOUT"),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
              ResponsiveVisibility(
                visible: false,
                visibleWhen: const [Condition.largerThan(name: MOBILE)],
                replacement: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),child: IconButton(onPressed: () => widget._toggleViewFunction("CONTACTSCREEN") , icon: const Icon(Icons.contact_support),)),
                child: OutlinedButton(
                  onPressed: () => widget._toggleViewFunction("CONTACTSCREEN"),
                  child: const Text("CONTACT"),
                ),
              ),


                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                SizedBox(
                  width: 30,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }


}


class MenuTextButton extends StatelessWidget {
  const MenuTextButton({Key? key, required titleText})
      : _titleTextString = titleText,
        super(key: key);
  final String _titleTextString;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
      onPressed: () {},
      child: Text(_titleTextString),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      // 스택이잖아
      alignment: Alignment.center, // 모든 자식 레이어들을 중간으로 정리하고..
      children: const [
        CircleAvatar(
          radius: 100,
          backgroundImage:
              AssetImage('assets/images/joseph_for_landing_page.jpg'),
        ),
      ],
    );
  }
}

class ContentTile extends StatelessWidget {
  const ContentTile({content, Key? key}) : _content = content, super(key: key);
  final Widget _content;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Container 대신 SizedBox 를 사용해라고 했지? 여기서도 가로 사이즈를 미리 정해놨네
      width: 500,
      child: Card(
        // 그안에 Card 를 넣고
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        // 여기봐라. 공간을 좌우를 이렇게 나누어 놓았잖아. margin 을 사용했네.
        color: Colors.blueGrey[20],
        child: Padding(
          padding: const EdgeInsets.all(8.0), // 그안에 Padding 을 넣어서 공간을 약간 띄워 놓고
          child: _content,
        ),
      ),
    );
  }
}

class PageFooter extends StatelessWidget {
  const PageFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(icon: const Icon(Icons.email_outlined), onPressed: () {
            //html.window.open('https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=joseph.patriot@gmail.com',"_self");
            html.window.open('https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=joseph.patriot@gmail.com',"_blank");
          },),
          const SizedBox(
            width: 20,
          ),
          IconButton(icon: const Icon(Icons.camera_alt_outlined), onPressed: () {
            //html.window.open('https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=joseph.patriot@gmail.com',"_self");
            html.window.open('https://www.instagram.com/jwseph/', "_blank");
          },),
        ],
      ),
    );
  }
}

class PageFooterStateful extends StatefulWidget {
  const PageFooterStateful({Key? key}) : super(key: key);

  @override
  State<PageFooterStateful> createState() => _PageFooterStatefulState();
}

class _PageFooterStatefulState extends State<PageFooterStateful> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text("Email."),
      onPressed: () {
      },
    );
  }
}

