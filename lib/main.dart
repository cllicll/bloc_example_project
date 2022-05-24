import 'package:bloc_example_project/SayacCubit.dart';
import 'package:bloc_example_project/ikinci_sayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // Bloc sinif modeli tanimlama myapp altinda yapmamizin nedeni tum uygulamayi kapsadigi icin
      providers: [
        BlocProvider(create: (context) => SayacCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Babasayfa(),
      ),
    );
  }
}

class Babasayfa extends StatelessWidget {
  const Babasayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Babasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<SayacCubit, int>(
              builder: (context, sayacDegeri) {
                return Text("$sayacDegeri", style: TextStyle(fontSize: 36));
              },
            ),
            ElevatedButton(
                onPressed: () {
                  context.navigateToPage(IkinciSayfa());
                },
                child: Text("Gecis Yap"))
          ],
        ),
      ),
    );
  }
}
