import 'package:flutter/material.dart';
import 'package:tybatest/assets/tyba_colors.dart';

class HistoryPage extends StatelessWidget {
  List<String>? history;
  HistoryPage({Key? key, this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TybaColors.MAIN_GREEN,
        title: Text('Historial'),
      ),
      body: ((history ?? []).isEmpty)
          ? Center(
              child: Text('No tienes busquedas recientes'),
            )
          : ListView(
              children: history!
                  .map((e) => ListTile(
                        title: Text(e),
                      ))
                  .toList(),
            ),
    );
  }
}
