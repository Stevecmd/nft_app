import 'package:flutter/material.dart';

import '../components/nft_card.dart';

class editors_Pick extends StatelessWidget {
  const editors_Pick({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NftCard(imagePath: 'lib/assets/images/apiens_4.jpg',);
  }
}
