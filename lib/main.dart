import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,

      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // generate dummy data to feed the second SliverGrid
  final List _gridItems = List.generate(10, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return CustomScrollView(
          slivers: [
            // SliverAppBar #1
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.green,
              expandedHeight: 200.0,
              elevation: 1,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.deepOrange,
                  child: const Center(
                      child: Icon(
                    Icons.favorite,
                    size: 70,
                    color: Colors.yellow,
                  )),
                ),
                title: const Text(
                  'PRATHAM PRAJAPATI',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            // SliverGrid #1
            SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1,
              children: [
                Card(
                  color: Colors.blue[200],
                  child: Container(),
                ),
                Card(
                  color: Colors.blue[400],
                  child: Container(),
                ),
                Card(
                  color: Colors.blue[600],
                  child: Container(),
                ),
                Card(
                  color: Colors.blue[100],
                  child: Container(),
                ),
              ],
            ),

            // Just add some padding
            const SliverPadding(padding: EdgeInsets.symmetric(vertical: 20)),

            SliverAppBar(
              elevation: 5,
              backgroundColor: Colors.pink,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.amber,
                  child: const Center(
                      child: Icon(
                    Icons.run_circle,
                    size: 60,
                    color: Colors.white,
                  )),
                ),
                title: const Text(
                  'Second SliverAppBar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            // Just add some padding
            const SliverPadding(padding: EdgeInsets.symmetric(vertical: 20)),

            SliverList(
                delegate: SliverChildListDelegate([
              for (var i = 1; i <= 10; i++)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: ListTile(
                      tileColor: Colors.amber,
                      leading: CircleAvatar(
                        radius: 50,
                        child: Text(
                          i.toString(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      title: Text("pratham"),
                      subtitle: Text(
                        "Scientists' research has revealed that viruses are by far the most abundant life forms on Earth. There are a million times more viruses on the planet than stars in the universe. Viruses also harbor the majority of genetic diversity on Earth. Scientists are finding evidence of viruses as a planetary force, influencing the global climate and geochemical cycles. They have also profoundly shaped the evolution of their hosts. The human genome, for example, contains 100,000 segments of virus DNA.",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.green,
                              elevation: 2,
                              backgroundColor: Colors.white),
                          onPressed: () {},
                          child: Text("SEND")),
                    ),
                  ),
                ),
            ])),

            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Card(
                    // generate ambers with random shades
                    color: Colors.amber[Random().nextInt(9) * 100],
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(_gridItems[index]),
                    ),
                  );
                },
                childCount: _gridItems.length,
              ),
            ),
          ],
        );
      }),
    );
  }
}
