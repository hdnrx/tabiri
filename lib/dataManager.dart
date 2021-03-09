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

  // -1 - no data, 1 - male, 2 - female, 3 - diverse,
  int sex;
  // -1 - no data
  int age;

  // -1 - no data, 0 - blond, 1 - orangeRed, 2 - lightBrown, 3 - darkBrown, 4 - black
  int hairColor;
  // -1 - no data, 0 - white,  1 - browned, 2 - olive, 3 - dark
  int skinColor;

  // -1 - no data, 0 - none, 2 - many
  int numberSunburns;
  int numberFreckles;
  int numberBirthmarks;

  // -1 - no data, 0 - false, 1 - true,
  int familySickness;

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
    sex = -1;
    age = -1;
    hairColor = -1;
    skinColor = -1;
    numberSunburns = -1;
    numberFreckles = -1;
    numberBirthmarks = -1;

    familySickness = -1;
  }

  /// set values to default
  void reset() {
    informationPathComplete = false;
    avatarPathComplete = false;
    protectionPathComplete = false;
    screeningPathComplete = false;
    preventionPathComplete = false;

    // may be changed according to calculation model
    sex = -1;
    age = -1;
    hairColor = -1;
    skinColor = -1;
    numberSunburns = -1;
    numberFreckles = -1;
    numberBirthmarks = -1;

    familySickness = -1;
  }
}
