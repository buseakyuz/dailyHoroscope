import 'package:dailyhoroscope/product/models/horoscope_preview.dart';
import 'package:dailyhoroscope/product/services/api/horoscope_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_openmoji/flutter_openmoji.dart';

import '../../product/mocks/mock_horoscope_list.dart';
import 'detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: _gridView(),
            ),
          ],
        ),
      ),
    );
  }

  GridView _gridView() {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        crossAxisCount: 2,
      ),
      itemCount: MockHoroscopeList.allHoroscopes.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            var currentHoroscope = MockHoroscopeList.allHoroscopes[index];
            _goToDetailView(currentHoroscope);
          },
          child: horoscope_container(index),
        );
      },
    );
  }

  Container horoscope_container(int index) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.indigo.shade300,
          borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              MockHoroscopeList.allHoroscopes[index].iconData,
              size: 32.0,
            ),
          ),
          Center(
            child: Text(
              MockHoroscopeList.allHoroscopes[index].name ?? "",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            MockHoroscopeList.allHoroscopes[index].date ?? "",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: true,
      title: Text("Günlük Burç Yorumu"),
      backgroundColor: Colors.indigo,
    );
  }

  void _goToDetailView(HoroscopePreview _zodiac) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => DetailView(zodiac: _zodiac)));
  }
}
