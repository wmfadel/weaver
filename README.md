# Pomo
A Flutter-based Pomodoro timer app designed for productivity, primarily targeting macOS and web platforms. Built with a minimalist approach, it focuses on core functionality over extensive responsiveness across devices.

## Overview
Pomo is a lightweight tool for managing work and study sessions using the Pomodoro Technique. It features a clean interface and basic timer controls, originally prototyped in Figma and implemented in Flutter for cross-platform use.

### The Pomodoro Technique
The Pomodoro Technique, created by Francesco Cirillo, divides work into 25-minute focused intervals ("Pomodoros") with 5-minute breaks, and a longer break after four cycles. It enhances focus by minimizing distractions, boosts productivity through small, achievable goals, and improves time management with regular resets. Pomo brings this method to macOS and web for efficient task handling.

- **Platforms**: macOS (primary), Web (functional but not fully responsive)  
- **Original Design**: [Figma Community File](https://www.figma.com/community/file/1112830528857083939)  
- **Screenshot**:  
  ![Pomo Screenshot](https://user-images.githubusercontent.com/32733023/216771053-b12bd2fe-fd3c-4233-9347-a51c9a7719fa.png)

## Features

- Full control on the Pomodoro settings
- Visual feedback
- Simple, distraction-free UI 

## Code Structure

The project follows a clean, modular architecture in Flutter, leveraging Dart for efficient state management and UI rendering.

- **`lib/main.dart`**: Entry point initializing the app with `MaterialApp` and routing to the home screen  
- **`lib/screens/home.dart`**: Core screen housing the Pomodoro timer UI and logic  
  - Uses `StatefulWidget` for dynamic timer updates  
  - Implements a `Timer` from `dart:async` to handle countdown functionality  
- **`lib/widgets/`**: Reusable components  
  - `circular_progress.dart`: Custom widget for the animated progress ring  
  - `timer_controls.dart`: Buttons for start, pause, and reset actions  
- **State Management**: Basic `setState` for simplicity, suitable for a small-scale app  

## Technical Details

- **Flutter Version**: Compatible with Flutter 3.x (as of last commit in 2023)  
- **Dependencies**: Minimal, relying on Flutter’s core libraries (`flutter/material.dart`, `dart:async`)  


