import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class NetworkImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  const NetworkImageWidget({
    Key? key,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.imageUrl,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        fit: fit ?? BoxFit.cover,
        height: height,
        maxHeightDiskCache: 500,
        cacheKey: imageUrl,
        width: width,
        color: color,
        imageUrl: imageUrl!,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
        const CupertinoActivityIndicator(),
        //  Image.network(
        //     "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
        errorWidget: (context, url, error) => Image.network(
            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
      ),
    );
    // return ExtendedImage.network(
    //   imageUrl!,
    //   // width: ScreenUtil.instance.setWidth(400),
    //   // height: ScreenUtil.instance.setWidth(400),
    //   fit: fit ?? BoxFit.cover,
    //   height: height,
    //   width: width,
    //   color: color,
    //   cache: true,
    //   clearMemoryCacheIfFailed: true,
    //   enableMemoryCache: true,
    //   handleLoadingProgress: false,
    //   loadStateChanged: (state) => checkImageLoadState(state),
    //   // loadStateChanged: (ExtendedImageState state) {
    //   //   switch (state.extendedImageLoadState) {
    //   //     case LoadState.loading:
    //   //       return CupertinoActivityIndicator();

    //   //     ///if you don't want override completed widget
    //   //     ///please return null or state.completedWidget
    //   //     // return null;
    //   //     // return state.completedWidget;

    //   //     case LoadState.completed:
    //   //       return null;
    //   //     case LoadState.failed:
    //   //       return Image.asset(
    //   //         "assets/images/pvr_logo.png",
    //   //         fit: BoxFit.fill,
    //   //         height: 50,
    //   //         width: 50,
    //   //       );
    //   //   }
    //   // },
    //   // borderRadius: borderRadius ??
    //   //     BorderRadius.only(
    //   //       topLeft: Radius.circular(8),
    //   //       topRight: Radius.circular(8),
    //   //     ),
    //   borderRadius: circular5BorderRadius,
    // );
  }
}