import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:consult_it_app/utils/router.dart';
import 'package:consult_it_app/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({Key key, this.currentIndex = 0})
      : super(key: key);
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  changePage(int index) => setState(() {
        currentIndex = index;
        switch (currentIndex) {
          case 0:
            Navigator.pushNamedAndRemoveUntil(
                context, HOME_ROUTE, (route) => false);
            break;
          case 1:
            Navigator.pushNamedAndRemoveUntil(
                context, HOME_ROUTE, (route) => false);
            break;
          case 2:
            Navigator.pushNamed(context, PROFILE_PAGE);
            break;
          default:
        }
        print(currentIndex);
      });

  @override
  Widget build(BuildContext context) {
    return BubbleBottomBar(
      opacity: .2,
      currentIndex: currentIndex,
      onTap: changePage,
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      elevation: 8,
      fabLocation: BubbleBottomBarFabLocation.end, //new
      hasNotch: true, //new
      hasInk: true, //new, gives a cute ink effect
      inkColor: Colors.black12, //optional, uses theme color if not specified
      items: <BubbleBottomBarItem>[
        BubbleBottomBarItem(
            backgroundColor: MyColors.secondaryColor,
            icon: Icon(
              Icons.dashboard,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.dashboard,
              color: MyColors.mainColor,
            ),
            title: Text(
              "Inicio",
              style: Styles.bodyTextStyle.apply(color: MyColors.mainColor),
            )),
        BubbleBottomBarItem(
            backgroundColor: MyColors.secondaryColor,
            icon: Icon(
              Icons.people,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.people,
              color: MyColors.mainColor,
            ),
            title: Text(
              "Asesores",
              style: Styles.bodyTextStyle.apply(color: MyColors.mainColor),
            )),
        BubbleBottomBarItem(
            backgroundColor: MyColors.secondaryColor,
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.person,
              color: MyColors.mainColor,
            ),
            title: Text(
              "Perfil",
              style: Styles.bodyTextStyle.apply(color: MyColors.mainColor),
            ))
      ],
    );
  }
}
