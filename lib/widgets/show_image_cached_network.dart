import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ShowImageCacheNetwork extends StatelessWidget {
  String _image = '';
  ShowImageCacheNetwork(this._image);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      //child: Image.asset('assets/images/seu-logo-vai-aqui.jpg'),
      child: CachedNetworkImage(
        imageUrl: _image,
        placeholder: (context, url) => Container(
          height: 80,
          width: 80,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => Center(
          child: Icon(Icons.error_outline),
        ),
      ),
    );
  }
}
