import 'dart:ffi';

import 'package:flutter/material.dart';

class MyWallet {
  double amountBtc = 0.00;
  double amountEuro = 0.00;

  double valueToSell = 0.00;
  double calculatedAmount = 0.00;
  double rate = 2.00;

  void incrementBTCWallet() {
    amountBtc++;
  }

  void incrementEuroWallet(double valueToSell) {
      amountBtc -= (valueToSell);
      amountEuro += calculatedAmount;
  }

  void calculateEuroAmount() {
      calculatedAmount = valueToSell * rate;
  }

  void setRate(double newRate) {
    rate = newRate;
  }

  bool btcCreditCheck() {
    if ( valueToSell <= amountBtc) {
      return true;
    } else {
      return false;
    }
  }
}
