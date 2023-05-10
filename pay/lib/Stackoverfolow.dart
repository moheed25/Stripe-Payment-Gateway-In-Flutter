// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class NumberCard extends StatefulWidget {
//   const NumberCard({super.key});

//   @override
//   State<NumberCard> createState() => _NumberCardState();
// }

// class _NumberCardState extends State<NumberCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(
//             height: 50,
//           ),
//           Container(
//             margin: const EdgeInsets.symmetric(
//               horizontal: 20,
//             ),
//             child: TextFormField(
//               inputFormatters: [
//                 FilteringTextInputFormatter.digitsOnly,
//                 CardNumberFormatter(),
//               ],
//               textInputAction: TextInputAction.done,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 prefixIcon: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Image.network(
//                     'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/800px-Mastercard-logo.svg.png',
//                     height: 30,
//                     width: 30,
//                   ),
//                 ),
//                 suffixIcon: const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     'Change',
//                     style: TextStyle(color: Colors.green),
//                   ),
//                 ),
//                 border: const OutlineInputBorder(),
//                 hintText: 'XXXX XXXX XXXX XXXX',
//                 labelText: 'Card Number',
//               ),
//               maxLength: 19,
//               onChanged: (value) {},
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CardNumberFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//     TextEditingValue previousValue,
//     TextEditingValue nextValue,
//   ) {
//     var inputText = nextValue.text;

//     if (nextValue.selection.baseOffset == 0) {
//       return nextValue;
//     }

//     var bufferString = StringBuffer();
//     for (int i = 0; i < inputText.length; i++) {
//       bufferString.write(inputText[i]);
//       var nonZeroIndexValue = i + 1;
//       if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
//         bufferString.write(' ');
//       }
//     }

//     var string = bufferString.toString();
//     return nextValue.copyWith(
//       text: string,
//       selection: TextSelection.collapsed(
//         offset: string.length,
//       ),
//     );
//   }
// }

//// -------------------------------
///
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pay/CardUtils.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({Key? key}) : super(key: key);

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  TextEditingController cardNumberController = TextEditingController();

  //CardType cardType = CardType.Invalid;

  // void getCardTypeFrmNum() {
  //   String cardNum = CardUtils.getCleannedNumber
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("New card")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Spacer(),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: cardNumberController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(16),
                        CardNumberInputFormatter()
                      ],
                      decoration: InputDecoration(

                          //pre,
                          hintText: "Card number"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: TextFormField(
                        decoration:
                            const InputDecoration(hintText: "Full name"),
                      ),
                    ),
                    // Row : For Tabar View :
                    //First Items :  
                    //
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              // Limit the input
                              LengthLimitingTextInputFormatter(3),
                            ],
                            decoration: const InputDecoration(hintText: "CVV"),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: 
                          TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                              CardMonthInputFormatter()
                            ],
                            decoration:
                                const InputDecoration(hintText: "MM/YY"),
                          ),
                        ),
                      ],
                    ),
                    
                  ],
                ),
              ),
              const Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  child: const Text("Add card"),
                  onPressed: () {},
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    String inputData = newValue.text;
    StringBuffer buffer = StringBuffer();

    // var buffer = StringBuffer();
    for (int i = 0; i < inputData.length; i++) {
      buffer.write(inputData[i]);
      //  var nonZeroIndex = i + 1;
      int index = i + 1;
      if (index % 4 == 0 && inputData.length != index) {
        buffer.write('  '); // Add double spaces.
      }
    }
    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.toString().length),
    );
    // var string = buffer.toString();
    // return newValue.copyWith(
    //     text: string,
    //     selection: TextSelection.collapsed(offset: string.length));
  }
}

//
// ---------   Card Month Input Formatter :
class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    // String inputData = newValue.text;
    // StringBuffer buffer = StringBuffer();

    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      //int index = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/'); // Add double spaces.
      }
    }
    // return TextEditingValue(
    //   text: buffer.toString(),
    //   selection: TextSelection.collapsed(offset: buffer.toString().length),
    // );
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
