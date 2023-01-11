import 'package:flutter_svg/flutter_svg.dart';

Future<void> preCacheSVG(String url) async {
  await precachePicture(
    ExactAssetPicture(
      SvgPicture.svgStringDecoderBuilder,
      url,
    ),
    null,
  );
}
