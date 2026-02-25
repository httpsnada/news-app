# 📰 News App

A modern Flutter news application that allows users to explore the latest headlines by category, search for articles, and filter content by sources.

---

## ✨ Features

* 🗂 Browse news by category (General, Sports, Entertainment, etc.)
* 🔍 Search for articles
* 📡 Filter news by source
* 🌐 Multi-language support (Arabic 🇪🇬 / English 🇺🇸)
* 🎨 Light & Dark themes
* 🔄 Pull-to-refresh
* 📄 Pagination (load more articles)
* 🌍 Open full articles in browser

---

## 🧠 Architecture

This project follows **MVVM (Model-View-ViewModel)** architecture to ensure scalability and separation of concerns.

### Layers:

* **Model** → Data models (Article, Source)
* **View** → UI (Screens & Widgets)
* **ViewModel** → Business logic & state handling

---

## ⚙️ Tech Stack

* **Flutter**
* **REST APIs** (via Dio)
* **State Management:** Provider
* **Architecture:** MVVM
* **Networking:** Dio + Interceptors
* **Error Handling:** Custom Exceptions
* **Localization:** Flutter Intl
* **Theming:** Light / Dark mode support

---

## 🌐 API

This app uses the **NewsAPI** to fetch articles and sources.

---

## 📁 Project Structure

```
lib/
│
├── core/
│   ├── constants/
│   ├── errors/
│   └── network/
│   └── storage/
│   └── theme/
│   └── utils/
│
├── features/
│   └── news/
│       ├── data/
│       ├── presentation/
│       └── viewmodels/
│
└── main.dart
```

---

## 📸 Screenshots


| Home                        | News                        |
|-----------------------------|-----------------------------|
| ![](screens/home_light.png) | ![](screens/news_light.png) |
| --------------------------- | --------------------------- |
| ![](screens/home_dark.png)  | ![](screens/news_dark.png)  |


