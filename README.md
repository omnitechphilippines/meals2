# 🍽️ Meals App 2

An enhanced version of "Meals". A Flutter application that lets users explore a variety of meals categorized by cuisine and filtered by dietary preferences. Users can also favorite meals they love!

---

## ✨ Features

- 🔍 **Meal Categories**  
  Browse meals by different cuisines such as:
    - Asian
    - French
    - Italian
    - Hamburgers
    - Exotic
    - ...and more!

- 🥦 **Dietary Filters**  
  Filter meals based on your dietary needs:
    - Gluten-free
    - Lactose-free
    - Vegetarian
    - Vegan

- ❤️ **Favorites**  
  Mark meals as favorites and easily access them anytime.

---

## 🛠️ Tech Stack

- [Flutter](https://flutter.dev/)
- Dart
- State management

---

## 📦 Platforms Supported

- 🕹️ Web (HTML5)
- 💻 Windows
- 📱 Android

---

## 📸 Screenshots

> Screenshots from each platform

### 🖥️ Windows

| Home                                                  | Category                                                      | Filters                                                     | Favorites                                                       | Meal                                                            |
|-------------------------------------------------------|---------------------------------------------------------------|-------------------------------------------------------------|-----------------------------------------------------------------|-----------------------------------------------------------------|
| ![Windows Home](screenshots/windows/windows-home.png) | ![Windows Category](screenshots/windows/windows-category.png) | ![Windows Filters](screenshots/windows/windows-filters.png) | ![Windows Favorites](screenshots/windows/windows-favorites.png) | ![Windows Spaghetti](screenshots/windows/windows-spaghetti.png) |

### 🌐 Web

| Home                                      | Category                                          | Filters                                         | Favorites                                           | Meal                                                |
|-------------------------------------------|---------------------------------------------------|-------------------------------------------------|-----------------------------------------------------|-----------------------------------------------------|
| ![Web Home](screenshots/web/web-home.png) | ![Web Category](screenshots/web/web-category.png) | ![Web Filters](screenshots/web/web-filters.png) | ![Web Favorites](screenshots/web/web-favorites.png) | ![Web Spaghetti](screenshots/web/web-spaghetti.png) |

### 📱 Android

| Home                                                                      | Category                                                                          | Filters                                                                         | Favorites                                                                           | Meal                                                                                |
|---------------------------------------------------------------------------|-----------------------------------------------------------------------------------|---------------------------------------------------------------------------------|-------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------|
| ![Android Portrait Home](screenshots/android/android-portrait-home.png)   | ![Android Portrait Category](screenshots/android/android-portrait-category.png)   | ![Android Portrait Filters](screenshots/android/android-portrait-filters.png)   | ![Android Portrait Favorites](screenshots/android/android-portrait-favorites.png)   | ![Android Portrait Spaghetti](screenshots/android/android-portrait-spaghetti.png)   |
| ![Android Landscape Home](screenshots/android/android-landscape-home.png) | ![Android Landscape Category](screenshots/android/android-landscape-category.png) | ![Android Landscape Filters](screenshots/android/android-landscape-filters.png) | ![Android Landscape Favorites](screenshots/android/android-landscape-favorites.png) | ![Android Landscape Spaghetti](screenshots/android/android-landscape-spaghetti.png) |

---

## 🌐 Live Demo

- 🔗 **Web (GitHub Pages):**  
  [Demo](https://omnitechphilippines.github.io/meals2/)

---

## 📦 Download Releases

- 💻 **Windows (.7z):**  
  [Download for Windows {{VERSION}}](https://github.com/omnitechphilippines/meals2/releases/download/{{ENCODED_VERSION}}/windows-release-{{ENCODED_VERSION}}.7z)

- 📱 **Android (.apk):**  
  [Download for Android {{VERSION}}](https://github.com/omnitechphilippines/meals2/releases/download/{{ENCODED_VERSION}}/app-release-{{ENCODED_VERSION}}.apk)

- 🌐 **Web build (.7z):**  
  [Download Web Build {{VERSION}}](https://github.com/omnitechphilippines/meals2/releases/download/{{ENCODED_VERSION}}/web-release-{{ENCODED_VERSION}}.7z)

> You can also find all versions in the [Releases Page](https://github.com/omnitechphilippines/meals2/releases)

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `v3.29.0`
- Dart SDK `v3.7.0`

### Run the app

```bash
# Clone the repo
git clone https://github.com/omnitechphilippines/meals2.git
cd meals2

# Get packages
flutter pub get

# Run the game (Web)
flutter run -d chrome

# Run the game (Windows)
flutter config --enable-windows-desktop
flutter run -d windows

# Run the game (Android)
flutter run -d android
