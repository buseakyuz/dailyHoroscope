import 'package:dailyhoroscope/product/models/horoscope.dart';
import 'package:dailyhoroscope/product/models/horoscope_preview.dart';
import 'package:dailyhoroscope/product/services/api/horoscope_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_openmoji/flutter_openmoji.dart';

class DetailView extends StatefulWidget {
  final HoroscopePreview zodiac;
  const DetailView({super.key, required this.zodiac});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  Horoscope? horoscope;
  @override
  void initState() {
    // Ekran oluşturulduktan hemen sonra içindeki methodları çalıştır.
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _fetchHoroscope();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: horoscope == null
          ? Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 32.0,
                    ),
                    horoscopeName(),
                    SizedBox(
                      height: 32.0,
                    ),
                    horoscopeItems(),
                    SizedBox(
                      height: 32.0,
                    ),
                    horoscopeMotto(),
                    SizedBox(
                      height: 32.0,
                    ),
                    dailyComment()
                  ],
                ),
              ),
            ),
    );
  }

  Column dailyComment() {
    return Column(
      children: [
        Text(
          "Günlük Yorum:",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 12.0,
        ),
        Text(
          "${horoscope?.gunlukYorum ?? ""}",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Center horoscopeMotto() {
    return Center(
      child: Text(
        "\"${horoscope?.mottosu ?? ""}\"",
        style: TextStyle(
            color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w600),
      ),
    );
  }

  Row horoscopeItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10.0,
          direction: Axis.vertical,
          children: [
            Icon(OpenmojiIcons.ringed_planet, size: 32.0),
            Text(
              "Gezegen: ${horoscope?.gezegeni ?? ""}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10.0,
          direction: Axis.vertical,
          children: [
            Icon(OpenmojiIcons.large_blue_diamond, size: 32.0),
            Text(
              "Element: ${horoscope?.elementi ?? ""}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }

  Padding horoscopeName() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8.0,
          children: [
            Icon(widget.zodiac.iconData, size: 42.0),
            Text(
              horoscope?.burc ?? "",
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text("Günlük Burç Yorumu"),
      backgroundColor: Colors.indigo,
    );
  }

  void _fetchHoroscope() async {
    // Internetten gelen datayı işle.
    var service = ApiService();
    Horoscope response = await service.fetchInfo(widget.zodiac.apiLink ?? "");
    setState(() {
      horoscope = response;
    });
  }
}
