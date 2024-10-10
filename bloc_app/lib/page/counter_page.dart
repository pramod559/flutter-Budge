import 'package:bloc_app/bloc/counterBloc.dart';
import 'package:bloc_app/bloc/counterEvent.dart';
import 'package:bloc_app/cubit/themeCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc Counter'),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, int>(builder: (context, count) {
          return Text('$count',
              style: Theme.of(context).textTheme.displayLarge);
        }),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(CounterIncrementPressed());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(CounterDerementPressed());
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              context.read<Themecubit>().toggleTheme();
            },
            child: const Icon(Icons.brightness_1),
          )
        ],
      ),
    );
  }
}
