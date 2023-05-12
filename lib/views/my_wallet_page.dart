import 'package:flutter/material.dart';
import 'package:nft_app_final/views/marketplace.dart';
import 'package:nft_app_final/widgets/alert_dialog.dart';

import '../model/my_wallet_page.dart';
import '../widgets/my_drawer.dart';

class MyWalletPage extends StatefulWidget {
  const MyWalletPage({super.key, required this.title});

  final String title;

  @override
  State<MyWalletPage> createState() => _MyWalletPageState();
}

class _MyWalletPageState extends State<MyWalletPage> {
  MyWallet myWallet = MyWallet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: buildMarketPlaceButton(),
            ),
            const SizedBox(height: 17.5),
            const Divider(
              color: Color(0xFF212121),
              height: 1,
            ),
            const SizedBox(height: 17.5),
            buildWalletBtcContainer(),
            const SizedBox(height: 35),
            buildTextField(),
            const SizedBox(height: 35),
            buildCenterWithSendButton(),
            const SizedBox(height: 17.5),
            const Divider(
              color: Color(0xFF212121),
              height: 1,
            ),
            const SizedBox(height: 17.5),
            buildWalletEurosContainer(),
          ],
        ),
      ),
      drawer: MyDrawer(
          context:
              context), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Container buildWalletEurosContainer() {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background-white.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(9))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Text("MON WALLET EN EUROS",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Colors.black),
                  textAlign: TextAlign.start),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  myWallet.amountEuro.toStringAsFixed(2),
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(color: Colors.black),
                ),
                const Icon(
                  Icons.euro,
                  color: Colors.black,
                  size: 32,
                )
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Center buildCenterWithSendButton() {
    return Center(
      child: MaterialButton(
        onPressed: () => {
          setState(() {
            if (myWallet.btcCreditCheck()) {
              myWallet.incrementEuroWallet(myWallet.valueToSell);
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return DialogBox(context: context);
                });
            }
          }),
        },
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(35))),
        textColor: Theme.of(context).colorScheme.primary,
        color: Theme.of(context).colorScheme.tertiary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Text(
            'REVENDRE POUR  ${myWallet.calculatedAmount.toStringAsFixed(2)} €',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              letterSpacing: 1.25,
            ),
          ),
        ),
      ),
    );
  }

  TextField buildTextField() {
    return TextField(
        onChanged: (value) {
          setState(() {
            myWallet.valueToSell = double.tryParse(value) ?? 0.00;
            if (myWallet.btcCreditCheck()) {
              myWallet.calculateEuroAmount();
            } else {
              // myWallet.displayAlert(context);
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DialogBox(context: context);
                  });
            }
          });
        },
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.tealAccent,
            ),
          ),
          labelText: "Spécifier un montant à revendre",
          focusColor: Colors.tealAccent,
          filled: true,
          // TODO - Fix the error background color
          // fillColor: Colors.grey.shade50,
        ));
  }

  Container buildWalletBtcContainer() {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background-pink.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(9))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Text("MON WALLET BTC",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Theme.of(context).colorScheme.tertiary),
                  textAlign: TextAlign.start),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  myWallet.amountBtc.toStringAsFixed(2),
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(color: Theme.of(context).colorScheme.tertiary),
                ),
                Icon(
                  Icons.currency_bitcoin,
                  color: Theme.of(context).colorScheme.tertiary,
                  size: 32,
                )
              ],
            ),
            const SizedBox(height: 30),
            MaterialButton(
              onPressed: () => {
                setState(() {
                  myWallet.incrementBTCWallet();
                }),
              },
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35))),
              textColor: Colors.white,
              color: Colors.tealAccent[400],
              height: 36,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Text(
                  'GAGNER 1 BTC',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Theme.of(context).colorScheme.tertiary),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  MaterialButton buildMarketPlaceButton() {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: (_, __, ___) =>
                    const MarketPlace(title: 'Place du Marché NFT')));
      },
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(35))),
      textColor: Theme.of(context).colorScheme.primary,
      color: Theme.of(context).colorScheme.tertiary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text(
              'PLACE DU MARCHE NFT',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                letterSpacing: 1.25,
              ),
            ),
            Icon(Icons.storefront_outlined),
          ],
        ),
      ),
    );
  }
}
