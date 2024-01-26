import 'package:test_aja/arguments/berita_arguments.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/car_provider.dart';

class DetailBeritaUI extends StatelessWidget {
  static const routeName = '/detail-berita';
  const DetailBeritaUI({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as BeritaArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Consumer<CarProvider>(
          builder: (_, cp, __) {
            return Column(
              children: [
                Text(
                  cp.selectedCar?.id ?? '-',
                  style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cp.selectedCar?.brand ?? '-',
                  style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cp.selectedCar!.price.toString(),
                  style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
