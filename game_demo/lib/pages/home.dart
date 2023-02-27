import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> displayExOn = List<String>.generate(9, (index) => '');
  String chessman = 'O';
  int playerO = 0;
  int playerX = 0;
  bool openAi = false;

  static var myNewFont = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.black, letterSpacing: 3),
  );
  static var myNewFontWite = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(flex: 1, child: buildHeader()),
          Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: displayExOn.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          playChess(index);
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              displayExOn.elementAt(index),
                              // index.toString(),
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade700)),
                        ),
                      )))
        ],
      ),
    );
  }

  Widget buildHeader() => SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Player O",
                      style: myNewFontWite,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      playerO.toString(),
                      style: myNewFontWite,
                    ),
                  ],
                ),
                SizedBox(
                  width: 25,
                ),
                Column(
                  children: [
                    Text(
                      "Player X",
                      style: myNewFontWite,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      playerX.toString(),
                      style: myNewFontWite,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      reset();
                    },
                    child: Text("reset")),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        openAi = !openAi;
                      });
                    },
                    child: openAi
                        ? Text(
                            "Close Ai",
                            style: TextStyle(color: Colors.red),
                          )
                        : Text("Open Ai"))
              ],
            ),
          ],
        ),
      );

  playChess(int index) {
    setState(() {
      displayExOn[index] = chessman;
    });

    if (chessman == 'O') {
      chessman = 'X';
    } else {
      chessman = 'O';
    }

    checkWin();
    if (openAi) {
      ai();
    }
  }

  checkWin() {
    var hv = 0;
    var vv = 0;
    for (int i = 0; i < 3; i++) {
      if (displayExOn[hv] == displayExOn[hv + 1] &&
          displayExOn[hv + 1] == displayExOn[hv + 2] &&
          displayExOn[hv + 2] != '') {
        showWin(displayExOn[hv]);
      }

      if (displayExOn[vv] == displayExOn[vv + 3] &&
          displayExOn[vv + 3] == displayExOn[vv + 6] &&
          displayExOn[vv + 6] != '') {
        showWin(displayExOn[vv]);
      }
      hv += 3;
      vv += 1;
    }

    if (displayExOn[0] == displayExOn[4] &&
            displayExOn[4] == displayExOn[8] &&
            displayExOn[4] != '' ||
        displayExOn[6] == displayExOn[4] &&
            displayExOn[4] == displayExOn[2] &&
            displayExOn[4] != '') {
      showWin(displayExOn[0]);
    }
  }

  showWin(String win) {
    setState(() {
      if (win == "O") {
        playerO += 1;
      } else {
        playerX += 1;
      }
    });

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Win : $win'),
          );
        });
  }

  reset() {
    setState(() {
      displayExOn = List<String>.generate(9, (index) => '');
    });
  }

  ai() {}
}
