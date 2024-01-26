import 'package:test_aja/controller/car_provider.dart';
import 'package:test_aja/pages/detail_pages.dart';
import 'package:test_aja/pages/list_berita_pages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'api/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CarProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          primaryColor: Colors.pink,
          appBarTheme: const AppBarTheme(
            color: Colors.blue,
            titleTextStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          cardColor: Colors.lightBlue,
          textTheme: GoogleFonts.k2dTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          DetailBeritaUI.routeName: (context) =>
              const DetailBeritaUI(), // '/detail-berita'
        },
        home: const ListBeritaUI(),
      ),
    );
  }
}

class ListViewUI extends StatelessWidget {
  ListViewUI({Key? key}) : super(key: key);

  final List<String> newsTitles = [
    'Grachia',
    'Salsabila',
    'Yulian',
    'CACA',
    'CAWAN',
  ];

  final List<String> newsImages = [
    'https://img.freepik.com/free-photo/park-with-trees_1417-1645.jpg?w=900&t=st=1706206072~exp=1706206672~hmac=79fa999337a4b0d5764d6bb86d9efe5e94571410dbcfb1a393b6d67b5e649208',
    'https://img.freepik.com/free-photo/vacation-wonder-fresh-trees-waterfall-outdoor_1417-1104.jpg?w=900&t=st=1706206084~exp=1706206684~hmac=167bb55c9c33e21167ba80d1607c1d730d7a21dab99776d53b145a0c3b61a2ad',
    'https://example.com/image3.jpg',
    'https://example.com/image4.jpg',
    'https://example.com/image5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 12,
          );
        },
        itemCount: newsTitles.length,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.amber,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  newsImages[index],
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8),
                Text(
                  newsTitles[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ListTileUI extends StatelessWidget {
  const ListTileUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.amber,
            child: ListTile(
              title: Text('$index'),
              subtitle: Text('subtitle $index'),
              leading: const FlutterLogo(),
              trailing: const Icon(Icons.menu),
            ),
          );
        },
      ),
    );
  }
}

class StackUI extends StatelessWidget {
  const StackUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.topRight,
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
          ),
          Container(
            width: 35,
            height: 35,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GridUI extends StatelessWidget {
  const GridUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          debugPrint(orientation.name);

          debugPrint(orientation.index.toString());
          return GridView.builder(
            // crossAxisCount: 2,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            ),
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return const StackUI();
            },
          );
        },
      ),
    );
  }
}

class ThemeExample extends StatelessWidget {
  const ThemeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Theme',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Card(
        color: Theme.of(context).cardColor,
        child: const Text(
          'ini contoh penggunaan Theme',
        ),
      ),
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('ini title dialog'),
                  content: const Text('Ini Body Dialog'),
                  actions: [
                    ElevatedButton(
                      onPressed: () => print('Yes'),
                      child: const Text('YES'),
                    ),
                    ElevatedButton(
                      onPressed: () => print('No'),
                      child: const Text('NO'),
                    )
                  ],
                );
              },
            );
          },
          child: const Text('Show Dialog'),
        ),
      ),
    );
  }
}

class SnackbarExample extends StatelessWidget {
  const SnackbarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height - 50),
                duration: const Duration(seconds: 3),
                content: const Text('Congratulations'),
              ),
            );
          },
          child: const Text('Show Snackbar'),
        ),
      ),
    );
  }
}

class JsonExample extends StatefulWidget {
  const JsonExample({super.key});

  @override
  State<JsonExample> createState() => _JsonExampleState();
}

class _JsonExampleState extends State<JsonExample> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: Api().readCars(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Text(
                    snapshot.data?[index].name ?? '-',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
