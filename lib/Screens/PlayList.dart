import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/Widgets/CustomDivider.dart';
import 'package:musicplayer/Widgets/FavouritesCard.dart';
import 'package:musicplayer/Widgets/PlayListHeader.dart';
import 'package:musicplayer/Widgets/RecommendedCard.dart';
import 'package:musicplayer/Widgets/ShortPlay.dart';

class PlayList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            PlayListHeader(),
            CustomDivider(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            FavouriteCard(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            CustomDivider(),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recommended",
                  style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white70),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Flexible(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: MediaQuery.of(context).size.width * 0.20,
                  ),
                  RecommendedCard(
                    icon: FontAwesomeIcons.solidStar,
                    categoryName: "Top 50",
                    name: "Ariel Two",
                  ),
                  RecommendedCard(
                    icon: FontAwesomeIcons.guitar,
                    categoryName: "Unplugged",
                    name: "Dawo Zjb",
                  ),
                  RecommendedCard(
                    icon: FontAwesomeIcons.solidStar,
                    categoryName: "Top 50",
                    name: "Ariel Two",
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            CustomDivider(),
            ShortPlay()
          ],
        ),
      ),
    );
  }
}
