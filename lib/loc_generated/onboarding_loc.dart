class OnboardingLocalizationTable {
  OnboardingLocalizationTable(this._languageCode);

  final String _languageCode;

  String get welcomeTitle {
    switch (_languageCode) {
      case 'en':
        return 'Welcome to PlantApp';
      default:
        return '';
    }
  }

  String get welcomeSubtitle {
    switch (_languageCode) {
      case 'en':
        return 'Identify more than 3000+ plants and 88% accuracy.';
      default:
        return '';
    }
  }

  String get getStarted {
    switch (_languageCode) {
      case 'en':
        return 'Get Started';
      default:
        return '';
    }
  }

  String get terms {
    switch (_languageCode) {
      case 'en':
        return 'By tapping next, you are agreeing to PlantID Terms of Use & Privacy Policy.';
      default:
        return '';
    }
  }
}
