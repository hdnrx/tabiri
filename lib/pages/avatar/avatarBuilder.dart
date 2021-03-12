import 'package:flutter/material.dart';

class AvatarBuilder extends StatelessWidget {
  // 0 - male, 1 - female, 2 - diverse
  final int sex;
  final int age;

  // 0 - blond, 1 - orangeRed, 2 - lightBrown, 3 - darkBrown, 4 - black
  final int hairColor;

  // -1 - no data, 0 - none, 1 - few(1-2), 2 - several(3-9), 3 - many(10+)
  final int birthmark;

  /// circle portrait
  final bool portrait;

  /// birthmark selection avatar
  final bool birthmarkPortrait;

  final double borderScale;

  AvatarBuilder(
      {@required this.sex,
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

  Widget avatarPortrait() {
    return portrait
        ? Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: birthmarkPortrait
                    ? examinationImagePicker(
                        sex, age, hairColor, birthmark, portrait)
                    : basicImagePicker(sex, age, hairColor, portrait),
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
                image: basicImagePicker(sex, age, hairColor, portrait),
              ),
            ),
          );
  }

  AssetImage basicImagePicker(
    int sex,
    int age,
    int hairColor,
    bool portrait,
  ) {
    if (sex == 0) {
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
        }
      } else if (age >= 55 && age < 65) {
      } else if (age >= 65) {
      } else {
        throw new Exception("age not defined");
      }
    } else if (sex == 1) {
    } else if (sex == 2) {
    } else {
      throw new Exception("sex not defined");
    }
  }

  AssetImage examinationImagePicker(
    int sex,
    int age,
    int hairColor,
    int birthmark,
    bool portrait,
  ) {}
}
