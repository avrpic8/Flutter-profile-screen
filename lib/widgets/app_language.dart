import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum Language { en, fa }

class AppLanguageSwitcher extends StatelessWidget {
  final Language _language;
  final AppLocalizations localizations;
  final Function(Language language) onChange;

  const AppLanguageSwitcher({
    Key? key,
    required Language language,
    required this.localizations,
    required this.onChange,
  })  : _language = language,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl<Language>(
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
        onChange(value!);
      },
    );
  }
}
