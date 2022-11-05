import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  final double totalWidth;
  final int outlineWidth;
  final double cornerRadius;
  final Color outlineColor;
  final Color color;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final String name;
  final String? fontFamily;
  final Color? fontColor;
  final NameDisplayOptions? nameDisplayOption;
  final FontWeight? fontWeight;
  final int textPadding;
  final ImageProvider? image;
  final bool? showName;
  final ImageProvider? badgeImage;
  final double badgeSize;
  final Alignment badgeAlignment;

  ProfilePhoto({
    required this.totalWidth,
    required this.color,
    this.outlineWidth = 0,
    this.cornerRadius = 10,
    this.outlineColor = Colors.lightBlue,
    this.onTap,
    this.onLongPress,
    this.name = '',
    this.nameDisplayOption = NameDisplayOptions.initials,
    this.fontColor,
    this.fontFamily,
    this.fontWeight,
    this.textPadding = 10,
    this.image,
    this.showName,
    this.badgeAlignment = Alignment.bottomRight,
    this.badgeImage,
    this.badgeSize = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _initials = '';
    String _firstName = '';
    String _lastName = '';
    String _textToShow = '';
    bool _showText = true;
    String _name = name;

    if (_name != '') {
      if (_name.trim().contains(' ')) {
        _name = name.trim();
        _firstName = '${name.substring(0, name.indexOf(' '))}';
        _lastName = '${name.substring(name.indexOf(' ') + 1, name.length)}';
        _initials =
            '${name.substring(0, 1)}${name.substring(name.indexOf(' ') + 1, name.indexOf(' ') + 2)}';
      } else {
        _firstName = name;
        _lastName = name;
        _initials = '${name.substring(0, 1)}';
      }
    } else {
      _initials = ' ';
    }

    switch (nameDisplayOption) {
      case NameDisplayOptions.firstName:
        _textToShow = _firstName;
        break;
      case NameDisplayOptions.lastName:
        _textToShow = _lastName;
        break;
      case NameDisplayOptions.initials:
        _textToShow = _initials;
        break;
      case NameDisplayOptions.dontChange:
        _textToShow = name;
        break;
      case NameDisplayOptions.splitFullName:
        _textToShow = '${_firstName}\r\n${_lastName}';
        break;
      default:
        _textToShow = ' ';
        break;
    }

    if (image != null) {
      _showText = showName == null ? false : showName!;
    } else if (image == null) {
      _showText = showName == null ? true : showName!;
    }

    return GestureDetector(
      onTap: onTap ?? () {},
      onLongPress: onLongPress ?? () {},
      child: Stack(
        alignment: Alignment.center,
        children: [
          // background circle as outline
          Container(
            width: totalWidth,
            height: totalWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(cornerRadius),
              color: outlineColor,
            ),
          ),

          // circle on top for main circle
          Container(
            width: (totalWidth) - (outlineWidth * 2) > 0
                ? (totalWidth) - (outlineWidth * 2)
                : 0,
            height: (totalWidth) - (outlineWidth * 2) > 0
                ? (totalWidth) - (outlineWidth * 2)
                : 0,
            decoration: BoxDecoration(
              borderRadius: cornerRadius - outlineWidth > 0
                  ? BorderRadius.circular(cornerRadius - (outlineWidth))
                  : BorderRadius.circular(cornerRadius),
              color: color,
            ),
            child: image != null
                ? ClipRRect(
                    child: Image(image: image!),
                    borderRadius: cornerRadius - outlineWidth > 0
                        ? BorderRadius.circular(cornerRadius - (outlineWidth))
                        : BorderRadius.circular(cornerRadius),
                  )
                : null,
          ),

          // Top text layer
          if (_showText)
            Container(
              width: (totalWidth) - (outlineWidth * 2) - (textPadding * 2) > 0
                  ? (totalWidth) - (outlineWidth * 2) - (textPadding * 2)
                  : 0,
              height: (totalWidth) - (outlineWidth * 2) - (textPadding * 2) > 0
                  ? (totalWidth) - (outlineWidth * 2) - (textPadding * 2)
                  : 0,
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  _textToShow,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 200,
                    fontWeight: fontWeight,
                    color: fontColor,
                    fontFamily: fontFamily,
                  ),
                ),
              ),
            ),
          if (badgeImage != null)
            Container(
              width: totalWidth,
              height: totalWidth,
              child: Align(
                alignment: badgeAlignment,
                child: Container(
                  width: badgeSize,
                  height: badgeSize,
                  child: badgeImage != null ? Image(image: badgeImage!) : null,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

enum NameDisplayOptions {
  firstName,
  lastName,
  splitFullName,
  initials,
  dontChange
}
