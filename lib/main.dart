import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_app/pages/Category.dart';
import 'package:my_app/pages/widgets/Arguments.dart';
import 'package:my_app/pages/ChallengeMode.dart';
import 'package:my_app/pages/QuizoftheDay.dart';
import './pages/HomePage.dart';
import './pages/Categories.dart';
import './pages/QuizoftheDayCompleted.dart';
import './pages/ChallengeCompleted.dart';
import './pages/QuizCompleted.dart';
import './pages/QuizPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const HomePage(title: 'Flutter Demo'),
        '/Categories': (context) => const Categories(title: 'Flutter Demo'),
        '/QOTD': (context) => const QuizoftheDay(title: 'Flutter Demo'),
        //'/Category': (context) =>
        //   Category(title: 'Flutter Demo', category: 'History'),
        '/QOTDCompleted': (context) =>
            QuizoftheDayCompleted(title: 'Flutter Demo', score: 90),
      },
      onGenerateRoute: (settings) {
        if (settings.name == Challenge.routeName) {
          // Cast the arguments to the correct
          // type: ScreenArguments.
          final args = settings.arguments as RankArguments;

          // Then, extract the required data from
          // the arguments and pass the data to the
          // correct screen.
          return MaterialPageRoute(
            builder: (context) {
              return Challenge(
                name: args.name,
                curscore: args.curscore,
                title: 'Flutter Demo',
              );
            },
          );
        }
        if (settings.name == Category.routeName) {
          final args = settings.arguments as CategoryArg;
          return MaterialPageRoute(
            builder: (context) {
              return Category(
                title: 'Flutter Demo',
                category: args.category,
              );
            },
          );
        }
        if (settings.name == ChallengeCompleted.routeName) {
          final args = settings.arguments as QuizScore;
          return MaterialPageRoute(
            builder: (context) {
              return ChallengeCompleted(
                score: args.score,
                title: 'Flutter Demo',
              );
            },
          );
        }
        if (settings.name == QuizCompleted.routeName) {
          final args = settings.arguments as QuizScore;
          return MaterialPageRoute(
            builder: (context) {
              return QuizCompleted(
                score: args.score,
                title: 'Flutter Demo',
              );
            },
          );
        }
        if (settings.name == QuizPage.routeName) {
          final args = settings.arguments as QuizArguments;
          return MaterialPageRoute(
            builder: (context) {
              return QuizPage(
                type: args.type,
                score: args.score,
                quiztitle: args.quiztitle,
                title: 'Flutter Demo',
              );
            },
          );
        }
        // The code only supports
        // PassArgumentsScreen.routeName right now.
        // Other values need to be implemented if we
        // add them. The assertion here will help remind
        // us of that higher up in the call stack, since
        // this assertion would otherwise fire somewhere
        // in the framework.
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
