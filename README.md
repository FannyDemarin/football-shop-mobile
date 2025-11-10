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

## Assignment 8 Questions

### 1. Explain the difference between `Navigator.push()` and `Navigator.pushReplacement()` in Flutter. In what context of your application is each best used?

- **`Navigator.push()`** adds a new route (page) on top of the current one, keeping the previous screen in the navigation stack.  
  *Best used when you want users to be able to go back*, for example: when navigating from the home page to the product form page.

  ```dart
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ProductFormPage()),
  );
  ```

- **`Navigator.pushReplacement()`** replaces the current route with a new one, removing the previous page from the stack.  
  *Best used after completing an action*, such as submitting a form, when you don’t want users to navigate back to the form page.

  ```dart
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const HomePage()),
  );
  ```

---

### 2. How do you use hierarchy widgets like `Scaffold`, `AppBar`, and `Drawer` to build a consistent page structure in your application?

These widgets define a **consistent layout framework** for every screen in the Football Shop app:

- **`Scaffold`** provides the basic structure — it defines the body, app bar, floating action buttons, and drawer.  
- **`AppBar`** displays the page title at the top, giving each screen a clear identity.  
- **`Drawer`** (here implemented as `LeftDrawer`) allows navigation between different pages of the app.

Example:

```dart
Scaffold(
  appBar: AppBar(
    title: const Center(child: Text('Add Product Form')),
    backgroundColor: Colors.indigo,
    foregroundColor: Colors.white,
  ),
  drawer: const LeftDrawer(),
  body: ...,
);
```

Using the same structure across all pages ensures a **uniform and professional layout**.

---

### 3. In the context of user interface design, what are the advantages of using layout widgets like `Padding`, `SingleChildScrollView`, and `ListView` when displaying form elements? Provide usage examples from your application.

These layout widgets make forms more **readable, scrollable, and visually balanced**:

- **`Padding`** adds spacing around elements to prevent them from being cramped.  
- **`SingleChildScrollView`** allows the entire form to scroll, avoiding overflow when the keyboard appears or on smaller screens.  
- **`ListView`** (or `Column` with scroll view) structures the form elements vertically and makes the UI cleaner.

Example from `ProductFormPage`:

```dart
body: Form(
  key: _formKey,
  child: SingleChildScrollView(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(...),
        const SizedBox(height: 10),
        TextFormField(...),
        // ...
      ],
    ),
  ),
),
```

This design ensures the form remains usable on any device or orientation.

---

### 4. How do you set the color theme so that your Football Shop have a visual identity that is consistent with the shop brand?

Define a global theme in `MaterialApp` and reuse the primary color across the app to keep the visual identity consistent:

```dart
MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primarySwatch: Color(0xFF0D1B2A),
    colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF0D1B2A)),
  ),
  home: HomePage(),
);
```

The consistent use of colours (app bars, buttons, icons) reinforces the shop's visual identity and improves the user experience.

