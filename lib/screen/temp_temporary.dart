html.window.open('https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=joseph.patriot@gmail.com',"_blank");


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
