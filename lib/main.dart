import 'package:bloc_counter_cubit/cubit/counter_cubit.dart';
import 'package:bloc_counter_cubit/cubit/counter_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => CounterCubit())],
      child: MaterialApp(
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
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<CounterCubit, CounterCubitState>(
          builder: (context, s) {
            return Container(
              child: Column(
                children: [
                  (s is CounterValueUpdate)
                      ? Text(s.counter.toString(),style: TextStyle(fontSize: 33),)
                      : Text("0"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          context.read<CounterCubit>().counterIncrease();
                        },
                        child: Icon(Icons.add),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          context.read<CounterCubit>().counterDicrease();
                        },
                        child: Icon(Icons.minimize),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }
}
