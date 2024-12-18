
# MangaTime 📚

**MangaTime** is a SwiftUI application that helps manga enthusiasts organize and track their favorite manga, discover new series, and keep an updated list of what they are currently reading. Inspired by TV Time, this app is tailored to manga fans!

---

## Features 🚀

- **Explore Manga**: Browse through a collection of popular manga with detailed information.
- **Manga Details**: View a manga's title, image, genres, authors, synopsis, chapters, and status.
- **Personalized List**: Add manga to your personal list to track your progress or mark them as favorites.
- **Customizable Home**: Easily access your manga list and manage it from the HomeView.
- **Interactive UI**: Enjoy a smooth and user-friendly SwiftUI interface.

---

## Screenshots 📷

_Add some screenshots of your app here to showcase its features._

---

## Getting Started 🛠️

Follow these steps to set up **MangaTime** on your local machine.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/MangaTime.git
   cd MangaTime
   ```
2. Open the `MangaTime.xcodeproj` file in Xcode.
3. Build and run the project on the iOS Simulator or your device.

---

## Usage 📖

1. Launch the app.
2. Browse the manga list on the Home screen.
3. Tap on a manga to view detailed information.
4. Add manga to your personal list by tapping the "ADD TO LIST" button.
5. Use the search feature to find new manga and expand your library.

---

## Code Structure 🧩

### Main Components

- **Models**
  - `Manga`: The data model representing a manga.
- **Views**
  - `HomeView`: Displays the main screen with the user's manga list.
  - `MangaDetailView`: Shows detailed information about a specific manga.
  - `SearchView`: Allows users to search for and add manga to their list.
- **ViewModels**
  - Manage the state and data for the views.

---

## Example Manga Data

```swift
let mangaList = [
    Manga(title: "Naruto", image: "narutoImage", status: "Completed", genres: ["Action", "Adventure"], authors: ["Masashi Kishimoto"], synopsis: "Naruto Uzumaki, a young ninja...", chapters: 700, isFavorite: false),
    Manga(title: "One Piece", image: "onePieceImage", status: "Ongoing", genres: ["Action", "Adventure", "Fantasy"], authors: ["Eiichiro Oda"], synopsis: "The story of Monkey D. Luffy...", chapters: 1000, isFavorite: true),
    // Add more manga here
]
```

---

## License 📜

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Acknowledgments 🎉

- **SwiftUI** for its elegant declarative UI framework.
- **Manga authors** for their amazing creations that inspired this app.
- Community contributors and testers.


Happy Manga Reading! 🎉
