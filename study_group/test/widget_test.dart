import 'package:flutter_test/flutter_test.dart';
import 'package:study_group/main.dart'; // Importez votre application principale

void main() {
  testWidgets('HomeScreen loads successfully', (WidgetTester tester) async {
    // Construire l'application.
    await tester.pumpWidget(MyApp());

    // Vérifiez si un widget spécifique au HomeScreen est affiché.
    expect(find.text('Home'), findsOneWidget); // Remplacez 'Home' par un texte réel ou un widget spécifique à HomeScreen.
  });

  testWidgets('Navigates to TasksScreen', (WidgetTester tester) async {
    // Construire l'application.
    await tester.pumpWidget(MyApp());

    // Tapez sur un bouton qui navigue vers /tasks.
    await tester.tap(find.text('Go to Tasks')); // Remplacez par le texte ou le bouton réel qui navigue vers /tasks.
    await tester.pumpAndSettle(); // Attendre que la navigation soit terminée.

    // Vérifier que l'écran des tâches est bien affiché.
    expect(find.text('Tasks'), findsOneWidget); // Remplacez par un texte ou widget spécifique à TasksScreen.
  });

  testWidgets('Navigates to CalendarScreen', (WidgetTester tester) async {
    // Construire l'application.
    await tester.pumpWidget(MyApp());

    // Tapez sur un bouton qui navigue vers /calendar.
    await tester.tap(find.text('Go to Calendar')); // Remplacez par le texte ou le bouton réel qui navigue vers /calendar.
    await tester.pumpAndSettle(); // Attendre que la navigation soit terminée.

    // Vérifier que l'écran du calendrier est bien affiché.
    expect(find.text('Calendar'), findsOneWidget); // Remplacez par un texte ou widget spécifique à CalendarScreen.
  });

  testWidgets('Navigates to ChatScreen', (WidgetTester tester) async {
    // Construire l'application.
    await tester.pumpWidget(MyApp());

    // Tapez sur un bouton qui navigue vers /chat.
    await tester.tap(find.text('Go to Chat')); // Remplacez par le texte ou le bouton réel qui navigue vers /chat.
    await tester.pumpAndSettle(); // Attendre que la navigation soit terminée.

    // Vérifier que l'écran du chat est bien affiché.
    expect(find.text('Chat'), findsOneWidget); // Remplacez par un texte ou widget spécifique à ChatScreen.
  });
}
