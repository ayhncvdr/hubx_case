class OnboardingLocalizationTable {
  OnboardingLocalizationTable(this._languageCode);

  final String _languageCode;

  String get welcomeTitlePrefix {
    switch (_languageCode) {
      case 'en':
        return 'Welcome to ';
      default:
        return '';
    }
  }

  String get welcomeTitleHighlight {
    switch (_languageCode) {
      case 'en':
        return 'PlantApp';
      default:
        return 'PlantApp';
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

  String get termsPrefix {
    switch (_languageCode) {
      case 'en':
        return 'By tapping next, you are agreeing to PlantID ';
      default:
        return '';
    }
  }

  String get termsOfUse {
    switch (_languageCode) {
      case 'en':
        return 'Terms of Use';
      default:
        return '';
    }
  }

  String get termsMiddle {
    switch (_languageCode) {
      case 'en':
        return ' & ';
      default:
        return '';
    }
  }

  String get privacyPolicy {
    switch (_languageCode) {
      case 'en':
        return 'Privacy Policy';
      default:
        return '';
    }
  }

  String get termsSuffix {
    switch (_languageCode) {
      case 'en':
        return '.';
      default:
        return '';
    }
  }

  String get slide1TitlePrefix {
    switch (_languageCode) {
      case 'en':
        return 'Take a photo to ';
      default:
        return '';
    }
  }

  String get slide1TitleHighlight {
    switch (_languageCode) {
      case 'en':
        return 'identify ';
      default:
        return '';
    }
  }

  String get slide1TitleSuffix {
    switch (_languageCode) {
      case 'en':
        return 'the plant!';
      default:
        return '';
    }
  }

  String get slide2TitlePrefix {
    switch (_languageCode) {
      case 'en':
        return 'Get plant ';
      default:
        return '';
    }
  }

  String get slide2TitleHighlight {
    switch (_languageCode) {
      case 'en':
        return 'care guides';
      default:
        return '';
    }
  }

  String get continueLabel {
    switch (_languageCode) {
      case 'en':
        return 'Continue';
      default:
        return '';
    }
  }
}
