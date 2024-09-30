import 'package:flutter/material.dart';

class QuitGoBackDrag extends StatefulWidget {
  final Widget child;

  const QuitGoBackDrag({super.key, required this.child});

  @override
  State<QuitGoBackDrag> createState() => _QuitGoBackDragState();
}

class _QuitGoBackDragState extends State<QuitGoBackDrag> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    // Agregar un NavigatorObserver para detectar cuándo se hace el pop en iOS
    final ModalRoute? route = ModalRoute.of(context);
    if (route is PageRoute) {
      route.addScopedWillPopCallback(_onWillPop);
    }
  }

  Future<bool> _onWillPop() async {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
