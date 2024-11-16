import 'package:app02/Views/telainicial.dart';
import 'package:app02/controllers/visualizadas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Visualizadas()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientetion, deviceType) {
        return const MaterialApp(
          title: 'Tela do Whatsapp',
          debugShowCheckedModeBanner: false,
          home: TelaInicial(),
        );
      },
    );
  }
}
