import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/Custom_Buttons/rounded_button.dart';
import 'package:musicplayer/Widgets/CustomDivider.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class FavouritePage extends StatefulWidget {
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: _buildCard(
          context: context,
          config: CustomConfig(
            colors: [
              Colors.grey[700],
              Colors.grey[600],
              Colors.grey[600],
              Colors.grey[700],
            ],
            durations: [32000, 21000, 18000, 5000],
            heightPercentages: [0.80, 0.70, 0.60, 0.90],
            blur: MaskFilter.blur(BlurStyle.outer, 5.0),
          ),
          backgroundColor: Colors.grey[850]),
    ));
  }
}

_buildCard(
    {Config config,
    Color backgroundColor = Colors.transparent,
    BuildContext context}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Flexible(
        flex: 1,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.07,
          child: WaveWidget(
            config: config,
            backgroundColor: backgroundColor,
            size: Size(double.infinity, double.infinity),
            waveAmplitude: 0,
          ),
        ),
      ),
      Flexible(
        flex: 20,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Favorites",
                    style: GoogleFonts.ubuntu(
                        fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  RoundedButton(
                    icon: Icons.favorite,
                    color: Colors.redAccent,
                    height: 40,
                    width: 40,
                    size: 15,
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Text("Filip Legierski"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              CustomDivider(),
              Expanded(
                child: ListView.builder(
                  itemExtent: 70,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: favouriteList.length,
                  itemBuilder: (context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, top: 25.0, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                favouriteList[index],
                                style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white70),
                              ),
                              Text(
                                artistNames[index],
                                style: GoogleFonts.ubuntu(
                                    fontSize: 16, color: Colors.white70),
                              )
                            ],
                          ),
                          RoundedButton(
                            icon: Icons.play_arrow,
                            height: 40,
                            width: 40,
                            size: 20,
                            color: Colors.white70,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

List favouriteList = [
  'Beautiful People',
  'Dance Monkey',
  'The Box',
  'Yummy',
  'Life is Good',
  'Memories',
  'Don\'t Start Now',
  'Love Yourself'
];

List artistNames = [
  'Ed Sheeran',
  'Tones and I',
  'Roddy Rich',
  'Justin Beiber',
  'Future Drake',
  'Maroon 5',
  'Dua Lipa',
  'Justin Bieber'
];
