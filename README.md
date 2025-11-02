# Football Shop Flutter App

## Assignment 7 Questions

### 1. What is a widget tree in Flutter?
A widget tree represents the structure of widgets in a Flutter app. Each widget can have child widgets, and together they form a hierarchy — the "tree". Parent widgets control the layout and positioning of their child widgets.

### 2. List all the widgets used in this project and explain their functions.
- **MaterialApp**: Root widget that sets up themes, navigation, etc.
- **Scaffold**: Provides the basic visual layout structure (AppBar, Body, Snackbar).
- **AppBar**: Displays the app title at the top.
- **Center**: Centers its child widget.
- **Column**: Lays out its children vertically.
- **ElevatedButton.icon**: Button with both an icon and text.
- **SnackBar**: Displays brief messages at the bottom of the screen.
- **SizedBox**: Adds vertical space between widgets.
- **Icon** and **Text**: Show icons and text labels inside buttons.

### 3. What is the function of the MaterialApp widget?
It is the root widget of most Flutter apps. It configures the app’s theme, routes, and basic visual structure.

### 4. Difference between StatelessWidget and StatefulWidget.
- **StatelessWidget**: Immutable — doesn’t change once built.
- **StatefulWidget**: Mutable — can change dynamically (like counters or animations).
So we have to choose **StatelessWidget** when the UI doesn’t depend on changing data, otherwise we use **StatefulWidget**.

### 5. What is BuildContext and why is it important?
`BuildContext` provides information about where a widget is located in the widget tree. It’s used to access theme data, navigation, or show widgets like SnackBars.

### 6. What is a “hot reload” in Flutter and how does it differ from a “hot restart”?
- **Hot reload**: Updates the app’s UI instantly without losing the current app state.
- **Hot restart**: Restarts the app from scratch and resets all state.
