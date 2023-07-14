import 'package:day_24_with_flutter/sidebar.dart';
import 'package:day_24_with_flutter/thememanager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      drawer: SideBar(),
      body: Builder(builder: (BuildContext context) {
        final themeManager = Provider.of<ThemeManager>(context);
        final currentTheme = themeManager.getCurrentTheme();

        return Container(
          color: themeManager.getBackgroundPrimaryColor(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 470,
                  ),
                  Positioned(
                    child: Container(
                      child: Image.asset(
                        "img/califo.jpg",
                        height: 430,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 50,
                    child: InkWell(
                      onTap: () {
                        _scaffoldState.currentState?.openDrawer();
                      },
                      child: Icon(
                        FontAwesomeIcons.barsStaggered,
                        color: themeManager.getTextPrimaryColor(),
                        size: 18,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 50,
                    child: Icon(
                      FontAwesomeIcons.microphone,
                      size: 18,
                      color: themeManager.getTextPrimaryColor(),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Container(
                      width: 330,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: themeManager.getBackgroundPrimaryColor(),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: themeManager.getBoxshadwoPrimaryColor(),
                              offset: Offset(0, 1),
                              blurRadius: 10,
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.sunny,
                                color: Colors.amber,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "It's now 32'F",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "In California",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(13),
                            decoration: BoxDecoration(
                              color: Colors.blue[600],
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              FontAwesomeIcons.solidPaperPlane,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: themeManager.getBackgroundPrimaryColor(),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: themeManager.getBoxshadwoPrimaryColor(),
                            offset: Offset(0, 3),
                            blurRadius: 5,
                          )
                        ]),
                    child: Icon(
                      FontAwesomeIcons.info,
                      color: Colors.teal,
                      size: 18,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: themeManager.getBackgroundPrimaryColor(),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: themeManager.getBoxshadwoPrimaryColor(),
                            offset: Offset(0, 3),
                            blurRadius: 5,
                          )
                        ]),
                    child: Icon(
                      FontAwesomeIcons.calendar,
                      color: Colors.blue,
                      size: 18,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: themeManager.getBackgroundPrimaryColor(),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: themeManager.getBoxshadwoPrimaryColor(),
                            offset: Offset(0, 3),
                            blurRadius: 5,
                          )
                        ]),
                    child: Icon(
                      Icons.music_note_rounded,
                      color: Colors.red,
                      size: 18,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: themeManager.getBackgroundPrimaryColor(),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: themeManager.getBoxshadwoPrimaryColor(),
                            offset: Offset(0, 3),
                            blurRadius: 5,
                          )
                        ]),
                    child: Icon(
                      Icons.list_alt_rounded,
                      color: Colors.purple,
                      size: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Tuesday, Jun 30",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "but are written in lower camel case. If more than one icon style is available for an icon, the style name is used as prefix, except for ",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.blue[700],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: themeManager.getBoxshadwoPrimaryColor(),
                              offset: Offset(0, 3),
                              blurRadius: 5)
                        ]),
                    child: Text(
                      "CALL",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    decoration: BoxDecoration(
                        color: themeManager.getBackgroundPrimaryColor(),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: themeManager.getBoxshadwoPrimaryColor(),
                              offset: Offset(0, 3),
                              blurRadius: 5)
                        ]),
                    child: Text(
                      "TEXT",
                      style: TextStyle(
                          color: themeManager.getIconsPrimaryColor(),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    decoration: BoxDecoration(
                        color: themeManager.getBackgroundPrimaryColor(),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: themeManager.getBoxshadwoPrimaryColor(),
                              offset: Offset(0, 3),
                              blurRadius: 5)
                        ]),
                    child: Text(
                      "EMAIL",
                      style: TextStyle(
                          color: themeManager.getIconsPrimaryColor(),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
