import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  bool oTurn = true;
  int oScore = 0;
  int xScore = 0;
  String winnerMessage = '';
  int filledBox = 0;
  bool freezeChecker = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(height: 180),
                const SizedBox(width: 70),
                Column(
                  children: [
                    const Text('Player O',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    Text(oScore.toString(),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ],
                ),
                const SizedBox(width: 50),
                Column(
                  children: [
                    const Text('Player X',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    Text(xScore.toString(),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ],
                ),
              ],
            ),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemCount: 9,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (freezeChecker == false) {
                                _tapped(index);
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  border: Border.all(color: Colors.redAccent),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                  child: Text(displayXO[index],
                                      style: const TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.w900))),
                            ),
                          ),
                        );
                      }),
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: Column(
                children: [
                  Text(winnerMessage,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: () {
                        _clearBoard();
                      },
                      child: const Text(
                        'Play Again',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _tapped(int index) {
    setState(() {
      if (oTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
      } else if (!oTurn && displayXO[index] == '') {
        displayXO[index] = 'X';
      }
      oTurn = !oTurn;
      filledBox++;
      freezeChecker = _checkWinner();
    });
  }

  bool _checkWinner() {
    if (displayXO[0] == displayXO[1] &&
        displayXO[2] == displayXO[0] &&
        displayXO[0] != '') {
      setState(() {
        winnerMessage = 'Player ${displayXO[0]} wins!';
        if (displayXO[0] == 'X') {
          xScore++;
        } else if (displayXO[0] == 'O') {
          oScore++;
        }
      });
      return true;
    }
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        winnerMessage = 'Player ${displayXO[3]} wins!';
        if (displayXO[3] == 'X') {
          xScore++;
        } else if (displayXO[3] == 'O') {
          oScore++;
        }
      });
      return true;
    }
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        winnerMessage = 'Player ${displayXO[6]} wins!';
        if (displayXO[6] == 'X') {
          xScore++;
        } else if (displayXO[6] == 'O') {
          oScore++;
        }
      });
      return true;
    }
    if (displayXO[0] == displayXO[3] &&
        displayXO[3] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        winnerMessage = 'Player ${displayXO[0]} wins!';
        if (displayXO[0] == 'X') {
          xScore++;
        } else if (displayXO[0] == 'O') {
          oScore++;
        }
      });
      return true;
    }
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        winnerMessage = 'Player ${displayXO[1]} wins!';
        if (displayXO[1] == 'X') {
          xScore++;
        } else if (displayXO[1] == 'O') {
          oScore++;
        }
      });
      return true;
    }
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        winnerMessage = 'Player ${displayXO[2]} wins!';
        if (displayXO[2] == 'X') {
          xScore++;
        } else if (displayXO[2] == 'O') {
          oScore++;
        }
      });
      return true;
    }
    if (displayXO[0] == displayXO[4] &&
        displayXO[8] == displayXO[0] &&
        displayXO[0] != '') {
      setState(() {
        winnerMessage = 'Player ${displayXO[0]} wins!';
        if (displayXO[0] == 'X') {
          xScore++;
        } else if (displayXO[0] == 'O') {
          oScore++;
        }
      });
      return true;
    }
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      setState(() {
        winnerMessage = 'Player ${displayXO[2]} wins!';
        if (displayXO[2] == 'X') {
          xScore++;
        } else if (displayXO[2] == 'O') {
          oScore++;
        }
      });
      return true;
    } else if (filledBox == 9) {
      winnerMessage = 'Tie!';
      return true;
    }
    return false;
  }

  _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
        winnerMessage = '';
      }
    });
    filledBox = 0;
    freezeChecker = false;
  }
}
