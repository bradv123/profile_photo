# profile_photo

Creates a widget that was designed to be used to display a profile photo, but it could also be used in many other ways

## Features

- Ability to add a custom badge to the widget, could be used to display premium users for example
- Will automatically figure out a users initals to display if no image is given, but a name is
- ImageProvider as an image source to use either network or asset images
- onTap and onLongPress call backs
- Adjustable size
- Adjustable corner radius
- Adjustable outline width
- Adjustable background and outline colors

## Getting started

Add the dependency and add anywhere in widget tree

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
ProfilePhoto(
    totalWidth: 200,
    cornerRadius: 25,
    color: Colors.blue,
    outlineColor: Colors.red,
    outlineWidth: 10,
    textPadding: 10,
    name: 'Brad Varnum',
    fontColor: Colors.white,
    nameDisplayOption: NameDisplayOptions.initials,
    fontWeight: FontWeight.w100,
    showName: true,
    image: const AssetImage('assets/test_profile_photo.jpg'),
    badgeAlignment: Alignment.bottomLeft,
    badgeSize: 60,
    badgeImage: const AssetImage('assets/star.png'),
    onTap: () {
        // open profile for example
    },
    onLongPress: () {
        // popup to message user for example
    },
),
```

![exmaple photo](https://raw.githubusercontent.com/bradv123/profile_photo/master/readme_images/example_screenshot.png)

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
