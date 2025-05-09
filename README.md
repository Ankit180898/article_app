# Flutter Article App

A Flutter app that fetches and displays a list of articles from a public API.

## Features

- **List of Articles**: Displays a list of articles fetched from a public API.
- **Search Functionality**: Allows users to search articles with debouncing to optimize performance.
- **Detail View**: Tapping on a list item navigates to a detailed view showing the full-length article title and body.
- **Dark and Light Mode**: The app adapts to the device's system theme (dark or light mode).
- **Shimmer Loading Effect**: Displays a shimmer effect while articles are loading.
- **Like & Unlike Functionality**: Users can like or unlike articles.
- **Favorites Section**: A dedicated navigation item to show a list of favorite articles stored using `shared_preferences`.
- **Pull to Refresh**: Refresh the articles list with a simple pull-down gesture.

## Setup Instructions

1. Clone the repository:
   ```bash
   git clone <>
   cd article_app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Tech Stack

- **Flutter SDK**: Used for building the cross-platform application.
- **State Management**: `GetX` for managing the app's state and navigation.
- **HTTP Client**: `http` package for making API requests.
- **Persistence**: `shared_preferences` for storing favorite articles locally.
- **Other Libraries**:
  - `shimmer` for loading animations.

## Screenshots

## Features in Detail

### **1. List of Articles**
- Displays a list of articles fetched from a public API.
- Implements a shimmer effect while the data is loading.

### **2. Search Functionality**
- Optimized with debouncing to delay API calls until the user stops typing.

### **3. Detail View**
- Displays the full article title and body when an article is tapped.

### **4. Dark and Light Mode**
- Automatically switches between dark and light themes based on the system settings.

### **5. Like & Unlike Articles**
- Allows users to like/unlike articles, with the state saved locally.

### **6. Favorites Section**
- A dedicated "Favorites" tab in the bottom navigation bar to display liked articles.

### **7. Pull to Refresh**
- Users can refresh the list of articles by pulling down on the screen.


