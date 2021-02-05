enum Sex { male, female, diverse }
enum HairColor { blond, orangeRed, lightBrown, darkBrown, black }
enum SkinColor { white, beige, brown, black }

/// Singleton to save and access App Information globally
class DataManager {
  // singleton instance
  static final DataManager instance = DataManager.internal();

  // app variables
  // three main Paths, to indicate of the card has to be shown collapsed or extended
  bool informationPathComplete;
  bool avatarPathComplete;
  bool protectionPathComplete;

  // two sub paths of protectionPath
  bool screeningPathComplete;
  bool preventionPathComplete;

  // 0 - male, 1 - female, 2 - diverse
  int sex;
  int age;

  // 0 - blond, orangeRed, lightBrown, darkBrown, black
  int hairColor;
  // 0 - white,  1 - browned, 2 - olive, 3 - dark
  int skinColor;

  // 0 - none, 3 - many, 4 - no data
  int numberSunburns;
  int numberFreckles;
  int numberBirthmarks;

  bool familySickness;

  /// constructor
  // factory in flutter doesn't always return a new instance, so it is perfect for Singleton
  factory DataManager() {
    return instance;
  }

  /// initializer
  DataManager.internal() {
    // initialization with default values
    informationPathComplete = false;
    avatarPathComplete = false;
    protectionPathComplete = false;
    screeningPathComplete = false;
    preventionPathComplete = false;

    // may be changed according to calculation model
    sex = 0;
    age = 20;
    hairColor = 0;
    skinColor = 0;
    numberSunburns = 4;
    numberFreckles = 4;
    numberBirthmarks = 4;

    familySickness = false;
  }

  /// set values to default
  void reset() {
    informationPathComplete = false;
    avatarPathComplete = false;
    protectionPathComplete = false;
    screeningPathComplete = false;
    preventionPathComplete = false;

    // may be changed according to calculation model
    sex = 0;
    age = 20;
    hairColor = 0;
    skinColor = 0;
    numberSunburns = 4;
    numberFreckles = 4;
    numberBirthmarks = 4;

    familySickness = false;
  }
}
