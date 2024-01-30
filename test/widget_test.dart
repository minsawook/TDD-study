import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd/homepage.dart';

void main() {
  testWidgets('home page is created', (WidgetTester tester) async {  // 홈페이지가 생성되는지 확인
    final testWidget = MaterialApp(
      home: HomePage(onPressed: () {  },),
    );

    await tester.pumpWidget(testWidget); // 위젯을 빌드하고 프레임을 트리거
    await tester.pumpAndSettle(); //애니메이션이 완료된 후 프레임을 트리거
  });

  testWidgets('home page contains hello world text',
          (WidgetTester tester) async {   // 홈페이지에 'Hello World!' 텍스트가 포함되어 있는지 확인
        final testWidget =  MaterialApp(
          home: HomePage(onPressed: () {  },),
        );

        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();


        expect(find.text('Hello World!'), findsOneWidget);
      });

  testWidgets('home page contains button', (WidgetTester tester) async { // 홈페이지에 버튼이 포함되어 있는지 확인하는 테스트
    final testWidget = MaterialApp(
      home: HomePage(onPressed: () {  },),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    final buttonMaterial = find.descendant(
      of: find.byType(ElevatedButton), //// ElevatedButton 타입의 위젯을 찾는다
      matching: find.byType(Material),
    );

    final materialButton = tester.widget<Material>(buttonMaterial);

    expect(materialButton.color, Colors.blue);
    expect(find.text('Weather today'), findsOneWidget);
    expect(find.byKey(Key('icon_weather')), findsOneWidget);
  });

  testWidgets('notify when button is pressed', (WidgetTester tester) async {// 버튼이 눌림  확인
    var pressed = false;
    final testWidget = MaterialApp(
      home: HomePage(
        onPressed: () => pressed = true, // 버튼이 눌렸을 때 pressed 변수를 true로 설정
      ),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(pressed, isTrue);  // pressed 변수가 true인지 확인
  });
}