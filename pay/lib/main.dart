import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:pay/HomeScreen.dart';
import 'package:pay/PaidPayment.dart';
import 'package:pay/Stackoverfolow.dart';
//import 'package:stripe_payment/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey =
      'pk_test_51MYOLbLdHLnOiveBmI2U6tSQT51ymzGMN4AuW048Mv0xyQBRklxwWGB2znO0aD8EWD28I0Agl1YV3PxvMKkf4nWA00EHhbXi36';

  // await Stripe.instance.applySettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          //AddNewCardScreen()
          //NumberCard()
          //  PaymentMethodPaid()
          const HomeScreen(),
    );
  }
}
