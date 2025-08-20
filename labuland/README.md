# Labuland - Labubu Dolls E-commerce App

A beautiful Flutter application for showcasing and selling Labubu dolls with smooth animations and a modern UI.

## Features

- Animated splash screen with the Labuland logo
- Swipeable doll cards with matching color schemes
- Color selection options for each doll
- Detailed view for each doll with add to cart functionality
- Drawer menu with doll collection navigation
- Smooth animations and transitions
- Responsive design that works on different screen sizes

## Requirements

- Flutter 3.x
- Dart 3.x

## Setup Instructions

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Add your Labubu doll images to the `assets/images/` directory with the following names:
   - labubu1.jpg
   - labubu2.jpg
   - labubu3.jpg
   - labubu4.jpg
   - labubu5.jpg
4. Run the app using `flutter run`

## Dependencies

- flutter_animate: ^4.5.2
- google_fonts: ^6.1.0
- card_swiper: ^3.0.1

## Project Structure

- `/lib`
  - `/models` - Contains the Labubu doll data model
  - `/screens` - Contains the app screens (home, detail, splash)
  - `/widgets` - Contains reusable UI components
  - `/theme` - Contains app theme settings

## Customization

You can customize the app by:
1. Updating the LabubuDoll model data in `lib/models/labubu_doll.dart`
2. Changing the color schemes in the doll model
3. Updating the theme in `lib/theme/app_theme.dart`
4. Adding actual images of Labubu dolls to the assets folder

## Next Steps

- Implement shopping cart functionality
- Add user authentication
- Create checkout process
- Add favorites feature
- Implement search functionality

## Credits

Created for Labuland to showcase Labubu dolls.
