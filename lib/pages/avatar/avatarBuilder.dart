import 'package:flutter/material.dart';

/// Widget to build Avatar
/// Returns Container with image, without specific size
/// portrait = false for whole avatar image
/// portrait = true for portrait avatar
/// birthmarkPortrait = true for examination avatar(site 5 of avatar page)
class AvatarBuilder extends StatelessWidget {
  // 0 - male, 1 - female, 2 - diverse
  final int gender;
  final int age;

  // 0 - blond, 1 - orangeRed, 2 - lightBrown, 3 - darkBrown, 4 - black
  final int hairColor;

  // -1 - no data, 0 - none, 1 - few(1-2), 2 - several(3-9), 3 - many(10+)
  final int birthmark;

  /// circle portrait, ignore if birthmarkPortrait
  final bool portrait;

  /// birthmark selection avatar
  final bool birthmarkPortrait;

  final double borderScale;

  AvatarBuilder(
      {@required this.gender,
      @required this.age,
      @required this.hairColor,
      this.birthmark,
      this.portrait = false,
      this.birthmarkPortrait = false,
      this.borderScale = 1.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: avatarPortrait(),
    );
  }

  /// Returns Container with correct avatar.
  Widget avatarPortrait() {
    return portrait || birthmarkPortrait
        ? Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: birthmarkPortrait
                    ? examinationImagePicker(gender, age, hairColor)
                    : basicImagePicker(gender, age, hairColor, portrait),
              ),
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Color(0xFF295A56),
                width: 10 * borderScale,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  offset: Offset(0, 6),
                ),
              ],
            ),
          )
        : Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: basicImagePicker(gender, age, hairColor, portrait),
              ),
            ),
          );
  }

  /// returns the correct picture based on gender, age and haircolor. Optional portrait for smaller version
  /// diverse(nonbinary) images are the same as male in this case
  AssetImage basicImagePicker(
      int gender, int age, int hairColor, bool portrait) {
    if (gender == 0) {
      if (age < 40) {
        //blond
        if (hairColor == 0) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_40-_blond_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_40-_blond_complete.png');
          }
        }
        // red
        else if (hairColor == 1) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_40-_red_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_40-_red_complete.png');
          }
        }
        // light brown
        else if (hairColor == 2) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_40-_lightBrown_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_40-_lightBrown_complete.png');
          }
        }
        // dark brown
        else if (hairColor == 3) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_40-_darkBrown_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_40-_darkBrown_complete.png');
          }
        }
        // black
        else if (hairColor == 4) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_40-_black_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_40-_black_complete.png');
          }
        } else {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_40-_placeholder_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_40-_placeholder_complete.png');
          }
        }
      } else if (age >= 40 && age < 55) {
        //blond
        if (hairColor == 0) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_40-55_blond_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_40-55_blond_complete.png');
          }
        }
        // red
        else if (hairColor == 1) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_40-55_red_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_40-55_red_complete.png');
          }
        }
        // light brown
        else if (hairColor == 2) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_40-55_lightBrown_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_40-55_lightBrown_complete.png');
          }
        }
        // dark brown
        else if (hairColor == 3) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_40-55_darkBrown_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_40-55_darkBrown_complete.png');
          }
        }
        // black
        else if (hairColor == 4) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_40-55_black_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_40-55_black_complete.png');
          }
        } else {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_40-55_placeholder_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_40-55_placeholder_complete.png');
          }
        }
      } else if (age >= 55 && age < 65) {
        //blond
        if (hairColor == 0) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_55-65_blond_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_55-65_blond_complete.png');
          }
        }
        // red
        else if (hairColor == 1) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_55-65_red_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_55-65_red_complete.png');
          }
        }
        // light brown
        else if (hairColor == 2) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_55-65_lightBrown_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_55-65_lightBrown_complete.png');
          }
        }
        // dark brown
        else if (hairColor == 3) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_55-65_darkBrown_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_55-65_darkBrown_complete.png');
          }
        }
        // black
        else if (hairColor == 4) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_55-65_black_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_55-65_black_complete.png');
          }
        } else {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_55-65_placeholder_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_55-65_placeholder_complete.png');
          }
        }
      } else if (age >= 65) {
        //blond
        if (hairColor == 0) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_65+_blond_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_65+_blond_complete.png');
          }
        }
        // red
        else if (hairColor == 1) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_65+_red_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_65+_red_complete.png');
          }
        }
        // light brown
        else if (hairColor == 2) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_65+_lightBrown_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_65+_lightBrown_complete.png');
          }
        }
        // dark brown
        else if (hairColor == 3) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_65+_darkBrown_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_65+_darkBrown_complete.png');
          }
        }
        // black
        else if (hairColor == 4) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_65+_black_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_65+_black_complete.png');
          }
        } else {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_65+_placeholder_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_65+_placeholder_complete.png');
          }
        }
      } else {
        throw Exception('age not defined');
      }
    } else if (gender == 1) {
      if (age < 40) {
        //blond
        if (hairColor == 0) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/woman/woman_40-_blond_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/woman/woman_40-_blond_complete.png');
          }
        }
        // red
        else if (hairColor == 1) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/woman/woman_40-_red_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/woman/woman_40-_red_complete.png');
          }
        }
        // light brown
        else if (hairColor == 2) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/woman/woman_40-_lightBrown_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/woman/woman_40-_lightBrown_complete.png');
          }
        }
        // dark brown
        else if (hairColor == 3) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/woman/woman_40-_darkBrown_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/woman/woman_40-_darkBrown_complete.png');
          }
        }
        // black
        else if (hairColor == 4) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/woman/woman_40-_black_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/woman/woman_40-_black_complete.png');
          }
        } else {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/woman/woman_40-_placeholder_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/woman/woman_40-_placeholder_complete.png');
          }
        }
      } else if (age >= 40 && age < 55) {
        //blond
        if (hairColor == 0) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/woman/woman_40-55_blond_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/woman/woman_40-55_blond_complete.png');
          }
        }
        // red
        else if (hairColor == 1) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/woman/woman_40-55_red_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/woman/woman_40-55_red_complete.png');
          }
        }
        // light brown
        else if (hairColor == 2) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/woman/woman_40-55_lightBrown_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/woman/woman_40-55_lightBrown_complete.png');
          }
        }
        // dark brown
        else if (hairColor == 3) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/woman/woman_40-55_darkBrown_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/woman/woman_40-55_darkBrown_complete.png');
          }
        }
        // black
        else if (hairColor == 4) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/woman/woman_40-55_black_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/woman/woman_40-55_black_complete.png');
          }
        } else {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/woman/woman_40-55_placeholder_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/woman/woman_40-55_placeholder_complete.png');
          }
        }
      } else if (age >= 55 && age < 65) {
        //blond
        if (hairColor == 0) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/woman/woman_55-65_blond_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/woman/woman_55-65_blond_complete.png');
          }
        }
        // red
        else if (hairColor == 1) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/woman/woman_55-65_red_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/woman/woman_55-65_red_complete.png');
          }
        }
        // light brown
        else if (hairColor == 2) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/woman/woman_55-65_lightBrown_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/woman/woman_55-65_lightBrown_complete.png');
          }
        }
        // dark brown
        else if (hairColor == 3) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/woman/woman_55-65_darkBrown_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/woman/woman_55-65_darkBrown_complete.png');
          }
        }
        // black
        else if (hairColor == 4) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/woman/woman_55-65_black_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/woman/woman_55-65_black_complete.png');
          }
        } else {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/woman/woman_55-65_placeholder_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/woman/woman_55-65_placeholder_complete.png');
          }
        }
      } else if (age >= 65) {
        //blond
        if (hairColor == 0) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/woman/woman_65+_blond_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/woman/woman_65+_blond_complete.png');
          }
        }
        // red
        else if (hairColor == 1) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/woman/woman_65+_red_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/woman/woman_65+_red_complete.png');
          }
        }
        // light brown
        else if (hairColor == 2) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/woman/woman_65+_lightBrown_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/woman/woman_65+_lightBrown_complete.png');
          }
        }
        // dark brown
        else if (hairColor == 3) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/woman/woman_65+_darkBrown_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/woman/woman_65+_darkBrown_complete.png');
          }
        }
        // black
        else if (hairColor == 4) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/woman/woman_65+_black_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/woman/woman_65+_black_complete.png');
          }
        } else {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/woman/woman_65+_placeholder_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/woman/woman_65+_placeholder_complete.png');
          }
        }
      } else {
        throw new Exception('age not defined');
      }
    } else if (gender == 2) {
      if (age < 40) {
        //blond
        if (hairColor == 0) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_40-_blond_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_40-_blond_complete.png');
          }
        }
        // red
        else if (hairColor == 1) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_40-_red_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_40-_red_complete.png');
          }
        }
        // light brown
        else if (hairColor == 2) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_40-_lightBrown_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_40-_lightBrown_complete.png');
          }
        }
        // dark brown
        else if (hairColor == 3) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_40-_darkBrown_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_40-_darkBrown_complete.png');
          }
        }
        // black
        else if (hairColor == 4) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_40-_black_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_40-_black_complete.png');
          }
        } else {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_40-_placeholder_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_40-_placeholder_complete.png');
          }
        }
      } else if (age >= 40 && age < 55) {
        //blond
        if (hairColor == 0) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_40-55_blond_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_40-55_blond_complete.png');
          }
        }
        // red
        else if (hairColor == 1) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_40-55_red_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_40-55_red_complete.png');
          }
        }
        // light brown
        else if (hairColor == 2) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_40-55_lightBrown_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_40-55_lightBrown_complete.png');
          }
        }
        // dark brown
        else if (hairColor == 3) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_40-55_darkBrown_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_40-55_darkBrown_complete.png');
          }
        }
        // black
        else if (hairColor == 4) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_40-55_black_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_40-55_black_complete.png');
          }
        } else {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_40-55_placeholder_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_40-55_placeholder_complete.png');
          }
        }
      } else if (age >= 55 && age < 65) {
        //blond
        if (hairColor == 0) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_55-65_blond_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_55-65_blond_complete.png');
          }
        }
        // red
        else if (hairColor == 1) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_55-65_red_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_55-65_red_complete.png');
          }
        }
        // light brown
        else if (hairColor == 2) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_55-65_lightBrown_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_55-65_lightBrown_complete.png');
          }
        }
        // dark brown
        else if (hairColor == 3) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_55-65_darkBrown_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_55-65_darkBrown_complete.png');
          }
        }
        // black
        else if (hairColor == 4) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_55-65_black_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_55-65_black_complete.png');
          }
        } else {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_55-65_placeholder_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_55-65_placeholder_complete.png');
          }
        }
      } else if (age >= 65) {
        //blond
        if (hairColor == 0) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_65+_blond_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_65+_blond_complete.png');
          }
        }
        // red
        else if (hairColor == 1) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_65+_red_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_65+_red_complete.png');
          }
        }
        // light brown
        else if (hairColor == 2) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_65+_lightBrown_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_65+_lightBrown_complete.png');
          }
        }
        // dark brown
        else if (hairColor == 3) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_65+_darkBrown_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_65+_darkBrown_complete.png');
          }
        }
        // black
        else if (hairColor == 4) {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_65+_black_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_65+_black_complete.png');
          }
        } else {
          if (portrait) {
            return AssetImage(
                'assets/images/avatar/man/man_65+_placeholder_portrait.png');
          } else {
            return AssetImage(
                'assets/images/avatar/man/man_65+_placeholder_complete.png');
          }
        }
      } else {
        throw new Exception('age not defined');
      }
    } else {
      return AssetImage('assets/images/avatar/placeholderFigure.png');
    }
  }

  /// returns correct picture in examination pose and portrait modus. Used for depiction of birthmarks in app, but assets doesn't contain birthmarks(?)
  AssetImage examinationImagePicker(int gender, int age, int hairColor) {
    //male
    if (gender == 0) {
      if (age < 40) {
        //blond
        if (hairColor == 0) {
          return AssetImage('assets/images/avatar/man/man_40-_blond_exam.png');
        }
        // red
        else if (hairColor == 1) {
          return AssetImage('assets/images/avatar/man/man_40-_red_exam.png');
        }
        // light brown
        else if (hairColor == 2) {
          return AssetImage(
              'assets/images/avatar/man/man_40-_lightBrown_exam.png');
        }
        // dark brown
        else if (hairColor == 3) {
          return AssetImage(
              'assets/images/avatar/man/man_40-_darkBrown_exam.png');
        }
        // black
        else if (hairColor == 4) {
          return AssetImage('assets/images/avatar/man/man_40-_black_exam.png');
        }
      } else if (age >= 40 && age < 55) {
        //blond
        if (hairColor == 0) {
          return AssetImage(
              'assets/images/avatar/man/man_40-55_blond_exam.png');
        }
        // red
        else if (hairColor == 1) {
          return AssetImage('assets/images/avatar/man/man_40-55_red_exam.png');
        }
        // light brown
        else if (hairColor == 2) {
          return AssetImage(
              'assets/images/avatar/man/man_40-55_lightBrown_exam.png');
        }
        // dark brown
        else if (hairColor == 3) {
          return AssetImage(
              'assets/images/avatar/man/man_40-55_darkBrown_exam.png');
        }
        // black
        else if (hairColor == 4) {
          return AssetImage(
              'assets/images/avatar/man/man_40-55_black_exam.png');
        }
      } else if (age >= 55 && age < 65) {
        //blond
        if (hairColor == 0) {
          return AssetImage(
              'assets/images/avatar/man/man_55-65_blond_exam.png');
        }
        // red
        else if (hairColor == 1) {
          return AssetImage('assets/images/avatar/man/man_55-65_red_exam.png');
        }
        // light brown
        else if (hairColor == 2) {
          return AssetImage(
              'assets/images/avatar/man/man_55-65_lightBrown_exam.png');
        }
        // dark brown
        else if (hairColor == 3) {
          return AssetImage(
              'assets/images/avatar/man/man_55-65_darkBrown_exam.png');
        }
        // black
        else if (hairColor == 4) {
          return AssetImage(
              'assets/images/avatar/man/man_55-65_black_exam.png');
        }
      } else if (age >= 65) {
        //blond
        if (hairColor == 0) {
          return AssetImage('assets/images/avatar/man/man_65+_blond_exam.png');
        }
        // red
        else if (hairColor == 1) {
          return AssetImage('assets/images/avatar/man/man_65+_red_exam.png');
        }
        // light brown
        else if (hairColor == 2) {
          return AssetImage(
              'assets/images/avatar/man/man_65+_lightBrown_exam.png');
        }
        // dark brown
        else if (hairColor == 3) {
          return AssetImage(
              'assets/images/avatar/man/man_65+_darkBrown_exam.png');
        }
        // black
        else if (hairColor == 4) {
          return AssetImage('assets/images/avatar/man/man_65+_black_exam.png');
        }
      } else {
        return AssetImage('assets/images/avatar/placeholderFigure.png');
      }
    } //woman
    else if (gender == 1) {
      if (age < 40) {
        //blond
        if (hairColor == 0) {
          return AssetImage(
              'assets/images/avatar/woman/woman_40-_blond_exam.png');
        }
        // red
        else if (hairColor == 1) {
          return AssetImage(
              'assets/images/avatar/woman/woman_40-_red_exam.png');
        }
        // light brown
        else if (hairColor == 2) {
          return AssetImage(
              'assets/images/avatar/woman/woman_40-_lightBrown_exam.png');
        }
        // dark brown
        else if (hairColor == 3) {
          return AssetImage(
              'assets/images/avatar/woman/woman_40-_darkBrown_exam.png');
        }
        // black
        else if (hairColor == 4) {
          return AssetImage(
              'assets/images/avatar/woman/woman_40-_black_exam.png');
        }
      } else if (age >= 40 && age < 55) {
        //blond
        if (hairColor == 0) {
          return AssetImage(
              'assets/images/avatar/woman/woman_40-55_blond_exam.png');
        }
        // red
        else if (hairColor == 1) {
          return AssetImage(
              'assets/images/avatar/woman/woman_40-55_red_exam.png');
        }
        // light brown
        else if (hairColor == 2) {
          return AssetImage(
              'assets/images/avatar/woman/woman_40-55_lightBrown_exam.png');
        }
        // dark brown
        else if (hairColor == 3) {
          return AssetImage(
              'assets/images/avatar/woman/woman_40-55_darkBrown_exam.png');
        }
        // black
        else if (hairColor == 4) {
          return AssetImage(
              'assets/images/avatar/woman/woman_40-55_black_exam.png');
        }
      } else if (age >= 55 && age < 65) {
        //blond
        if (hairColor == 0) {
          return AssetImage(
              'assets/images/avatar/woman/woman_55-65_blond_exam.png');
        }
        // red
        else if (hairColor == 1) {
          return AssetImage(
              'assets/images/avatar/woman/woman_55-65_red_exam.png');
        }
        // light brown
        else if (hairColor == 2) {
          return AssetImage(
              'assets/images/avatar/woman/woman_55-65_lightBrown_exam.png');
        }
        // dark brown
        else if (hairColor == 3) {
          return AssetImage(
              'assets/images/avatar/woman/woman_55-65_darkBrown_exam.png');
        }
        // black
        else if (hairColor == 4) {
          return AssetImage(
              'assets/images/avatar/woman/woman_55-65_black_exam.png');
        }
      } else if (age >= 65) {
        //blond
        if (hairColor == 0) {
          return AssetImage(
              'assets/images/avatar/woman/woman_65+_blond_exam.png');
        }
        // red
        else if (hairColor == 1) {
          return AssetImage(
              'assets/images/avatar/woman/woman_65+_red_exam.png');
        }
        // light brown
        else if (hairColor == 2) {
          return AssetImage(
              'assets/images/avatar/woman/woman_65+_lightBrown_exam.png');
        }
        // dark brown
        else if (hairColor == 3) {
          return AssetImage(
              'assets/images/avatar/woman/woman_65+_darkBrown_exam.png');
        }
        // black
        else if (hairColor == 4) {
          return AssetImage(
              'assets/images/avatar/woman/woman_65+_black_exam.png');
        }
      } else {
        return AssetImage('assets/images/avatar/placeholderFigure.png');
      }
    } // diverse
    else if (gender == 2) {
      if (age < 40) {
        //blond
        if (hairColor == 0) {
          return AssetImage('assets/images/avatar/man/man_40-_blond_exam.png');
        }
        // red
        else if (hairColor == 1) {
          return AssetImage('assets/images/avatar/man/man_40-_red_exam.png');
        }
        // light brown
        else if (hairColor == 2) {
          return AssetImage(
              'assets/images/avatar/man/man_40-_lightBrown_exam.png');
        }
        // dark brown
        else if (hairColor == 3) {
          return AssetImage(
              'assets/images/avatar/man/man_40-_darkBrown_exam.png');
        }
        // black
        else if (hairColor == 4) {
          return AssetImage('assets/images/avatar/man/man_40-_black_exam.png');
        }
      } else if (age >= 40 && age < 55) {
        //blond
        if (hairColor == 0) {
          return AssetImage(
              'assets/images/avatar/man/man_40-55_blond_exam.png');
        }
        // red
        else if (hairColor == 1) {
          return AssetImage('assets/images/avatar/man/man_40-55_red_exam.png');
        }
        // light brown
        else if (hairColor == 2) {
          return AssetImage(
              'assets/images/avatar/man/man_40-55_lightBrown_exam.png');
        }
        // dark brown
        else if (hairColor == 3) {
          return AssetImage(
              'assets/images/avatar/man/man_40-55_darkBrown_exam.png');
        }
        // black
        else if (hairColor == 4) {
          return AssetImage(
              'assets/images/avatar/man/man_40-55_black_exam.png');
        }
      } else if (age >= 55 && age < 65) {
        //blond
        if (hairColor == 0) {
          return AssetImage(
              'assets/images/avatar/man/man_55-65_blond_exam.png');
        }
        // red
        else if (hairColor == 1) {
          return AssetImage('assets/images/avatar/man/man_55-65_red_exam.png');
        }
        // light brown
        else if (hairColor == 2) {
          return AssetImage(
              'assets/images/avatar/man/man_55-65_lightBrown_exam.png');
        }
        // dark brown
        else if (hairColor == 3) {
          return AssetImage(
              'assets/images/avatar/man/man_55-65_darkBrown_exam.png');
        }
        // black
        else if (hairColor == 4) {
          return AssetImage(
              'assets/images/avatar/man/man_55-65_black_exam.png');
        }
      } else if (age >= 65) {
        //blond
        if (hairColor == 0) {
          return AssetImage('assets/images/avatar/man/man_65+_blond_exam.png');
        }
        // red
        else if (hairColor == 1) {
          return AssetImage('assets/images/avatar/man/man_65+_red_exam.png');
        }
        // light brown
        else if (hairColor == 2) {
          return AssetImage(
              'assets/images/avatar/man/man_65+_lightBrown_exam.png');
        }
        // dark brown
        else if (hairColor == 3) {
          return AssetImage(
              'assets/images/avatar/man/man_65+_darkBrown_exam.png');
        }
        // black
        else if (hairColor == 4) {
          return AssetImage('assets/images/avatar/man/man_65+_black_exam.png');
        }
      } else {
        return AssetImage('assets/images/avatar/placeholderFigure.png');
      }
    } else {
      return AssetImage('assets/images/avatar/placeholderFigure.png');
    }
  }
}
