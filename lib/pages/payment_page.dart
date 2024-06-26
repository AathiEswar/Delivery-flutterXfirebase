import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutterxfirebase/components/custom_button.dart';

import 'delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String expiryDate = "";
  String cardNumber = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isCvvFocused = false;

  //user Tapped Pay
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Confirm Payment "),
                content: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: ListBody(
                    children: [
                      Text("Card Number :" + cardNumber),
                      Text("Expiry Date :" + expiryDate),
                      Text("Card Holder name :" + cardHolderName),
                      Text("CVV :" + cvvCode),
                    ],
                  ),
                ),
                actions: [
                  //cancel
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Cancel")),

                  //yes
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DeliveryProgressPage()));
                      },
                      child: Text("Yes"))
                  //yes
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Checkout"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //credit card

            Container(
              child: CreditCardWidget(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isCvvFocused,
                  onCreditCardWidgetChange: (p0) {}),
            ),

            //Credit card form
            Container(
              child: CreditCardForm(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  onCreditCardModelChange: (data) {
                    setState(() {
                      cardNumber = data.cardNumber;
                      expiryDate = data.expiryDate;
                      cardHolderName = data.cardHolderName;
                      cvvCode = data.cvvCode;
                    });
                  },
                  formKey: formKey),
            ),
             SizedBox(
               height: 25,
             ) ,

            MyButton(onTap: userTappedPay, text: "Pay now"),

            const SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}
