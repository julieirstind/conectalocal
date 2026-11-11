// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:conectalocal/main.dart';
import 'package:conectalocal/perfil_screen.dart';

void main() {
  testWidgets('abre a tela de localização e navega para o perfil', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LocalizacaoScreen()));

    expect(find.text('Localização'), findsOneWidget);
    expect(find.text('Comércio Local'), findsOneWidget);

    await tester.tap(find.text('Comércio Local'));
    await tester.pumpAndSettle();

    expect(find.text('Marcia Store'), findsOneWidget);
    expect(find.text('Márcia Store'), findsWidgets);
  });

  testWidgets('o botão Como chegar abre a segunda tela', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: PerfilScreen()));

    await tester.tap(find.text('Como chegar'));
    await tester.pumpAndSettle();

    expect(find.text('15 minutos até o local'), findsOneWidget);
    expect(find.text('Márcia Store'), findsWidgets);
  });
}
