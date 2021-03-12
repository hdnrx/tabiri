enum Gender { male, female, diverse }
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

  // -1 - no data, 0 - male, 1 - female, 2 - diverse,
  int gender;
  // -1 - no data
  int age;

  // -1 - no data, 0 - blond, 1 - orangeRed, 2 - lightBrown, 3 - darkBrown, 4 - black
  int hairColor;

  // -1 - no data, 0 - none, 1 - few(1-2), 2 - several(3-9), 3 - many(10+)
  int numberSunburns;
  int numberFreckles;
  // -1 - no data, 0 - none, 1 - few(1-2), 2 - several(3-9), 3 - many(10+)
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
    gender = 0;
    age = 40;
    hairColor = 0;
    numberSunburns = 0;
    numberFreckles = 0;
    numberBirthmarks = 0;
    familySickness = 0;
  }

  /// set values to default
  void reset() {
    informationPathComplete = false;
    avatarPathComplete = false;
    protectionPathComplete = false;
    screeningPathComplete = false;
    preventionPathComplete = false;

    // may be changed according to calculation model
    gender = 0;
    age = 40;
    hairColor = 0;
    numberSunburns = 0;
    numberFreckles = 0;
    numberBirthmarks = 0;
    familySickness = 0;
  }
}
