import 'package:bloc_app/cubit/themeCubit.dart';
import 'package:bloc_app/page/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = AppBlocOberver();
  runApp(const App());
}

class AppBlocOberver extends BlocObserver {
  AppBlocOberver();

  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    super.onChange(bloc, change);
    if (bloc is Cubit) {
      print(change);
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    super.onTransition(bloc, transition);
    print(transition);
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Themecubit(),
      child: AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Themecubit, ThemeData>(builder: (_, theme) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: CounterPage(),
      );
    });
  }
}
