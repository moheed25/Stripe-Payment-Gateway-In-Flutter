// import 'dart:convert';

// // import 'package:courtnproject/PaymentMethod/PaidUserPayment/TextFieldPayments.dart';
// // import 'package:courtnproject/Services/Sservices.dart';
// // import 'package:courtnproject/TinderCard/home.dart';
// // import 'package:courtnproject/bottomtabs/yourprofile.dart';
// // import 'package:courtnproject/components/buttonpurple.dart';
// // import 'package:courtnproject/constant.dart';
// // import 'package:courtnproject/profileDetails/textfieldClass.dart';
// // import 'package:courtnproject/views/thankyoupremium.dart';
// import 'package:flutter/material.dart';
// //import 'package:fluttertoast/fluttertoast.dart';
// // import 'package:fluttertoast/fluttertoast.dart';
// // import 'package:flutter_flushbar/flutter_flushbar.dart';
// import 'package:get/route_manager.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'package:pay/PurpleBUtton.dart';
// import 'package:pay/TextfiledPayment.dart';
// import 'package:pay/colour.dart';
// import 'package:pay/constant.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class PaymentMethodPaid extends StatefulWidget {
//   const PaymentMethodPaid({Key? key}) : super(key: key);

//   @override
//   State<PaymentMethodPaid> createState() => _PaymentMethodPaidState();
// }

// class _PaymentMethodPaidState extends State<PaymentMethodPaid> {
// // TextFields  Controllers :
//   // final TextEditingController Card_Number = TextEditingController();
//   // final TextEditingController Cvc = TextEditingController();
//   // final TextEditingController Exp_Month = TextEditingController();
//   // final TextEditingController Exp_Year = TextEditingController();
//   // final TextEditingController User_Id = TextEditingController();
//   // final TextEditingController Amount = TextEditingController();
// // // Clear Text :
// //   void clearText() {
// //     Card_Number.clear();
// //   }

// // Signup Payment :
// // ------ Get Stripe Token : --------
//   var tokenn;
//   var data;
//   var StripToken;
//   var getStripeToken;
//   getstripepaymenttoken(
//       String card_number, cvc, exp_month, exp_year, user_id, amount) async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       var token1 = prefs.getString('token');
//       // // print(token);
//       Response response = await http.post(Uri.parse(Constant.getstriptoken),
//           headers: <String, String>{
//             'Content-Type': 'application/json; charset=UTF-8',
//             'Authorization':
//                 //     'Bearer sk_test_51MYOLbLdHLnOiveBJpWKaiq0Xuddrai0XGDLdjOOXcNoLOzVVB07toFaPhV3NmMpaI5Xyk3Rj3YTGhLYlp8lAJ9w00eBg3P29l',
//                 // 'Content-Type': 'application/x-www-form-urlencoded'
//                 'Bearer $token1'
//             //  'Bearer $token1  sk_test_51MYOLbLdHLnOiveBJpWKaiq0Xuddrai0XGDLdjOOXcNoLOzVVB07toFaPhV3NmMpaI5Xyk3Rj3YTGhLYlp8lAJ9w00eBg3P29l',
//           },
//           body: jsonEncode({
//             'card_number': PaymentTextFieldController.CardNumber.text,
//             'cvc': PaymentTextFieldController.Cvc.text,
//             'exp_month': PaymentTextFieldController.Exp_Month.text,
//             'exp_year': PaymentTextFieldController.Exp_Year.text,
//             'user_id': PaymentTextFieldController.User_Id.text,
//             'amount': PaymentTextFieldController.Amount.text,
//           }));
//       //  print(response);
//       print(response.statusCode);
//       //print(response.body);
//       if (response.statusCode == 400) {
//         print("Wrong");
//         final jsondata = json.decode(response.body);
//         print(jsondata);
//         final message = jsondata["message"];
//         print(message);

//         //  data = jsonDecode(response.body.toString());
//         // print(data);

//         // //  print(response.statusCode);
//         // prefs.getString("token");
//         // print(jsonDecode(response.body));
//         // print(data['success']);
//         // print(data['message']);
//         // print(data['data']['error']);
//         // print(response.body);

//         //print('successfull');
//       } else if (response.statusCode == 200) {
//         data = jsonDecode(response.body);
//         print(data);
//         final jsondata = json.decode(response.body);
//         final message = jsondata['message'];
//         // data = jsonDecode(response.body.toString());
//         // print(data);

//         //  print(response.statusCode);
//         prefs.getString("token");
//         StripToken = jsondata["data"]["stripe_token"];
//         print(StripToken);
//         print("StripeToken is :" + StripToken.toString());
//         // Saving User_Id In Shared Preferences :
//         SharedPreferences prefsss = await SharedPreferences.getInstance();
//         // Yaha par mein setInt ka Through user_Id lein raha hoon :
//         prefsss.setString("useridHai", StripToken);
//         // YAHA par mein User_Id ko getUserid ka name Variable mein save kr va raha hoon :
//         getStripeToken = prefsss.getString("useridHai");
//         // yaha Print Kar wa raha hoon :
//         print(getStripeToken);
//         print('Success');
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }

