# Swiggy Assesment

This repository contains an iOS app built using Swift that mimics the food page of Swiggy with vertical scroll functionality. The app is designed to provide a smooth user experience and adheres to best practices in iOS development. It includes features like a sticky header, pull-to-refresh, horizontal and vertical scrolling sections, and navigation between pages.

---

## Features

### UI Features

- **Sticky Header**
  - A header that remains at the top during vertical scrolling.
  - Includes Address, Search, and Profile sections.

- **Vertical Collection**
  - A vertical collection view divided into multiple sections.
  - Example sections include horizontal image banners and a horizontal restaurant collection.

- **Horizontal Scroll Section**
  - A horizontally scrollable section with a collection of images.

### Pull-to-Refresh Experience

- Implemented a pull-to-refresh gesture below the sticky header.
- Reloads the list content upon refresh.

### Navigation & Interactivity

- **Cell Navigation**
  - Clicking on a cell navigates to a details page.
  - The details page includes a simple layout with text and an image.

### UX Requirements

- App runs without crashes.
- Smooth rendering for large datasets.
- Seamless vertical and horizontal scrolling.
- Smooth page transitions.

### Assumptions

- Mock data or hardcoded content is used.
- No real-time API integration is included.
- UIKit or SwiftUI can be used for implementation.

---

## Bonus Features

- **Tab Widgets**
  - Added tab navigation for easier access to different sections.

- **Sticky Filters**
  - Sticky filters remain visible while scrolling the content.

---

## Getting Started

### Prerequisites

- macOS with Xcode installed.
- Basic knowledge of Swift and iOS development.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/ios-food-page-app.git
   ```

2. Open the project in Xcode:
   ```bash
   cd ios-food-page-app
   open FoodPageApp.xcodeproj
   ```

3. Build and run the app on a simulator or a physical device.

---

## Implementation Details

### Architecture

- **MVC Pattern**: The app follows the Model-View-Controller pattern for simplicity and clarity.
- **Modular Design**: Separate files for each section to ensure clean and maintainable code.

### Technologies Used

- **UIKit/SwiftUI**: Choose one based on preference or requirement.
- **CollectionView**: For creating vertical and horizontal sections.
- **Pull-to-Refresh**: Using `UIRefreshControl` or equivalent.

---

## How to Contribute

1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add feature-name"
   ```
4. Push to the branch:
   ```bash
   git push origin feature-name
   ```
5. Create a pull request.

---

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

---

## Contact

For any questions or feedback, feel free to reach out:

- **Email**: your-email@example.com
- **GitHub**: [Your GitHub Profile](https://github.com/your-profile)

---

Happy Coding! 🎉

