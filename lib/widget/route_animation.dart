import 'package:flutter/material.dart';

class AnimationPageRoute<T> extends MaterialPageRoute<T> {
  Tween<Offset> slideTween;
  Tween<double> fadeTween;

  AnimationPageRoute(
      {WidgetBuilder builder,
      RouteSettings settings,
      bool maintainState: true,
      bool fullscreenDialog: false,
      this.slideTween,
      this.fadeTween})
      : super(
            builder: builder,
            settings: settings,
            maintainState: maintainState,
            fullscreenDialog: fullscreenDialog);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    Widget widget = SlideTransition(
      position: _getSlideAnimation(animation),
      child: FadeTransition(
         opacity: _getFadeAnimation(animation),
        child: child,
      ),
    );

    return widget;
  }

  Animation<Offset> _getSlideAnimation(Animation<double> animation) {
    if (slideTween == null) {
      slideTween = new Tween<Offset>(
        begin: new Offset(0.0, 0.0),
        end: Offset.zero,
      );
    }

    return slideTween.animate(
        new CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn));
  }

  Animation<double> _getFadeAnimation(Animation<double> animation) {
    if (fadeTween == null) {
      fadeTween = new Tween<double>(
        begin: 1.0,
        end: 1.0,
      );
    }

    return fadeTween.animate(
        new CurvedAnimation(parent: animation, curve: Curves.easeIn));
  }
}
