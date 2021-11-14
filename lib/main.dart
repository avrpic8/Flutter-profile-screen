import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        primaryColor: Colors.pink.shade400,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color.fromARGB(255, 30, 30, 30),
        appBarTheme: AppBarTheme(backgroundColor: Colors.black),
        textTheme: GoogleFonts.latoTextTheme(
          TextTheme(
            bodyText2: TextStyle(fontSize: 15),
            bodyText1: TextStyle(
                fontSize: 13, color: Color.fromARGB(200, 255, 255, 255)),
            headline6: TextStyle(fontWeight: FontWeight.w200),
            subtitle1: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum SkillsType { photoshop, xd, illustrator, afterEffect, lightRoom }

class _MyHomePageState extends State<MyHomePage> {
  SkillsType skill = SkillsType.photoshop;
  void updateSelectedSkill(SkillsType skillsType) {
    setState(() {
      this.skill = skillsType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile screen'),
          actions: [
            Icon(CupertinoIcons.chat_bubble),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
              child: Icon(CupertinoIcons.ellipsis_vertical),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/profile_image.png',
                      width: 60,
                      height: 60,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Saeed Razazzadeh',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text('Mobile, Web programmer'),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.location,
                              size: 16,
                              color:
                                  Theme.of(context).textTheme.bodyText1?.color,
                            ),
                            SizedBox(width: 3),
                            Text(
                              'Iran,Esfahan',
                              style: Theme.of(context).textTheme.caption,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Icon(
                    CupertinoIcons.heart,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute ',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Skills',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    CupertinoIcons.chevron_down,
                    size: 12,
                  )
                ],
              ),
            ),
            Center(
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 8,
                runSpacing: 8,
                children: [
                  Skills(
                    type: SkillsType.photoshop,
                    title: 'Photoshop',
                    imagePath: 'assets/images/app_icon_01.png',
                    shadowColor: Colors.blue,
                    isActive: this.skill == SkillsType.photoshop,
                    onTap: () {
                      updateSelectedSkill(SkillsType.photoshop);
                    },
                  ),
                  Skills(
                    type: SkillsType.xd,
                    title: 'Adobe Xd',
                    imagePath: 'assets/images/app_icon_05.png',
                    shadowColor: Colors.pink,
                    isActive: this.skill == SkillsType.xd,
                    onTap: () {
                      updateSelectedSkill(SkillsType.xd);
                    },
                  ),
                  Skills(
                    type: SkillsType.illustrator,
                    title: 'Illustrator',
                    imagePath: 'assets/images/app_icon_04.png',
                    shadowColor: Colors.orange,
                    isActive: this.skill == SkillsType.illustrator,
                    onTap: () {
                      updateSelectedSkill(SkillsType.illustrator);
                    },
                  ),
                  Skills(
                    type: SkillsType.afterEffect,
                    title: 'After Effect',
                    imagePath: 'assets/images/app_icon_03.png',
                    shadowColor: Colors.blue.shade800,
                    isActive: this.skill == SkillsType.afterEffect,
                    onTap: () {
                      updateSelectedSkill(SkillsType.afterEffect);
                    },
                  ),
                  Skills(
                    type: SkillsType.lightRoom,
                    title: 'Lithroom',
                    imagePath: 'assets/images/app_icon_02.png',
                    shadowColor: Colors.blue,
                    isActive: this.skill == SkillsType.lightRoom,
                    onTap: () {
                      updateSelectedSkill(SkillsType.lightRoom);
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class Skills extends StatelessWidget {
  final SkillsType type;
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isActive;
  final Function() onTap;

  const Skills({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.shadowColor,
    required this.isActive,
    required this.type,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = BorderRadius.circular(12);
    return InkWell(
      borderRadius: radius,
      onTap: onTap,
      child: Container(
        width: 110,
        height: 110,
        decoration: isActive
            ? BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(12),
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isActive ? BoxDecoration(boxShadow: [
                BoxShadow(color: shadowColor.withOpacity(0.5), blurRadius: 20),
              ]) : null,
              child: Image.asset(
                imagePath,
                width: 40,
                height: 40,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
