import 'package:nft_app_final/model/my_wallet_page.dart';
import 'package:test/test.dart';

void main() {
  group('Test App', () {
    var myWallet = MyWallet();

    test('Test increment BTC wallet', () {
      myWallet.incrementBTCWallet();
      expect(myWallet.amountBtc, 1);
    });
  });
}