import 'package:flutter/material.dart';

class ButtonBuy extends StatelessWidget {
  const ButtonBuy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          print('Added to cart');
        },
        child: Text(
          'ACHETER',
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Theme.of(context).colorScheme.primary)
              .copyWith(fontWeight: FontWeight.w600),
        ));
  }
}