// // ----------- Done Payment : ---------
//   ddonepayment(String stripe_token, amount, user_id) async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       var token1 = prefs.getString('token');
//       //
//       tokenn = prefs.getString('useridHai');
//       print("Strip " + tokenn.toString());
//       // // print(token);
//       Response response = await http.post(Uri.parse(Constant.donepayment),
//           headers: <String, String>{
//             'Content-Type': 'application/json; charset=UTF-8',
//             'Authorization':
//                 'Bearer $token1  sk_test_51MYOLbLdHLnOiveBJpWKaiq0Xuddrai0XGDLdjOOXcNoLOzVVB07toFaPhV3NmMpaI5Xyk3Rj3YTGhLYlp8lAJ9w00eBg3P29l',
//             //'Bearer $token1 ',
//             'Content-Type': 'application/x-www-form-urlencoded'
//             //$token1',
//           },
//           body: jsonEncode({
//             'stripe_token': tokenn.toString(),
//             'amount': PaymentTextFieldController.Amount.text,
//             'user_id': PaymentTextFieldController.User_Id.text,
//           })
//           //body: jsonEncode({'email': emailverify, 'otp': otp})
//           );
//       print(response);
//       print(response.statusCode);
//       //print(response.body);
//       //  if (response.statusCode == 200) {
//       data = jsonDecode(response.body.toString());
//       print(data);
//       prefs.getString("useridHai");
//       //  print(response.statusCode);
//       prefs.getString("token");
//       //print(jsonDecode(response.body));
//       print(data['success']);
//       print(data['message']);
//       print(data['data']['error']);
//       print(response.body);

