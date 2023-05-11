class MyWallet {
  double amountBtc = 0.00;
  double amountEuro = 0.00;
  double calculatedAmount = 0.00;
  double rate = 2;

  MyWallet() {
    amountBtc = 0.00;
    amountEuro = 0.00;
    calculatedAmount = 0.00;
    rate = 2.00;
}

  void incrementBTCWallet() {
    amountBtc++;
  }

  void incrementEuroWallet(String amount) {
    if ((double.parse(amount)) <= amountBtc) {
      amountBtc -= (double.parse(amount));
      amountEuro += calculatedAmount;
    } else {
      //
    }
  }

  void calculateEuroAmount(String amount) {
    calculatedAmount = (double.parse(amount)) * rate;
  }
}
