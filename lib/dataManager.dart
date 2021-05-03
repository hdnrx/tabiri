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

  /// -1 - no selection, 0 - male, 1 - female, 2 - diverse,
  int gender;

  int age;

  /// -1 - no selection, 0 - blond, 1 - orangeRed, 2 - lightBrown, 3 - darkBrown, 4 - black
  int hairColor;

  /// -1 - no selection, 0 - none, 1 - few(1-2), 2 - several(3-9), 3 - many(10+), 4 - don't know
  int numberSunburns;

  /// -1 - no selection
  int numberFreckles;

  /// -1 - no selection, 0 - none, 1 - few(1-2), 2 - several(3-9), 3 - many(10+), 4 - don't know
  int numberBirthmarks;

  // skin cancer in family history
  /// -1 - no selection, 0 - no, 1 - yes
  int familySickness;

  /// show alert for first time avatar creation with warning
  bool showAlert;

  /// some flags for button enable
  bool genderFlag;
  bool ageFlag;
  bool hairFlag;
  bool sunBurnFlag;
  bool birthmarkFlag;

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
    gender = -1;
    age = 0;
    hairColor = -1;
    numberSunburns = -1;
    numberBirthmarks = -1;
    familySickness = -1;

    showAlert = true;

    genderFlag = false;
    ageFlag = false;
    hairFlag = false;
    sunBurnFlag = false;
    birthmarkFlag = false;
  }

  /// set values to default
  void reset() {
    informationPathComplete = false;
    avatarPathComplete = false;
    protectionPathComplete = false;
    screeningPathComplete = false;
    preventionPathComplete = false;

    // may be changed according to calculation model
    gender = -1;
    age = 0;
    hairColor = -1;
    numberSunburns = -1;
    numberBirthmarks = -1;
    familySickness = -1;

    showAlert = true;

    genderFlag = false;
    ageFlag = false;
    hairFlag = false;
    sunBurnFlag = false;
    birthmarkFlag = false;
  }
}