//       print('successfull');
//       // } else {
//       //   print('failed');
//       // }
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             body: SingleChildScrollView(
//       child: Column(children: [
//         Stack(
//           children: [
//             Container(
//                 height: MediaQuery.of(context).size.height * 0.21,
//                 //height: 710,
//                 width: MediaQuery.of(context).size.width * 0.9999,
//                 color: Colors.white),
//             // Positioned(
//             //     child: Image(
//             //         image: AssetImage('assets/images/paymentPurple.png'))),
//             Positioned(
//                 top: 30,
//                 right: 80,
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       width: 120,
//                     ),
//                     Text(
//                       "Payment Details",
//                       style: TextStyle(
//                         fontFamily: 'OpenSans',
//                         fontWeight: FontWeight.w700,
//                         fontSize: 25,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 )),
//           ],
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         TextFields(),
//         SizedBox(
//           height: 10,
//         ),
//         GestureDetector(
//             onTap: () async {
//               // clearText();

//               // Get_stripe_Token Function API:
//               getstripepaymenttoken(
//                   PaymentTextFieldController.CardNumber.text.toString(),
//                   PaymentTextFieldController.Exp_Month.text.toString(),
//                   PaymentTextFieldController.Exp_Year.text.toString(),
//                   PaymentTextFieldController.Cvc.text.toString(),
//                   PaymentTextFieldController.User_Id.text.toString(),
//                   PaymentTextFieldController.Amount.text.toString());
//               // print All Enter Values in TextFields:
//               print("Card_Number : " +
//                   PaymentTextFieldController.CardNumber.text.toString());
//               print("Cvc :" + PaymentTextFieldController.Cvc.text);
//               print("Exp_Month : " +
//                   PaymentTextFieldController.Exp_Month.text.toString());
//               print("Exp_Year :" +
//                   PaymentTextFieldController.Exp_Year.text.toString());
//               print("User_ID : " +
//                   PaymentTextFieldController.User_Id.text.toString());
//               print("Amount : " +
//                   PaymentTextFieldController.Amount.text.toString());
//             },
//             child: ButtonPurple(title: 'Make Payment')),

//         // Done Payment Button :
//         GestureDetector(
//           onTap: () async {
//             //showAlertDialogg(context);
//             // Done Payment From API :
//             ddonepayment(
//               PaymentTextFieldController.User_Id.text.toString(),
//               PaymentTextFieldController.Amount.text.toString(),
//               tokenn.toString(),
//             );
//             print("Token : " + tokenn.toString());
//             // Print All Enter Values from TextFields :
//             print(
//               "User_Id : " + PaymentTextFieldController.User_Id.text.toString(),
//             );
//             print("Amount : " +
//                 PaymentTextFieldController.Amount.text.toString());
//             print("Stripe Token : " + tokenn.toString());
//           },
//           child: ButtonPurple(title: 'Done'),
//         )
//       ]),
//     )));
//   }
// }

// class TextFields extends StatelessWidget {
//   const TextFields({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Card_Number:
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             height: 60,
//             width: 320,
//             // color: Colors.red,
//             child: TextFormField(
//               controller: PaymentTextFieldController.CardNumber,
//               onFieldSubmitted: (value) {},
//               // obscureText: true,
//               validator: (value) {
//                 // if (value!.isEmpty) {
//                 //   return 'Enter a valid password!';
//                 // }
//                 // return null;
//               },

//               onSaved: (value) {
//                 //   _loginUserData['password'] = value!;
//               },
//               //  controller: passwordController,
//               // obscureText: true,
//               //obscuringCharacter: '*',
//               style: TextStyle(color: AppColours.custom_purplee),
//               decoration: InputDecoration(
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(50.0),
//                   borderSide:
//                       BorderSide(width: 1, color: AppColours.custom_purplee),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide:
//                       BorderSide(width: 1, color: AppColours.custom_purplee),
//                   borderRadius: BorderRadius.circular(50.0),
//                 ),
//                 hintText: 'Card_Number',
//                 hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
//               ),
//             ),
//           ),
//         ),
//         // Cvc :
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             height: 60,
//             width: 320,
//             // color: Colors.red,
//             child: TextFormField(
//               controller: PaymentTextFieldController.Cvc,
//               onFieldSubmitted: (value) {},
//               // obscureText: true,
//               validator: (value) {
//                 // if (value!.isEmpty) {
//                 //   return 'Enter a valid password!';
//                 // }
//                 // return null;
//               },

//               onSaved: (value) {
//                 //   _loginUserData['password'] = value!;
//               },
//               //  controller: passwordController,
//               // obscureText: true,
//               // obscuringCharacter: '*',
//               style: TextStyle(color: AppColours.custom_purplee),
//               decoration: InputDecoration(
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(50.0),
//                   borderSide:
//                       BorderSide(width: 1, color: AppColours.custom_purplee),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide:
//                       BorderSide(width: 1, color: AppColours.custom_purplee),
//                   borderRadius: BorderRadius.circular(50.0),
//                 ),
//                 hintText: 'Cvc',
//                 hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
//               ),
//             ),
//           ),
//         ),
//         // This Row Have Two TextFields :
//         // Exp_MOnth:
//         //Exp_Year :
//         RiwTextFiled(),
//         // User_Id:
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             height: 60,
//             width: 320,
//             // color: Colors.red,
//             child: TextFormField(
//               controller: PaymentTextFieldController.User_Id,
//               onFieldSubmitted: (value) {},
//               // obscureText: true,
//               validator: (value) {
//                 // if (value!.isEmpty) {
//                 //   return 'Enter a valid password!';
//                 // }
//                 // return null;
//               },

//               onSaved: (value) {
//                 //   _loginUserData['password'] = value!;
//               },
//               //  controller: passwordController,
//               // obscureText: true,
//               //       obscuringCharacter: '*',
//               style: TextStyle(color: AppColours.custom_purplee),
//               decoration: InputDecoration(
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(50.0),
//                   borderSide:
//                       BorderSide(width: 1, color: AppColours.custom_purplee),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide:
//                       BorderSide(width: 1, color: AppColours.custom_purplee),
//                   borderRadius: BorderRadius.circular(50.0),
//                 ),
//                 hintText: 'User_Id',
//                 hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
//               ),
//             ),
//           ),
//         ),
//         // Amount :
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             height: 60,
//             width: 320,
//             // color: Colors.red,
//             child: TextFormField(
//               controller: PaymentTextFieldController.Amount,
//               onFieldSubmitted: (value) {},
//               //    obscureText: true,
//               validator: (value) {
//                 // if (value!.isEmpty) {
//                 //   return 'Enter a valid password!';
//                 // }
//                 // return null;
//               },

//               onSaved: (value) {
//                 //   _loginUserData['password'] = value!;
//               },
//               //  controller: passwordController,
//               // obscureText: true,
//               // obscuringCharacter: '*',
//               style: TextStyle(color: AppColours.custom_purplee),
//               decoration: InputDecoration(
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(50.0),
//                   borderSide:
//                       BorderSide(width: 1, color: AppColours.custom_purplee),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide:
//                       BorderSide(width: 1, color: AppColours.custom_purplee),
//                   borderRadius: BorderRadius.circular(50.0),
//                 ),
//                 hintText: 'Amount',
//                 hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class Content {
//   final String? text;
//   Content({this.text});
// }

// showAlertDialogg(BuildContext context) {
//   // Create button
//   Widget okButton = Row(
//     children: [
//       SizedBox(
//         width: 20,
//       ),
//       InkWell(
//         onTap: () {
//           Navigator.pop(
//             context,
//             MaterialPageRoute(builder: (context) => PaymentMethodPaid()),
//           );
//         },
//         child: Container(
//           height: 50,
//           width: 100,
//           decoration: BoxDecoration(
//             color: AppColours.custom_pinkk,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Center(
//             child: Text(
//               'Cancel',
//               style: TextStyle(
//                 color: AppColours.custom_whitee,
//               ),
//             ),
//           ),
//         ),
//       ),
//       SizedBox(
//         width: 10,
//       ),
//       InkWell(
//         onTap: () async {
//           // Fluttertoast.showToast(
//           //     msg: "Done SuccessFully !",
//           //     toastLength: Toast.LENGTH_SHORT,
//           //     gravity: ToastGravity.CENTER,
//           //     timeInSecForIosWeb: 1,
//           //     backgroundColor: Colors.blue,
//           //     textColor: Colors.white);
//           //if (_formKey.currentState!.validate()) {
//           // ScaffoldMessenger.of(context).showSnackBar(
//           //   const SnackBar(content: Text('User Sucessfully LogOut ')),
//           // );
//           // AuthController.logOut();
//           // SharedPreferences sp = await SharedPreferences.getInstance();

//           //sp.setString('token', );

// //                    _submit();

//           // Navigator.push(
//           //   context,
//           //   MaterialPageRoute(builder: (context) => Home()),
//           // );

//           //Newc :
//           // logout();
//           // final prefs = await SharedPreferences.getInstance();
//           // prefs.clear();
//           // Get.offAll(ThankyouPremium());
//           //
//           // logout();
//           // // Get.offAll(LogScreen());

//           // Navigator.pushReplacement(
//           //   context,
//           //   MaterialPageRoute(builder: (context) => LogScreen()),
//           // );
//         },
//         child: Container(
//           height: 50,
//           width: 100,
//           decoration: BoxDecoration(
//             color: AppColours.custom_purplee,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Center(
//             child: Text(
//               'Done',
//               style: TextStyle(
//                 color: AppColours.custom_whitee,
//               ),
//             ),
//           ),
//         ),
//       )
//     ],
//   );

//   // Create AlertDialog
//   AlertDialog alert = AlertDialog(
//     shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(Radius.circular(12.0))),
//     title: Column(
//       children: [
//         Container(
//             height: 70,
//             width: 70,
//             child: Image.asset('assets/images/correct.png'))
//       ],
//     ),
//     // content: Text("This is an alert message."),
//     actions: [
//       okButton,
//     ],
//   );

//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }

// class RiwTextFiled extends StatelessWidget {
//   const RiwTextFiled({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(
//           width: 20,
//         ),
//         // Exp-Month :
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             height: 60,
//             width: 140,
//             // color: Colors.red,
//             child: TextFormField(
//               controller: PaymentTextFieldController.Exp_Month,
//               onFieldSubmitted: (value) {},
//               //   obscureText: true,
//               validator: (value) {
//                 // if (value!.isEmpty) {
//                 //   return 'Enter a valid password!';
//                 // }
//                 // return null;
//               },

//               onSaved: (value) {
//                 //   _loginUserData['password'] = value!;
//               },
//               //  controller: passwordController,
//               // obscureText: true,
//               // obscuringCharacter: '*',
//               style: TextStyle(color: AppColours.custom_purplee),
//               decoration: InputDecoration(
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(50.0),
//                   borderSide:
//                       BorderSide(width: 1, color: AppColours.custom_purplee),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide:
//                       BorderSide(width: 1, color: AppColours.custom_purplee),
//                   borderRadius: BorderRadius.circular(50.0),
//                 ),
//                 hintText: 'Exp-Month',
//                 hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
//               ),
//             ),
//           ),
//         ),
//         // Exp_Year :
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             height: 60,
//             width: 140,
//             // color: Colors.red,
//             child: TextFormField(
//               controller: PaymentTextFieldController.Exp_Year,
//               onFieldSubmitted: (value) {},
//               //obscureText: true,
//               validator: (value) {
//                 // if (value!.isEmpty) {
//                 //   return 'Enter a valid password!';
//                 // }
//                 // return null;
//               },

//               onSaved: (value) {
//                 //   _loginUserData['password'] = value!;
//               },
//               //  controller: passwordController,
//               // obscureText: true,
//               //  obscuringCharacter: '*',
//               style: TextStyle(color: AppColours.custom_purplee),
//               decoration: InputDecoration(
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(50.0),
//                   borderSide:
//                       BorderSide(width: 1, color: AppColours.custom_purplee),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide:
//                       BorderSide(width: 1, color: AppColours.custom_purplee),
//                   borderRadius: BorderRadius.circular(50.0),
//                 ),
//                 hintText: 'Exp_Year',
//                 hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
