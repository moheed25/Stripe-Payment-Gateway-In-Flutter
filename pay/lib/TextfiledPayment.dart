import 'package:flutter/material.dart';

class PaymentTextFieldController {
  // SignUp Payment Method:
  // Get_Stripe_Token :

  //
  static final CardNumber = TextEditingController();
  static final Cvc = TextEditingController();
  static final Exp_Month = TextEditingController();
  static final Exp_Year = TextEditingController();
  static final User_Id = TextEditingController();
  static final Amount = TextEditingController();
//
// ------- Done Payment : ---------
  static final strip_token = TextEditingController();

  ///
  void dispose() {
    // --------  Get_Stripe_Token -------
    CardNumber.dispose();
    Cvc.dispose();
    Exp_Month.dispose();
    Exp_Year.dispose();
    User_Id.dispose();
    Amount.dispose();
    // Done Payment :
    strip_token.dispose();
  }
}
