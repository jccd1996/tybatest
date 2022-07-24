import 'package:flutter/material.dart';
import 'package:tybatest/assets/tyba_colors.dart';
import 'package:tybatest/models/restaurants_response.dart';

class RestaurantListPage extends StatefulWidget {
  final RestaurantsResponse? restaurantsResponse;
  final String title;
  const RestaurantListPage({
    this.restaurantsResponse,
    required this.title,
  });

  @override
  State<RestaurantListPage> createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: TybaColors.MAIN_GREEN,
      ),
      body: isDataEmpty()
          ? Center(child: Text('No se encontraron resultados'))
          : ListView(
              children: widget.restaurantsResponse!.result!
                  .map(
                    (e) => RestaurantItem(
                      restaurant: e,
                    ),
                  )
                  .toList(),
            ),
    );
  }

  bool isDataEmpty() {
    return widget.restaurantsResponse == null ||
        (widget.restaurantsResponse?.result ?? []).isEmpty;
  }
}

class RestaurantItem extends StatelessWidget {
  final Result restaurant;
  RestaurantItem({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(restaurant.name ?? 'No name'),
      subtitle:
          Text('Dirección: ${restaurant.location?.address ?? 'No registrada'}'),
    );
  }
}
