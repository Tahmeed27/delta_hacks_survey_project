import 'package:flutter/cupertino.dart';

class PotAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('Images/pot.jpg');
    Image image = Image(image: assetImage,);
    return Container(child: image,);
  }
}
