import 'package:flutter/material.dart';

///PageRoute that plays no animation, used if Hero Widget makes the Animation
class PageRouteWithoutTransition extends PageRoute {
  final WidgetBuilder builder;

  PageRouteWithoutTransition({@required this.builder});

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 1500);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);
    return result;
  }
}

///PageRoute with Fade Transition
class PageRouteWithTransition extends PageRoute {
  final WidgetBuilder builder;

  PageRouteWithTransition({@required this.builder});

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  /// duration of the page transitions
  @override
  Duration get transitionDuration => Duration(milliseconds: 1000);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);
    return FadeTransition(
      opacity: animation,
      child: result,
    );
  }
}
