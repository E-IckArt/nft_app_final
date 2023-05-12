import 'package:nft_app_final/model/my_wallet_page.dart';
import 'package:test/test.dart';

void main() {
  group('Test App', () {
    var myWallet = MyWallet();



    test('Test increment BTC wallet', () {
      myWallet.incrementBTCWallet();
      expect(myWallet.amountBtc, 1);
    });

    test('Test increment Euro wallet', () {
      myWallet.amountBtc = 10.00;
      myWallet.calculatedAmount = 2.00;
      myWallet.incrementEuroWallet(1.00);
      expect(myWallet.amountEuro, 2.00);
    });
  });
}