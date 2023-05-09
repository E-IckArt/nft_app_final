import 'package:flutter/material.dart';
import 'package:nft_app_final/views/Onboarding/page_3.dart';

import '../my_wallet_page.dart';

class Page2 extends StatelessWidget {
  Page2({
    super.key,
    required this.title,
  });

  final String title;
  final List<String> images = <String>['NFT 0', 'NFT 1', 'NFT 2', 'NFT 3'];

  @override
  Widget build(BuildContext context) {
    final display = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 65),
              child: Column(mainAxisSize: MainAxisSize.max, children: [
                Container(
                    width: double.maxFinite,
                    height: 96,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/bitcoin-icon.png'),
                          fit: BoxFit.contain,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)))),
                const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text("Imaginez posséder tous ces JPEG",
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w900)),
                ),
                SizedBox(
                  height: 130.0,
                  width: display.size.width,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image(
                          image: AssetImage('assets/images/${images[index]}.jpg'),
                          height: 130,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Text(
                      "Vous posséderez un identifiant unique sur la blockchain qui pourra renvoyer (ou non) vers un JPEG hébergé sur un serveur qui sera certainement fermé dans quelques années.",
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodySmall),
                ),
                const SizedBox(
                  height: 75,
                ),
                Row(
                    children: <Widget>[
                      TextButton(
                          onPressed: () => {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (_, __, ___) => const MyWalletPage(title: "My Wallet")
                                )
                            )
                          },
                          child: const Text("PASSER",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF65635E)))),
                      const Spacer(),
                      MaterialButton(
                        onPressed: () => {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => const Page3(title: "Page 3")))
                        },
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(35))),
                        textColor: Theme.of(context).colorScheme.tertiary,
                        color: Theme.of(context).colorScheme.secondary,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          child: Icon(Icons.arrow_forward),
                        ),
                      )
                    ]),
                const SizedBox(
                  // height: 20,
                )
              ]),
            )
          ],
        )

        );
  }
}
