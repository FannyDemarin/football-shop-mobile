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

## Assignment 9 Questions

### 1.  Explain why we need to create a Dart model when fetching/sending JSON data. What are the consequences of directly mapping `Map<String, dynamic>` without using a model (in terms of type validation, null safety, and maintainability)?

When working with JSON data in Flutter, it is important to create a Dart model instead of directly using a `Map<String, dynamic>`. A model enforces type validation, which means that the data you receive or send must match the expected structure. This prevents runtime errors that can occur when keys are missing or values have the wrong type. 

Models also provide null safety by clearly defining which fields are required and which are optional, reducing the risk of null reference bugs. 

In addition, using models improves maintainability because all parsing and serialization logic is centralized in one place. If the backend changes, you only need to update the model rather than searching through the entire codebase. 

Finally, models make the code more readable and self‑documenting, allowing developers to quickly understand the data structure

### 2. What is the purpose of the http and CookieRequest packages in this assignment? Explain the difference between their roles.

The `http` package is used for basic HTTP communication such as sending GET and POST requests. It is suitable for stateless interactions where cookies or session management are not required. In contrast, the `CookieRequest` package is designed to handle requests that require session persistence. It automatically stores cookies returned by the server and attaches them to subsequent requests, which is essential for authentication flows such as login and logout. In short, `http` is a general‑purpose networking tool, while `CookieRequest` is specialized for session‑aware communication with the backend. 

### 3. Explain why the CookieRequest instance needs to be shared across all components in the Flutter application.

The `CookieRequest` instance needs to be shared across all components in the Flutter application because it maintains the session state. If each widget created its own instance, cookies would not persist and the authentication state would be lost. Sharing a single instance ensures that all parts of the app consistently know whether the user is logged in. It also avoids redundant network setups and provides a smoother user experience, since the user does not need to re‑authenticate when navigating between screens.

### 4. Explain the connectivity configuration required for Flutter to communicate with Django. Why do we need to add 10.0.2.2 to **ALLOWED_HOSTS**, enable **CORS** and **SameSite/cookie settings**, and add internet access permission in Android? What would happen if these configurations were not set correctly?

- Add **`10.0.2.2`** to `ALLOWED_HOSTS` because the Android emulator maps localhost requests to this IP. Without it, Django rejects requests as unauthorized.  
- Enable **CORS (Cross‑Origin Resource Sharing)** so Flutter, running from a different origin, can access Django resources. Without CORS, requests are blocked.  
- Configure **SameSite and cookie settings** to allow cookies to be sent across domains. Without proper settings, authentication cookies will not be stored.  
- Add **internet access permission** in `AndroidManifest.xml`. Without this, all network calls from Flutter will fail.  
- If these configurations are not set correctly, requests may be blocked, cookies may be lost, or the app may fail to connect entirely.  

### 5.Describe the data transmission mechanism—from user input to being displayed in Flutter.

- The user enters input in Flutter (e.g., filling out a form).  
- Flutter sends the request to the backend using `http` or `CookieRequest`.  
- Django processes the request, validates the input, and stores or retrieves data.  
- Django responds with JSON data.  
- Flutter parses the JSON into a Dart model, ensuring type safety.  
- The UI updates to display the data in widgets.  

### 6. Explain the authentication mechanism for login, registration, and logout—from entering account data in Flutter to Django’s authentication process and displaying the menu in Flutter.

- **Login**:  
  - User enters credentials in Flutter.  
  - `CookieRequest` sends them to Django’s `/login/`.  
  - Django verifies credentials, creates a session, and returns cookies.  
  - Flutter stores cookies and updates the UI to show the authenticated menu.  

- **Registration**:  
  - User fills out the registration form in Flutter.  
  - Data is sent to Django’s `/register/`.  
  - Django creates a new user and returns confirmation.  
  - Flutter shows a success message or redirects to the login page.  

- **Logout**:  
  - User triggers logout in Flutter.  
  - `CookieRequest` calls Django’s `/logout/`.  
  - Django clears session cookies.  
  - Flutter updates the UI to show the guest 

### 7. Explain how you implemented the checklist above step-by-step (not just following a tutorial).

1. I ensured that my Django project was deployed correctly and accessible. I tested the endpoints directly in the browser to confirm that the JSON responses were correct and that the authentication system was working.  
2. I implemented an account registration feature in Flutter with fields matching Django’s user model. The form sends data to the `/register/` endpoint using `CookieRequest`.  
3. I created a login page in Flutter with username and password fields. The login request is sent to Django’s `/login/` endpoint, and the session cookie is stored by `CookieRequest`.  
4. I integrated Django’s authentication system with Flutter by creating a news authentication app in my Django project relying on `CookieRequest` to maintain the session state.  
5. I created a Dart model that mirrors my Django item model. I checked my Django model to decide which fields to include, such as `name`, `price`, `description`, `thumbnail`, `category`, and `is_featured`.  
6. I built an item list page in Flutter that fetches items from Django’s JSON endpoint and displays them in a grid layout. To make the app feel like a shopping site, I customized the design so multiple products appear per row, and the number of products per row decreases when the window is resized.  
7. I displayed the relevant fields from my model on each product card, inspired by the design of my Django app.  
8. I added navigation so that tapping on an item card opens a detail page showing all attributes of the item model, with a back button to return to the list.  
9. For filtering, I reused the logic already implemented in Django instead of duplicating it in Flutter. This way, only items belonging to the logged‑in user are displayed. I just adapt the creation of button with my flutter app and design. I also created a new fonction in the main/views of django app to show the json filtered ( since this logic waw with ajax in the django app )
10. Throughout the process, I was strongly inspired by my Django application, both in terms of design and methodology, which helped keep the two projects consistent and to know what to do.