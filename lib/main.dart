import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'app_theme.dart';
import 'skills.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  // default language code;
  Locale _locale = Locale('fa');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      theme: _themeMode == ThemeMode.dark
          ? MyAppThemeConfig.dark().getTheme(_locale.languageCode)
          : MyAppThemeConfig.light().getTheme(_locale.languageCode),
      home: MyHomePage(
        toggleThemeMode: () {
          setState(() {
            if (_themeMode == ThemeMode.dark)
              _themeMode = ThemeMode.light;
            else
              _themeMode = ThemeMode.dark;
          });
        },
        changeLanguage: (Language selectedLanguage) {
          setState(() {
            _locale =
                selectedLanguage == Language.en ? Locale('en') : Locale('fa');
          });
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Function() toggleThemeMode;
  final Function(Language language) changeLanguage;

  const MyHomePage({
    Key? key,
    required this.toggleThemeMode,
    required this.changeLanguage,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SkillsType skill = SkillsType.photoshop;
  Language _language = Language.en;

  void updateSelectedSkill(SkillsType skillsType) {
    setState(() {
      this.skill = skillsType;
    });
  }

  void _updateAppLanguage(Language language) {
    widget.changeLanguage(_language);
    setState(() {
      _language = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizations.profileTitle,
          style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 18),
        ),
        actions: [
          Icon(CupertinoIcons.chat_bubble),
          InkWell(
            onTap: widget.toggleThemeMode,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
              child: Icon(CupertinoIcons.ellipsis_vertical),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
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
                          localizations.personName,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(localizations.job),
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
                              localizations.location,
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
                localizations.summary,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Divider(
              color: Theme.of(context).dividerColor,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 12, 32, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    localizations.selectedLanguage,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  CupertinoSlidingSegmentedControl<Language>(
                    groupValue: _language,
                    children: {
                      Language.en: Text(
                        localizations.enLanguage,
                        style: TextStyle(fontSize: 12),
                      ),
                      Language.fa: Text(
                        localizations.falanguage,
                        style: TextStyle(fontSize: 12),
                      )
                    },
                    onValueChanged: (value) {
                      _updateAppLanguage(value!);
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    localizations.skills,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(fontWeight: FontWeight.w700),
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
            ),
            Divider(
              color: Theme.of(context).dividerColor,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 12, 23, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Information',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(CupertinoIcons.at),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(CupertinoIcons.lock),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child:
                        ElevatedButton(onPressed: () {}, child: Text('Save')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum Language { en, fa }
