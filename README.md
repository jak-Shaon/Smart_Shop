# Flutter Smart Shop

**Smart Shop** is a sleek, mini e-commerce Flutter application designed to showcase core e-commerce features such as user authentication, product browsing, favourites, cart management, theme toggling, and persistent login state. The app consumes the [FakeStore API](https://fakestoreapi.com) to fetch product data.

---

## Features

* **User Authentication**

  * Login and Register screens with form validation
  * Persistent login state using `SharedPreferences`
  * Splash screen that routes users based on login status

* **Product Browsing**

  * Fetch and display products from FakeStore API
  * Show product details: name, price, image, and rating
  * Add/remove products to favourites and persist state
  * Add/remove products to cart with item count badge

* **Sorting and Refresh**

  * Sort products by price (low → high, high → low) and rating
  * Pull-to-refresh product list with `RefreshIndicator`

* **Cart Management**

  * View cart items with total price calculation
  * Remove items from cart and clear entire cart

* **Theme Toggle**

  * Light and dark mode support with toggle switch
  * Persist user’s theme preference

* **Navigation & UI**

  * Drawer menu for easy navigation: Home, Cart, Profile, Favourites, Logout
  * Smooth navigation between screens with Provider state management
  * Responsive and clean UI with Flutter widgets and Material Design

---

## Screenshots



---

## Getting Started

### Prerequisites

* Flutter SDK installed ([Flutter installation guide](https://flutter.dev/docs/get-started/install))
* Android Studio or Visual Studio Code (recommended IDEs)
* An emulator or physical device connected

### Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/yourusername/smart-shop.git
   cd smart-shop
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the app:

   ```bash
   flutter run
   ```

---

## Project Structure

```
lib/
├── models/               # Data models (Product, etc.)
├── providers/            # State management (AuthProvider, ProductProvider, CartProvider, ThemeProvider)
├── screens/              # UI screens (Login, Register, Home, Cart, Profile, Favourites, Splash)
├── services/             # API service to fetch data
├── utils/                # Utility classes (SharedPreferences helpers)
├── widgets/              # Reusable widgets (ProductCard, CustomDrawer)
├── routes/               # App route management
main.dart                # App entry point
```

---

## Dependencies

* `provider` - State management
* `shared_preferences` - Persistent storage
* `http` - REST API calls
* `flutter_rating_bar` - Display star ratings
* `flutter/material.dart` - Flutter core UI framework

---

## Usage

* Use the dummy credentials to login:

  * **Email:** [user@example.com](mailto:user@example.com)
  * **Password:** 123456

* Navigate through the drawer menu to browse products, view cart, favourites, and profile.

* Add or remove products from cart and favourites.

* Toggle dark/light theme in the drawer.

* Logout to clear session and return to login screen.

---

## Future Improvements

* Integrate real user authentication API
* Implement product details screen with more info
* Add search functionality
* Implement checkout and payment flow
* Improve UI animations and responsiveness

---

## License

This project is open source and available under the MIT License.

---

## Contact

For questions, feedback, or contributions, please contact:
**Jahidul Alam Khan Shaon** – [jahidshaon28@gmail.com](mailto:jahidshaon28@gmail.com)
GitHub: [github.com/jak_Shaon](https://github.com/jak-Shaon)

---

Thanks for checking out **Smart Shop**! 🚀🛒

