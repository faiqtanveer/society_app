//
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
//
// class ScaffoldWithNavbar extends StatelessWidget {
//   const ScaffoldWithNavbar(this.navigationShell, {super.key});
//
//   /// The navigation shell and container for the branch Navigators.
//   final StatefulNavigationShell navigationShell;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: navigationShell,
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: navigationShell.currentIndex,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'login'),
//         ],
//         onTap: _onTap,
//       ),
//     );
//   }
//
//   void _onTap(index) {
//
//     print("navigation shell:${navigationShell.currentIndex}");
//     print("navigation shell:${navigationShell.shellRouteContext.route}");
//     print("navigation shell index:${index}");
//     navigationShell.goBranch(
//       index,
//       initialLocation: index == navigationShell.currentIndex,
//     );
//
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  String location;
  ScaffoldWithNavBar({super.key, required this.child, required this.location});

  final Widget child;

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  int _currentIndex = 0;

  static const List<MyCustomBottomNavBarItem> tabs = [
    MyCustomBottomNavBarItem(
      icon: Icon(Icons.home),
      activeIcon: Icon(Icons.home),
      label: 'HOME',
      initialLocation: '/',
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(Icons.explore_outlined),
      activeIcon: Icon(Icons.explore),
      label: 'DISCOVER',
      initialLocation: '/extra',
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(Icons.storefront_outlined),
      activeIcon: Icon(Icons.storefront),
      label: 'SHOP',
      initialLocation: '/extra',
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(Icons.account_circle_outlined),
      activeIcon: Icon(Icons.account_circle),
      label: 'MY',
      initialLocation: '/extra',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const labelStyle = TextStyle(fontFamily: 'Roboto');
    return Scaffold(
      body: SafeArea(child: widget.child),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: labelStyle,
        unselectedLabelStyle: labelStyle,
        selectedItemColor: const Color(0xFF434343),
        selectedFontSize: 12,
        unselectedItemColor: const Color(0xFF838383),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          _goOtherTab(context, index);
        },
        currentIndex: widget.location == '/'
            ? 0
            : widget.location == '/extra'
            ? 1
            : widget.location == '/extra'
            ? 2
            : 3,
        items: tabs,
      ),
    );
  }

  void _goOtherTab(BuildContext context, int index) {
    if (index == _currentIndex) return;
    GoRouter router = GoRouter.of(context);
    String location = tabs[index].initialLocation;

    setState(() {
      _currentIndex = index;
    });
    if (index == 3) {
      context.push('/extra');
    } else {
      router.go(location);
    }
  }
}

class MyCustomBottomNavBarItem extends BottomNavigationBarItem {
  final String initialLocation;

  const MyCustomBottomNavBarItem(
      {required this.initialLocation,
        required Widget icon,
        String? label,
        Widget? activeIcon})
      : super(icon: icon, label: label, activeIcon: activeIcon ?? icon);
}