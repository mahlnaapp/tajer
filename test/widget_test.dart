// This is a basic Flutter widget test for MerchantApp.
//
// It builds the MerchantApp and verifies that the login screen is shown.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appfotajer/main.dart'; // عدل المسار إذا لزم

import 'package:appwrite/appwrite.dart';

void main() {
  // إعداد Appwrite client وهمي للاختبار
  final client = Client()
      .setEndpoint('https://fra.cloud.appwrite.io/v1')
      .setProject('6887ee78000e74d711f1');
  final databases = Databases(client);
  final storage = Storage(client);

  testWidgets('LoginScreen is displayed', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MerchantApp(
        databases: databases,
        storage: storage,
        initialStoreId: null, // بدون storeId ليظهر LoginScreen
      ),
    );

    // تحقق من وجود حقول اسم المستخدم وكلمة المرور
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.text('اسم المستخدم'), findsOneWidget);
    expect(find.text('كلمة المرور'), findsOneWidget);

    // تحقق من وجود زر تسجيل الدخول
    expect(find.text('تسجيل الدخول'), findsOneWidget);
  });
}
