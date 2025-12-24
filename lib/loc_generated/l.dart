import 'package:hubx_case/loc_generated/landing_loc.dart';
import 'package:hubx_case/loc_generated/onboarding_loc.dart';

class _Constants {
  static const String defaultLanguage = 'en';
}

class L {
  static OnboardingLocalizationTable onboarding = OnboardingLocalizationTable(_Constants.defaultLanguage);
  static LandingLocalizationTable landing = LandingLocalizationTable(_Constants.defaultLanguage);

  static void updateLocalization({required String identifier}) {
    onboarding = OnboardingLocalizationTable(identifier);
    landing = LandingLocalizationTable(identifier);
  }
}
