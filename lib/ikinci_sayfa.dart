import 'package:bloc_example_project/SayacCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IkinciSayfa extends StatelessWidget {
  const IkinciSayfa({Key? key}) : super(key: key);
//sinif modeli
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ikinci Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //dinleme islemini yapiyoruz
            BlocBuilder<SayacCubit, int>(
              builder: (context, sayacDegeri) {
                return Text("$sayacDegeri", style: TextStyle(fontSize: 36));
              },
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<SayacCubit>().sayaciArttir();
                },
                child: Text("Sayac Arttir")),
            ElevatedButton(
                onPressed: () {
                  context.read<SayacCubit>().sayaciAzalt(4);
                },
                child: Text("Sayac Azalt"))
          ],
        ),
      ),
    );
  }
}
