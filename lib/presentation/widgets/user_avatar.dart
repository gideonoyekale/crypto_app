import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/cores.dart';
import 'widgets.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key? key,
    this.onTap,
    this.avatar,
    this.size,
    this.loading = false,
  }) : super(key: key);
  final Function()? onTap;
  final String? avatar;
  final double? size;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipOval(
            child: avatar == null
                ? Image.asset(
                    AppAssets.defaultProfile,
                    height: size ?? 42,
                  )
                : CachedNetworkImage(
                    imageUrl: avatar!,
                    height: size ?? 42,
                    width: size ?? 42,
                    fit: BoxFit.cover,
                    // errorWidget: (c, s, _) => Image.asset(
                    //       AppAssets.defaultProfile,
                    //       height: size ?? 36,
                    //     ),
                    progressIndicatorBuilder: (c, s, p) =>
                        (p.progress ?? 0.0) >= 100
                            ? Container()
                            : Image.asset(
                                AppAssets.defaultProfile,
                                height: size ?? 36,
                              )),
          ),
          if (loading) ...[
            AppRectangle(
              color: Palette.black.withOpacity(0.5),
              shape: BoxShape.circle,
              height: size ?? 36,
              width: size ?? 36,
            ),
            const AppCircularProgressIndicator(),
          ],
        ],
      ),
    );
  }
}
