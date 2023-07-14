import 'package:day_24_with_flutter/thememanager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SideBar extends StatefulWidget {
  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool val2 = false;
  bool val3 = true;

  onChangeFunction2(bool newValue2) {
    setState(() {
      val2 = newValue2;
    });
  }

  onChangeFunction3(bool newValue3) {
    setState(() {
      val3 = newValue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final currentTheme = themeManager.getCurrentTheme();
    return Builder(builder: (BuildContext context) {
      return Drawer(
        child: Container(
          color: themeManager.getBackgroundPrimaryColor(),
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: ListView(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage("img/califo.jpg"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good morning!",
                        style: TextStyle(
                          letterSpacing: .5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                        decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.circular(17)),
                        child: Text(
                          "Search",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            letterSpacing: .5,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Favorite Apps",
                style: TextStyle(
                  letterSpacing: .5,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Divider(
                thickness: 2,
              ),
              rowsFavoriteApps(
                Icon(
                  Icons.camera_alt,
                  color: themeManager.getIconsPrimaryColor(),
                  size: 20,
                ),
                "Camera",
              ),
              rowsFavoriteApps(
                Icon(
                  Icons.image,
                  color: themeManager.getIconsPrimaryColor(),
                  size: 20,
                ),
                "Gallery",
              ),
              rowsFavoriteApps(
                Icon(
                  Icons.facebook,
                  color: themeManager.getIconsPrimaryColor(),
                  size: 20,
                ),
                "Facebook",
              ),
              rowsFavoriteApps(
                Icon(
                  FontAwesomeIcons.google,
                  color: themeManager.getIconsPrimaryColor(),
                  size: 20,
                ),
                "Google+",
              ),
              rowsFavoriteApps(
                Icon(
                  FontAwesomeIcons.earth,
                  color: themeManager.getIconsPrimaryColor(),
                  size: 20,
                ),
                "Internet",
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Settings",
                style: TextStyle(
                  letterSpacing: .5,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Divider(
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dark Mode",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Switch between light and dark mode",
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        )
                      ],
                    ),
                    FlutterSwitch(
                      width: 55,
                      height: 30,
                      
                      inactiveColor: Color.fromARGB(80, 158, 158, 158),
                      activeColor: Color.fromARGB(80, 158, 158, 158),
                      activeToggleColor: Colors.blue[800],
                      toggleColor: themeManager.getTogglePrimaryColor(),
                      value: themeManager.isDarkMode,
                      onToggle: (newvalue) {
                        themeManager.toggleTheme();
                      },
                    )
                  ],
                ),
              ),
              customSwitch("Nav Bar", "Make some for an symmetric Nav Bar",
                  val2, onChangeFunction2),
              customSwitch("Wi-Fi", "Turn your Wi-Fi on or off", val3,
                  onChangeFunction3),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.chevronLeft,
                            size: 14,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Back",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  Widget rowsFavoriteApps(Icon icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Row(
        children: [
          icon,
          SizedBox(
            width: 20,
          ),
          Text(text),
        ],
      ),
    );
  }

  Widget customSwitch(
      String text, String text2, bool val, Function onChangeMethod) {
    return Builder(builder: (context) {
      final themeManager = Provider.of<ThemeManager>(context);
      final currentTheme = themeManager.getCurrentTheme();
      return Padding(
        padding: const EdgeInsets.only(left: 15, top: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  text2,
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                )
              ],
            ),
            FlutterSwitch(
              width: 55,
              height: 30,
              
              inactiveColor: Color.fromARGB(80, 158, 158, 158),
              activeColor: Color.fromARGB(80, 158, 158, 158),
              activeToggleColor: Colors.blue[800],
              toggleColor: themeManager.getTogglePrimaryColor(),
              value: val,
              onToggle: (newvalue) {
                onChangeMethod(newvalue);
              },
            )
          ],
        ),
      );
    });
  }
}
