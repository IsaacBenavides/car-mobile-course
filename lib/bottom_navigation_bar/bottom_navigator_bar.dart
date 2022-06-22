import 'package:car_mobile_course/colors.dart';
import 'package:car_mobile_course/firebase/src/ui/pages/firebase_ui.dart';
import 'package:car_mobile_course/games/pages/page_1.dart';
import 'package:flutter/material.dart';

class BottomNavigatorBar extends StatelessWidget {
  BottomNavigatorBar({Key? key}) : super(key: key);

  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    const FirebaseUi(),
    const Page1(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
          child: PageView(
        controller: _pageController,
        children: _pages,
        physics: const NeverScrollableScrollPhysics(),
      )),
      bottomNavigationBar: BottomNavigatorBarWidget(
        onItemTapped: (value) => _pageController.jumpToPage(value),
      ),
    );
  }
}

class BottomNavigatorBarWidget extends StatefulWidget {
  final ValueChanged<int> onItemTapped;
  const BottomNavigatorBarWidget({Key? key, required this.onItemTapped})
      : super(key: key);

  @override
  State<BottomNavigatorBarWidget> createState() =>
      _BottomNavigatorBarWidgetState();
}

class _BottomNavigatorBarWidgetState extends State<BottomNavigatorBarWidget> {
  int _currentIndex = 0;

  final List<IconData> _items = const [
    Icons.home,
    Icons.gamepad,
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.08,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10,
          spreadRadius: 5,
          offset: Offset(0, -5),
        ),
      ]),
      child: Row(
          children: List.generate(
              _items.length,
              (index) => index == _currentIndex
                  ? _ActiveIcon(icon: _items[index])
                  : _NoActiveIcon(
                      icon: _items[index],
                      onTap: () {
                        widget.onItemTapped(index);
                        setState(() {
                          _currentIndex = index;
                        });
                      }))),
    );
  }
}

class _ActiveIcon extends StatelessWidget {
  const _ActiveIcon({Key? key, required this.icon}) : super(key: key);
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      color: Colors.transparent,
      child: Icon(
        icon,
        color: AppColors.primary,
      ),
    ));
  }
}

class _NoActiveIcon extends StatelessWidget {
  const _NoActiveIcon({Key? key, required this.icon, required this.onTap})
      : super(key: key);
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
    ));
  }
}
