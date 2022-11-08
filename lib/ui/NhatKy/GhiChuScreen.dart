import 'package:flutter/material.dart';
import 'package:myshop/ui/NhatKy/GhiChuControler.dart';
import 'package:myshop/ui/screens.dart';
import 'package:provider/provider.dart';

import '../shared/app_drawer.dart';
import 'GhiChuDetailsScreen.dart';

class GhiChuScreen extends StatefulWidget {
  const GhiChuScreen({Key? key}) : super(key: key);

  @override
  State<GhiChuScreen> createState() => _GhiChuScreenState();
}

class _GhiChuScreenState extends State<GhiChuScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GhiChuControler>().fetchGhiChu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Diary'),
      ),
      drawer: const AppDrawer(),
      body: Consumer<GhiChuControler>(
        builder: (context, nhatKyControler, child) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(Icons.add),
            ),
            body: ListView.builder(
              itemCount: nhatKyControler.NhatKyCount,
              itemBuilder: (ctx, i) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: ListTile(
                            title: Text(nhatKyControler.nhatKys[i].title),
                            subtitle: Text(nhatKyControler.nhatKys[i].content),
                            onTap: () => {
                                  Navigator.of(context)
                                    ..pushNamed(GhiChuDetailsScreen.routeName,
                                        arguments: nhatKyControler.nhatKys[i]),
                                }),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
