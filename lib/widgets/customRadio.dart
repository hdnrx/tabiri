import 'package:flutter/material.dart';

/// Horizontal Radio Button Selection
class CustomRadio extends StatefulWidget {
  /// List of RadioButtons
  List<RadioItem> radioButtons;

  /// Function for radioButton click
  final Function onChanged;

  /// padding to the other radio Buttons
  final EdgeInsets edgeInsets;

  /// text scaling for description
  final double textScaleFactor;

  CustomRadio(
      {@required this.radioButtons,
      this.onChanged,
      this.edgeInsets = EdgeInsets.zero,
      this.textScaleFactor = 1.0});

  @override
  createState() {
    return new CustomRadioState();
  }
}

class CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.radioButtons.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.radioButtons
                        .forEach((element) => element.isSelected = false);
                    widget.radioButtons[index].isSelected = true;
                    widget.onChanged(widget.radioButtons[index].value);
                  });
                },
                child: Container(
                  padding: widget.edgeInsets,
                  child: new RadioItemWidget(widget.radioButtons[index]),
                ),
              ),
            ),
            Flexible(
              child: Container(
                padding: widget.edgeInsets,
                child: Text(
                  widget.radioButtons[index].buttonText,
                  textScaleFactor: widget.textScaleFactor,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    color: Color(0xFF5D584E),
                    fontFamily: 'Open Sans',
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Single RadioButton
class RadioItemWidget extends StatelessWidget {
  final RadioItem item;
  RadioItemWidget(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: item.height,
      width: item.width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: item.backgroundColor,
        // highlight selected radio
        border: Border.all(
            color: item.borderColor, width: item.isSelected ? 6.0 : 1.0),
      ),
    );
  }
}

/// Radio Button Model
class RadioItem {
  bool isSelected;
  final int value;
  final String buttonText;
  final Color backgroundColor;
  final Color borderColor;
  final double height;
  final double width;

  RadioItem(
      {this.isSelected,
      this.value,
      this.buttonText,
      this.backgroundColor,
      this.borderColor,
      this.height,
      this.width});
}
