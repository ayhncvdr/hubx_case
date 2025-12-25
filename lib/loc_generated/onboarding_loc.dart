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

  String get paywallPremiumTitle {
    switch (_languageCode) {
      case 'en':
        return 'PlantApp ';
      default:
        return 'PlantApp ';
    }
  }

  String get paywallPremiumSubtitle {
    switch (_languageCode) {
      case 'en':
        return 'Premium';
      default:
        return 'Premium';
    }
  }

  String get paywallAccessFeatures {
    switch (_languageCode) {
      case 'en':
        return 'Access All Features';
      default:
        return '';
    }
  }

  String get paywallBenefitUnlimitedTitle {
    switch (_languageCode) {
      case 'en':
        return 'Unlimited';
      default:
        return '';
    }
  }

  String get paywallBenefitUnlimitedSubtitle {
    switch (_languageCode) {
      case 'en':
        return 'Plant Identify';
      default:
        return '';
    }
  }

  String get paywallBenefitFasterTitle {
    switch (_languageCode) {
      case 'en':
        return 'Faster';
      default:
        return '';
    }
  }

  String get paywallBenefitFasterSubtitle {
    switch (_languageCode) {
      case 'en':
        return 'Process';
      default:
        return '';
    }
  }

  String get paywallPlanMonthTitle {
    switch (_languageCode) {
      case 'en':
        return '1 Month';
      default:
        return '';
    }
  }

  String get paywallPlanMonthSubtitle {
    switch (_languageCode) {
      case 'en':
        return '\$2.99/month, auto renewable';
      default:
        return '';
    }
  }

  String get paywallPlanYearTitle {
    switch (_languageCode) {
      case 'en':
        return '1 Year';
      default:
        return '';
    }
  }

  String get paywallPlanYearSubtitle {
    switch (_languageCode) {
      case 'en':
        return 'First 3 days free, then \$529,99/year';
      default:
        return '';
    }
  }

  String get paywallPlanYearBadge {
    switch (_languageCode) {
      case 'en':
        return 'Save 50%';
      default:
        return '';
    }
  }

  String get paywallCtaButton {
    switch (_languageCode) {
      case 'en':
        return 'Try free for 3 days';
      default:
        return '';
    }
  }

  String get paywallCtaDisclaimer {
    switch (_languageCode) {
      case 'en':
        return "After the 3-day free trial period you'll be charged \$274.99 per year unless you cancel before the trial expires. Yearly Subscription is Auto-Renewable";
      default:
        return '';
    }
  }

  String get paywallFooter {
    switch (_languageCode) {
      case 'en':
        return 'Terms  ·  Privacy  ·  Restore';
      default:
        return '';
    }
  }
}
