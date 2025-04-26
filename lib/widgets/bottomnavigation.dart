import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation(
      {super.key, required this.onPress, required this.selectedPageIndex});

  final void Function(int selectedPageIndex) onPress;
  final int selectedPageIndex;
  @override
  State<BottomNavigation> createState() {
    return _BottomNavigationState();
  }
}

class _BottomNavigationState extends State<BottomNavigation> {
  List<Map<String, Object>> navButtonInfo = [
    {
      'icon': Image.asset(
        'lib/assets/icons/home.png',
        height: 24,
        width: 24,
      ),
      'iconSelect': Image.asset(
        'lib/assets/icons/homeSelect.png',
        height: 24,
        width: 24,
      ),
      'label': 'Home',
    },
    {
      'icon': Image.asset(
        'lib/assets/icons/history.png',
        height: 24,
        width: 24,
      ),
      'iconSelect': Image.asset(
        'lib/assets/icons/historySelect.png',
        height: 24,
        width: 24,
      ),
      'label': 'History',
    },
    {
      'icon': Container(
        margin: EdgeInsets.only(top: 16),
        child: Image.asset(
          'lib/assets/icons/addTask.png',
          height: 56,
          width: 56,
        ),
      ),
      'iconSelect': Container(
        margin: EdgeInsets.only(top: 16),
        child: Image.asset(
          'lib/assets/icons/addTask.png',
          height: 56,
          width: 56,
        ),
      ),
      'label': '',
    },
    {
      'icon': Image.asset(
        'lib/assets/icons/calendar.png',
        height: 24,
        width: 24,
      ),
      'iconSelect': Image.asset(
        'lib/assets/icons/calendarSelect.png',
        height: 24,
        width: 24,
      ),
      'label': 'Calendar',
    },
    {
      'icon': Image.asset(
        'lib/assets/icons/profile.png',
        height: 24,
        width: 24,
      ),
      'iconSelect': Image.asset(
        'lib/assets/icons/profileySelect.png',
        height: 24,
        width: 24,
      ),
      'label': 'Profile',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 88,
      indicatorColor: Color.fromARGB(255, 38, 50, 56),
      backgroundColor: Color.fromARGB(255, 38, 50, 56),
      // labelTextStyle: GoogleFonts.inter(),
      destinations: [
        ...navButtonInfo.map((item) {
          if (item['label'] == '') {
            return NavigationDestination(
              icon: item['icon'] as Widget,
              label: item['label'] as String,
              selectedIcon: item['iconSelect'] as Widget,
            );
          }
          return NavigationDestination(
            icon: item['icon'] as Widget,
            label: item['label'] as String,
            selectedIcon: item['iconSelect'] as Widget,
          );
        })
      ],
      onDestinationSelected: widget.onPress,

      selectedIndex: widget.selectedPageIndex,
    );
  }
}
