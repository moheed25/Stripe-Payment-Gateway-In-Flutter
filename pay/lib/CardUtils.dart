// import 'package:flutter/material.dart';
// import 'package:pay/CardStrng.dart';
// class PaymentCard {
//   CardType? type;
//   String number;
//   String name;
//   int month;
//   int year;
//   int cvv;

//   PaymentCard(
//       {required this.type,required this.number,required this.name,required this.month, required this.year, required this.cvv});
// }
// // class PaymentCard {
// //   CardType? type;
// //   String? number;
// //   String? name;
// //   int? month;
// //   int? year;
// //   int? cvv;

// //   PaymentCard(
// //       {required this.type,
// //       required this.cvv,
// //       required this.name,
// //       required this.month,
// //       required this.year,
// //       required this.number});
// //       @override
// //       String toString (){
// //         return
// //        '[Type:$type ,Number:$number ,
// //        Name:$name , Month:$month , Year: $year,
// //        Cvv:$cvv,
// //        ]'
// //       }
// // }

// class CardUtils {
//   static String? validateCVV(String? value) {
//     if (value == null || value.isEmpty) {
//       return "This field is required";
//     }
//     if (value.length < 3 || value.length > 4) {
//       return "CVV is invalid";
//     }
//     return null;
//   }

//   static String? validateDate(String? value) {
//     if (value == null || value.isEmpty) {
//       return "This field is required";
//     }
//     int year;
//     int month;
//     if (value.contains(RegExp(r'(/)'))) {
//       var split = value.split(RegExp(r'(/)'));

//       month = int.parse(split[0]);
//       year = int.parse(split[1]);
//     } else {
//       month = int.parse(value.substring(0, (value.length)));
//       year = -1; // Lets use an invalid year intentionally
//     }
//     if ((month < 1) || (month > 12)) {
//       // A valid month is between 1 (January) and 12 (December)
//       return 'Expiry month is invalid';
//     }
//     var fourDigitsYear = convertYearTo4Digits(year);
//     if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
//       // We are assuming a valid should be between 1 and 2099.
//       // Note that, it's valid doesn't mean that it has not expired.
//       return 'Expiry year is invalid';
//     }
//     if (!hasDateExpired(month, year)) {
//       return "Card has expired";
//     }
//     return null;
//   }

//   // Convert the two-digit year to four-digit year if necessary
//   static int convertYearTo4Digits(int year) {
//     if (year < 100 && year >= 0) {
//       var now = DateTime.now();
//       String currentYear = now.year.toString();
//       String prefix = currentYear.substring(0, currentYear.length - 2);
//       year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
//     }
//     return year;
//   }

//   static bool hasDateExpired(int month, int year) {
//     return isNotExpired(year, month);
//   }

//   static bool isNotExpired(int year, int month) {
//     // It has not expired if both the year and date has not passed
//     return !hasYearPassed(year) && !hasMonthPassed(year, month);
//   }

//   static List<int> getExpiryDate(String value) {
//     var split = value.split(RegExp(r'(/)'));
//     return [int.parse(split[0]), int.parse(split[1])];
//   }

//   static bool hasMonthPassed(int year, int month) {
//     var now = DateTime.now();
//     // The month has passed if:
//     // 1. The year is in the past. In that case, we just assume that the month
//     // has passed
//     // 2. Card's month (plus another month) is more than current month.
//     return hasYearPassed(year) ||
//         convertYearTo4Digits(year) == now.year && (month < now.month + 1);
//   }

//   static bool hasYearPassed(int year) {
//     int fourDigitsYear = convertYearTo4Digits(year);
//     var now = DateTime.now();
//     // The year has passed if the year we are currently is more than card's
//     // year
//     return fourDigitsYear < now.year;
//   }

//   static String getCleannedNumber(String text) {
//     RegExp regExp = RegExp(r"[^0-9]");
//     return text.replaceAll(regExp, '');
//   }

 
// static CardType getCardTypeFrmNumber(String input) {
//     CardType cardType;
//     if (input.startsWith(new RegExp(
//         r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
//       cardType = CardType.MasterCard;
//     } else if (input.startsWith(new RegExp(r'[4]'))) {
//       cardType = CardType.Visa;
//     } else if (input
//         .startsWith(new RegExp(r'((506(0|1))|(507(8|9))|(6500))'))) {
//       cardType = CardType.Verve;
//     } else if (input.length <= 8) {
//       cardType = CardType.Others;
//     } else {
//       cardType = CardType.Invalid;
//     }
//     return cardType;
//   }

//   static Widget getCardIcon(CardType? cardType) {
//     String img = "";
//     Icon? icon;
//     switch (cardType) {
//       case CardType.MasterCard:
//         img = 'mastercard.png';
//         break;
//       case CardType.Visa:
//         img = 'visa.png';
//         break;
//       case CardType.Verve:
//         img = 'verve.png';
//         break;
//       case CardType.Others:
//         icon = new Icon(
//           Icons.credit_card,
//           size: 40.0,
//           color: Colors.grey[600],
//         );
//         break;
//       case CardType.Invalid:
//         icon = new Icon(
//           Icons.warning,
//           size: 40.0,
//           color: Colors.grey[600],
//         );
//         break;
//     }
    
//     Widget widget;
//     if (img.isNotEmpty) {
//       widget = new Image.asset(
//         'assets/images/$img',
//         width: 40.0,
//       );
//     } else {
//       widget = icon!;
//     }
//     return widget;
//   }
// }
