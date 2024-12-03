import 'package:flutter/material.dart';
import 'package:my_first_app/logic/state.dart';
import 'package:provider/provider.dart';

class FavoritesListPage extends StatelessWidget {
  const FavoritesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('You have ${appState.favorites.length} favorites:'),
          Expanded(
            child: ListView(
              children: [
                for (var item in appState.favorites)
                  ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text(
                      item.asCamelCase,
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
