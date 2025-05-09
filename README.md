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
   git clone https://github.com/Ankit180898/article_app.git
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

## State management

The state management in this app is implemented using GetX, which offers a reactive and lightweight approach to managing state and navigation. It simplifies the data flow by allowing controllers to manage the state of UI components and automatically update them when data changes.

### **1. Article Controller**
- For fetching articles and searching functionality
  
### **2. Favourites Controller**
- For saving an article as favourite
- Displaying the saved articles
  
### **3. Navigation Controller**
- For navigation control i.e changing page and reseting page

## Screenshots
<p float="left">
  <img src="https://github.com/user-attachments/assets/97f879cd-099b-4781-ad6a-367bea4e48a0" width="22%" />
  <img src="https://github.com/user-attachments/assets/8a75894a-3106-45cb-87fb-b23552ce58c6" width="22%" />
   <img src="https://github.com/user-attachments/assets/1df4322a-3920-4ebe-9a2e-3042093060e5" width="22%" />
  <img src="https://github.com/user-attachments/assets/b4a79292-4fe0-4304-b93c-f5851c1e0f41" width="22%" />

</p>

<p float="left">
    <img src="https://github.com/user-attachments/assets/4f5d3c36-4bd5-4dda-bef1-97c25c0ef66d" width="22%" />

</p>





