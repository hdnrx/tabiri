import 'dart:math';

import 'package:tabiri_2/dataManager.dart';

/// class for calculating risk of user, according to calculation model used and user input
class CalculationModel {
  static final CalculationModel instance = CalculationModel.internal();

  factory CalculationModel() {
    return instance;
  }

  CalculationModel.internal();

  /// regression coefficient according to calculation model

  /// 0 - male, 1 - female, 2 - diverse,
  Map<int, double> genderFactor = {
    0: 0.2764,
    1: -0.2764,
    2: 0,
  };

  /// ageRisk per ageNumber
  /// example by age of 20: "0.0165 * (20-45)" 45 is the average age of Germans and taken as reference
  double ageFactor = 0.0165;

  /// 0 - no, 1 - yes
  Map<int, double> familySicknessFactor = {
    -1: 0,
    0: 0,
    1: 0.7833,
  };

  /// -1 - no selection, 0 - none, 1 - few(1-2), 2 - several(3-9), 3 - many(10+), 4 - don't know
  Map<int, double> sunburnFactor = {
    -1: 0,
    0: -0.4558,
    1: -0.12,
    2: 0.12,
    3: 0.4016,
    4: 0,
  };

  /// -1 - no selection, 0 - none, 1 - few(1-2), 2 - several(3-9), 3 - many(10+), 4 - don't know
  Map<int, double> birthmarkFactor = {
    -1: 0,
    0: -0.5836,
    1: -0.4319,
    2: 0.4319,
    3: 0.5402,
    4: 0,
  };

  /// -1 - no selection, 0 - blond, 1 - orangeRed, 2 - lightBrown, 3 - darkBrown, 4 - black
  Map<int, double> hairColorFactor = {
    -1: 0,
    0: 0.1879,
    1: 0.72,
    2: 0,
    3: -0.2438,
    4: -0.5042,
  };

  /// For the calculation of the risk you need a comparison model
  /// In this case its a female of age 50, no melanom in family, few birthmarks and sunburns, light-bown hair
  double _comparisonModel() {
    return genderFactor[1] +
        ageFactor * 50 +
        familySicknessFactor[0] +
        sunburnFactor[1] +
        birthmarkFactor[1] +
        hairColorFactor[2];
  }

  /// return the shown points from 1 to 10
  /// scala in 0.125-steps
  /// its just a visual approximation
  int _getPoints(double value) {
    if (value <= -0.25) {
      return 1;
    } else if (value > -0.25 && value <= -0.125) {
      return 2;
    } else if (value > -0.125 && value <= 0) {
      return 3;
    } else if (value > 0 && value <= 0.125) {
      return 4;
    } else if (value > 0.125 && value <= 0.25) {
      return 5;
    } else if (value > 0.25 && value <= 0.375) {
      return 6;
    } else if (value > 0.375 && value <= 0.5) {
      return 7;
    } else if (value > 0.5 && value <= 0.625) {
      return 8;
    } else if (value > 0.625 && value <= 0.75) {
      return 9;
    } else if (value > 0.75 && value <= 0.875) {
      return 10;
    } else if (value > 0.75 && value <= 0.875) {
      return 11;
    } else if (value > 0.875) {
      return 12;
    }
  }

  /// score points for given gender
  int getGenderPoints() {
    return _getPoints(genderFactor[DataManager.instance.gender]);
  }

  /// score points for given age
  int getAgePoints() {
    return _getPoints(ageFactor * DataManager.instance.age);
  }

  /// score points for family sickness
  int getFamilySicknessPoints() {
    return _getPoints(familySicknessFactor[DataManager.instance.familySickness]);
  }

  /// score points for number of sunburns
  int getSunburnPoints() {
    return _getPoints(sunburnFactor[DataManager.instance.numberSunburns]);
  }

  /// score points for number of birthmarks
  int getBirthmarkPoints() {
    return _getPoints(birthmarkFactor[DataManager.instance.numberBirthmarks]);
  }

  /// score points for given haircolor
  int getHairPoints() {
    return _getPoints(hairColorFactor[DataManager.instance.hairColor]);
  }

  /// return summary score points
  int getResultScore() {
    return getGenderPoints() +
        getAgePoints() +
        getFamilySicknessPoints() +
        getSunburnPoints() +
        getBirthmarkPoints() +
        getHairPoints();
  }

  /// calculates the risk according to calculation model
  double _calculateRiskValue() {
    // add all values
    double risk = genderFactor[DataManager.instance.gender] +
        ageFactor * DataManager.instance.age +
        familySicknessFactor[DataManager.instance.familySickness] +
        sunburnFactor[DataManager.instance.numberSunburns] +
        birthmarkFactor[DataManager.instance.numberBirthmarks] +
        hairColorFactor[DataManager.instance.hairColor];
    // take exponent of value - comparisonModelValue for relative risk
    print("gender: " +
        genderFactor[DataManager.instance.gender].toString() +
        " age: " +
        (ageFactor * DataManager.instance.age).toString() +
        " family: " +
        familySicknessFactor[DataManager.instance.familySickness].toString() +
        " sunburn: " +
        sunburnFactor[DataManager.instance.numberSunburns].toString() +
        " birthmark: " +
        birthmarkFactor[DataManager.instance.numberBirthmarks].toString() +
        " haircolor: " +
        hairColorFactor[DataManager.instance.hairColor].toString());
    print("score " + risk.toString());
    return exp(risk - _comparisonModel());
  }

  /// Place the risk score in 5 groups
  /// 0 - unknown risk, 1 - low risk, 2 - lower risk, 3 - average risk, 4 - higher risk, 5 - high risk
  int getRiskPlacement() {
    double score = _calculateRiskValue();
    print("final score " + score.toString());
    if (score <= -0.916) {
      return 1;
    } else if (score > -0.916 && score <= -0.405) {
      return 2;
    } else if (score > -0.405 && score <= 0.405) {
      return 3;
    } else if (score > 0.405 && score <= 0.916) {
      return 4;
    } else if (score > 0.916) {
      return 5;
    } else {
      return 0;
    }
  }
}
