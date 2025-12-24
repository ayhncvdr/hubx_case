class LandingLocalizationTable {
  LandingLocalizationTable(this._languageCode);

  final String _languageCode;

  String get home {
    switch (_languageCode) {
      case 'en':
        return 'Home';
      default:
        return '';
    }
  }

  String get diagnose {
    switch (_languageCode) {
      case 'en':
        return 'Diagnose';
      default:
        return '';
    }
  }

  String get myGarden {
    switch (_languageCode) {
      case 'en':
        return 'My Garden';
      default:
        return '';
    }
  }

  String get profile {
    switch (_languageCode) {
      case 'en':
        return 'Profile';
      default:
        return '';
    }
  }
}
