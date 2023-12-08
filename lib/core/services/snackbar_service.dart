import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import '../../presentation/widgets/widgets.dart';
import '../cores.dart';

class SnackbarService {
  SnackbarService();

  // final NavigationService _navigationService;
  // final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  void success({String? message, int milliseconds = 3000}) {
    showCustomToast(
      SnackBarView(
        message: message ?? 'successful!',
        color: Colors.green,
        icon: const DoneIcon(
          size: 36,
          color: Colors.green,
          iconColor: Colors.white,
        ),
      ),
    );
  }

  void error({String? message, int milliseconds = 3000}) {
    showCustomToast(
      SnackBarView(
        message: message ?? 'invalid email/password',
        color: Colors.red,
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
      ),
    );
  }

  void showCustomToast(Widget widget) {
    BotToast.showCustomNotification(
      duration: const Duration(seconds: 3),
      // wrapToastAnimation: (controller, cancel, child) => CustomOffsetAnimation(
      //   reverse: false,
      //   controller: controller,
      //   child: child,
      // ),
      toastBuilder: (Function() callback) => widget,
    );
  }
}

class SnackBarView extends StatelessWidget {
  const SnackBarView({
    super.key,
    required this.message,
    required this.icon,
    required this.color,
  });

  final String message;
  final Widget icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        color: context.colorTheme.appBg,
        child: Material(
          elevation: 8,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: context.colorTheme.appBg,
              gradient: LinearGradient(
                stops: const [0.02, 0.02],
                colors: [
                  color,
                  Palette.primary ?? Colors.white,
                ],
              ),
              // border:
              //     Border(bottom: BorderSide(color: Colors.green, width: 4)),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(20, 8, 16, 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon,
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: AppText(
                    message,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomOffsetAnimation extends StatefulWidget {
  final AnimationController controller;
  final Widget child;
  final bool reverse;

  const CustomOffsetAnimation(
      {Key? key,
      required this.controller,
      required this.child,
      this.reverse = false})
      : super(key: key);

  @override
  _CustomOffsetAnimationState createState() => _CustomOffsetAnimationState();
}

class _CustomOffsetAnimationState extends State<CustomOffsetAnimation> {
  late Tween<Offset> tweenOffset;

  late Animation<double> animation;

  @override
  void initState() {
    tweenOffset = Tween<Offset>(
      begin: Offset(widget.reverse ? -0.8 : 0.8, 0.0),
      end: Offset.zero,
    );
    animation =
        CurvedAnimation(parent: widget.controller, curve: Curves.decelerate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (BuildContext context, Widget? child) {
        return FractionalTranslation(
          translation: tweenOffset.evaluate(animation),
          child: Opacity(
            opacity: animation.value,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
