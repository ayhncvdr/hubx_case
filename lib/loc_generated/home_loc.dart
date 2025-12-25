class HomeLocalizationTable {
  HomeLocalizationTable(this._languageCode);

  final String _languageCode;

  String get greetingPrefix {
    switch (_languageCode) {
      case 'en':
        return 'Hi, plant lover!';
      default:
        return '';
    }
  }

  String get greetingSuffix {
    switch (_languageCode) {
      case 'en':
        return 'Good Afternoon! ⛅';
      default:
        return '';
    }
  }

  String get searchHint {
    switch (_languageCode) {
      case 'en':
        return 'Search for plants';
      default:
        return '';
    }
  }

  String get premiumBannerTitle {
    switch (_languageCode) {
      case 'en':
        return 'FREE Premium Available';
      default:
        return '';
    }
  }

  String get premiumBannerSubtitle {
    switch (_languageCode) {
      case 'en':
        return 'Tap to upgrade your account!';
      default:
        return '';
    }
  }

  String get loading {
    switch (_languageCode) {
      case 'en':
        return 'Loading...';
      default:
        return '';
    }
  }

  String get errorPrefix {
    switch (_languageCode) {
      case 'en':
        return 'Error: ';
      default:
        return '';
    }
  }

  String get errorMessage {
    switch (_languageCode) {
      case 'en':
        return 'Something went wrong.\nPlease try again.';
      default:
        return '';
    }
  }

  String get retry {
    switch (_languageCode) {
      case 'en':
        return 'Retry';
      default:
        return '';
    }
  }
}
