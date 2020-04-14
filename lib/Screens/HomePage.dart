import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/Custom_Buttons/activeButton.dart';
import 'package:musicplayer/Custom_Buttons/rounded_button.dart';
import 'package:musicplayer/Custom_Buttons/rounded_image.dart';
import 'package:musicplayer/Screens/PlayList.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double val = 0.0;
  bool buttonPressed = false;

  void activeButton() {
    setState(() {
      buttonPressed = !buttonPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PlayList())),
                    child: RoundedButton(
                      height: 40,
                      width: 40,
                      icon: FontAwesomeIcons.arrowLeft,
                      color: Colors.grey[600],
                      size: 15,
                    ),
                  ),
                  Text(
                    "PLAYING NOW",
                    style: GoogleFonts.ubuntu(color: Colors.grey[600]),
                  ),
                  RoundedButton(
                    height: 40,
                    width: 40,
                    icon: Icons.menu,
                    color: Colors.grey[600],
                    size: 20,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              RoundedImage(
                height: 200,
                width: 200,
                link:
                    'https://i.pinimg.com/originals/59/9d/19/599d197ac23790d090f679659ae64b6a.jpg',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Lose It",
                    style: GoogleFonts.ubuntu(
                        fontSize: 25, color: Colors.grey[600]),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    "Flume ft. Vic Mensa",
                    style: GoogleFonts.ubuntu(
                        fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "1:23",
                    style: TextStyle(color: Colors.white70),
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Color.fromRGBO(255, 140, 0, 0.99),
                        inactiveTrackColor: Color.fromRGBO(255, 140, 0, 0.6),
                        activeTickMarkColor: Color.fromRGBO(255, 140, 0, 0.99),
                        inactiveTickMarkColor: Color.fromRGBO(255, 140, 0, 0.6),
                        overlayColor: Color.fromRGBO(255, 140, 0, 0.49),
                        thumbColor: Colors.grey[700],
                        trackHeight: 3,
                      ),
                      child: Slider(
                        value: val,
                        onChanged: (value) {
                          setState(() {
                            val = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Text(
                    "4:35",
                    style: TextStyle(color: Colors.white70),
                  )
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RoundedButton(
                    icon: Icons.fast_rewind,
                    height: 60,
                    width: 60,
                    size: 20,
                    color: Colors.grey[600],
                  ),
                  buttonPressed
                      ? GestureDetector(
                          onTap: activeButton,
                          child: ActiveButton(
                            icon: Icons.pause,
                            height: 80,
                            width: 80,
                            size: 30,
                            color: Colors.white,
                          ),
                        )
                      : GestureDetector(
                          onTap: activeButton,
                          child: RoundedButton(
                            icon: Icons.play_arrow,
                            height: 80,
                            width: 80,
                            size: 40,
                            color: Colors.grey[600],
                          ),
                        ),
                  RoundedButton(
                    icon: Icons.fast_forward,
                    height: 60,
                    width: 60,
                    size: 20,
                    color: Colors.grey[600],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
