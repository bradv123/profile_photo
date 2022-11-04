import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {

  int radius;
  int outlineWidth;
  Color outlineColor;
  Color color;
  VoidCallback? onTap;
  VoidCallback? onLongPress;
  String name;
  TextStyle? textStyle;
  String? fontFamily;
  Color? fontColor;
  NameDisplayOptions? nameDisplayOption;
  FontWeight? fontWeight;
  int textPadding;


  ProfilePhoto({ 
    required this.radius, 
    required this.color,

    this.outlineWidth = 0,
    this.outlineColor = Colors.lightBlue,
    this.onTap,
    this.onLongPress,
    this.name = '',
    this.textStyle,
    this.nameDisplayOption = NameDisplayOptions.initials,
    this.fontColor,
    this.fontFamily,
    this.fontWeight,
    this.textPadding = 10,

    Key? key,
    }) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    String _initials = '';
    String _firstName = '';
    String _lastName = '';
    String _textToShow = '';

    if (name != '') {
      if (name.trim().contains(' ')) {
        name = name.trim();
        _firstName = '${name.substring(0,name.indexOf(' '))}';
        _lastName = '${name.substring(name.indexOf(' ')+1, name.length)}';
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
    // print('First Name: $_firstName');
    // print('Last Name: $_lastName');
    // print('Initials: $_initials');
    switch(nameDisplayOption){
      
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
      default:
        _textToShow = ' ';
      break;
    }

    
    return GestureDetector(
      onTap: onTap ?? (){},
      onLongPress: onLongPress ?? (){},
      child: Stack(
        alignment: Alignment.center,
        children: [
          // background circle as outline
          Container(
            width: radius*2,
            height: radius*2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: outlineColor,
              ),
          ),
          // circle on top for main circle
          Container(
            width: ( radius * 2 ) - ( outlineWidth * 2 ),
            height: ( radius * 2 ) - ( outlineWidth * 2 ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              ),
          ),
          Container(
            width: ( radius * 2 ) - ( outlineWidth * 2 ) - (textPadding * 2),
            alignment: Alignment.center,
            //height: 24,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                _textToShow,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 150,
                  fontWeight: fontWeight,
                  color: fontColor,
                  fontFamily: fontFamily,
                ),
              ),
            ),
          ),
          // SizedBox(
          //   child: Text(
          //     name, 
          //     style: TextStyle(
          //       fontSize: 22,
          //       fontFamily: fontFamily,
          //       color: fontColor,
          //     ),
          //   ),
          // ),
          
        ],
      ),
    );
  }
}

enum NameDisplayOptions { firstName, lastName, initials, dontChange }