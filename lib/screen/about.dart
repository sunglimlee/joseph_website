import 'package:flutter/material.dart';
import 'package:joseph_website/screen/widgets.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

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
                child: ContentTile(content: JobDescriptionPicture())),
            ResponsiveRowColumnItem(
                rowFlex: 1,
                child: ContentTile(content: JobDescription())),
          ],
        ),
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
                rowFlex: 1, child: ContentTile(content: WhatRPNDo())),
            ResponsiveRowColumnItem(
                rowFlex: 1, child: ContentTile(content: WhatRPNDoPicture())),
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

class JobDescriptionPicture extends StatelessWidget {
  const JobDescriptionPicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // 자식들 균등하게 padding 할 때 베스트
      spacing: 20, // to apply margin in the main axis of the wrap
      runSpacing: 20, // to apply margin in the cross axis of the wrap
      children: [
        Center(
            child: Image.asset('assets/images/job_description.jpg', width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,)
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class JobDescription extends StatelessWidget {
  const JobDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // 자식들 균등하게 padding 할 때 베스트
      spacing: 20, // to apply margin in the main axis of the wrap
      runSpacing: 20, // to apply margin in the cross axis of the wrap
      children:  [
        Center(
          child: Text.rich(
            style: TextStyle(fontSize:
            ResponsiveValue( // 여기서 ResponsiveValue 를 적용했다. // CheckThisOut
              context,
              defaultValue: 18.0,
              valueWhen: const [
                Condition.largerThan( // 여러개의 조건이 들어갈 수 있네
                  name: TABLET,
                  value: 22.0,
                ),
                Condition.smallerThan( // 이름에 따른 조건을 정해서 값을 변경하고
                  name: MOBILE,
                  value: 14.0,
                ),
              ],
            ).value),
            const TextSpan(
              text: 'Job Description Registered Practical Nurse (RPN)',
            ),
          ),
        ),
        Text.rich(
          style: TextStyle(fontSize:
          ResponsiveValue( // 여기서 ResponsiveValue 를 적용했다. // CheckThisOut
            context,
            defaultValue: 16.0,
            valueWhen: const [
              Condition.largerThan( // 여러개의 조건이 들어갈 수 있네
                name: TABLET,
                value: 18.0,
              ),
              Condition.smallerThan( // 이름에 따른 조건을 정해서 값을 변경하고
                name: MOBILE,
                value: 12.0,
              ),
            ],
          ).value),
          const TextSpan(
              text:
                  "A Registered Practical Nurse (RPN), also known as a Licensed Practical Nurse (LPN), is a healthcare professional that has completed two years of college-level education to earn a diploma in Practical Nursing. They are one of the three types of nurses, along with Registered Nurses (RNs) and Nurse Practitioners (NPs). Being an RPN offers a quicker and more affordable route to a career in nursing, although they will not be qualified for certain roles because the training is not as extensive. RPNs predominantly treat patients with stables conditions, who do not require invasive procedures or are likely to experience a medical emergency. RPNs are frequently employed in clinics, long-term care facilities and by other private healthcare service providers.",
              children: <InlineSpan>[
                TextSpan(
                  text: '',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ]),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class WhatRPNDoPicture extends StatelessWidget {
  const WhatRPNDoPicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // 자식들 균등하게 padding 할 때 베스트
      spacing: 20, // to apply margin in the main axis of the wrap
      runSpacing: 20, // to apply margin in the cross axis of the wrap
      children: [
        Center(
          child: Image.asset('assets/images/what_rpn_do.jpg', width: 600.0,
            height: 240.0,
            fit: BoxFit.cover,)
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}


class WhatRPNDo extends StatelessWidget {
  const WhatRPNDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // 자식들 균등하게 padding 할 때 베스트
      spacing: 20, // to apply margin in the main axis of the wrap
      runSpacing: 20, // to apply margin in the cross axis of the wrap
      children: [
        Center(
          child: Text.rich(
            style: TextStyle(fontSize:
            ResponsiveValue( // 여기서 ResponsiveValue 를 적용했다. // CheckThisOut
              context,
              defaultValue: 18.0,
              valueWhen: const [
                Condition.largerThan( // 여러개의 조건이 들어갈 수 있네
                  name: TABLET,
                  value: 22.0,
                ),
                Condition.smallerThan( // 이름에 따른 조건을 정해서 값을 변경하고
                  name: MOBILE,
                  value: 14.0,
                ),
              ],
            ).value),
            const TextSpan(
              text: 'What does a Registered Practical Nurse (RPN) do ?',
            ),
          ),
        ),
        Text.rich(
          style: TextStyle(fontSize:
          ResponsiveValue( // 여기서 ResponsiveValue 를 적용했다. // CheckThisOut
            context,
            defaultValue: 16.0,
            valueWhen: const [
              Condition.largerThan( // 여러개의 조건이 들어갈 수 있네
                name: TABLET,
                value: 18.0,
              ),
              Condition.smallerThan( // 이름에 따른 조건을 정해서 값을 변경하고
                name: MOBILE,
                value: 12.0,
              ),
            ],
          ).value),
          const TextSpan(
              text:
                  "All types of nurses work to offer the best healthcare possible to their patients and clients. Registered Practical Nurses provide care to patients in stable condition where there is a low probably of a sudden change. They dispense medication – including pills, liquids and injections – according to the instructions of a physician or doctor, perform routine examinations and treatments, assist physicians treating patients and offer therapeutic health services. RPNs also provide practical information and instructions to patients so that they can maintain their health and use any medication or equipment correctly. Depending on their place of employment, RPNs can follow set routine with a small group of patients requiring long term care, or they can treat different patients as they arrive at a clinic or healthcare facility.",
              children: <InlineSpan>[
                TextSpan(
                  text: '',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ]),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
