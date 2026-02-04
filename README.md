# 📱 Flutter Calculator App

A sleek, professional-grade calculator app built with Flutter. This project was developed as the final graduation project for the **[Bootcamp Name]**. It demonstrates the use of custom widgets, state management, and external mathematical parsing.

## 🚀 Features
- **Clean UI:** Dark-themed interface with high-contrast buttons.
- **Dynamic Calculation:** Uses `math_expressions` to parse and evaluate complex strings.
- **Precision:** Automatically formats results to remove unnecessary decimal zeros (e.g., `5.0` becomes `5`).
- **Error Handling:** Gracefully handles division by zero and syntax errors.
- **Clean Architecture:** Built using custom reusable widgets for better maintainability.

## 🛠️ Tech Stack
- **Framework:** Flutter
- **Language:** Dart
- **Library:** [math_expressions](https://pub.dev/packages/math_expressions)

## 🏗️ Key Implementation Concepts

### 1. Reusable Custom Widgets
To keep the code clean and maintainable, I developed a `CustomBottom` widget that accepts:
- `title`: The text to display.
- `color`: Background color for different button types.
- `onPressed`: A callback function to handle logic.

### 2. Logic Handling (Switch Case)
The app uses a `switch-case` structure to handle button presses efficiently:
- **C:** Resets the screen.
- **⌫:** Removes the last character.
- **=:** Triggers the parser to calculate the result.
- **Operators (x, ÷, +, -):** Appends the operator to the equation string.



### 3. Mathematical Parsing
The core logic relies on converting the user's input string into a mathematical expression tree:
```dart
Parser p = Parser();
Expression exp = p.parse(expression);
double eval = exp.evaluate(EvaluationType.REAL, cm);