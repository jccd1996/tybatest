import 'package:flutter/material.dart';
import 'package:tybatest/assets/tyba_colors.dart';
import 'package:tybatest/assets/tyba_images.dart';
import 'package:tybatest/blocs/home_bloc.dart';
import 'package:tybatest/pages/base_state.dart';
import 'package:tybatest/pages/my_profile/my_profile_page.dart';
import 'package:tybatest/pages/restaurant_list/restaurant_list_page.dart';
import 'package:tybatest/widgets/tyba_outlined_button.dart';
import 'package:tybatest/widgets/tyba_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeBloc> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TybaColors.MAIN_GREEN,
        child: Icon(
          Icons.person,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (_) => MyProfilePage(),
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(TybaImages.LOGO),
            SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Busca tu restaurante más cercano:',
                style: TextStyle(color: TybaColors.MAIN_GREEN, fontSize: 25.0),
              ),
            ),
            SizedBox(height: 20),
            TybaTextField(
              controller: _searchController,
              icon: Icons.location_city,
              labelText: 'Ciudad',
              onFieldSubmitted: (text) async {
                _doSearch();
              },
            ),
            SizedBox(height: 20),
            TybaOutlinedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.search, color: TybaColors.MAIN_GREEN),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Buscar",
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
              onPressed: _doSearch,
            ),
          ],
        ),
      ),
    );
  }

  void _doSearch() async {
    var text = _searchController.text;
    if (text.isNotEmpty) {
      Navigator.pop(context);
      var result = await bloc!.doSearch(text);
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (_) => RestaurantListPage(
            title: text,
            restaurantsResponse: result,
          ),
        ),
      );
    }
  }
}
