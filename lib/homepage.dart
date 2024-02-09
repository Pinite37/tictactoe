import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ohTurn = true;

  List<String> displayExOh = ['', '', '', '', '', '', '', '', ''];

  var myTextStyle = TextStyle(color: Colors.white, fontSize: 30);

  int ohScore = 0;
  int exScore = 0;

  int filledBoxes = 0;

 

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          children: <Widget> [
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Joueur X', style: myTextStyle,),
                          Text(exScore.toString(), style: myTextStyle,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Joueur O', style: myTextStyle,),
                          Text(ohScore.toString(), style: myTextStyle,),
                        ],
                      ),
                    ),
                  ],
                ),
                
              )
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _taped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 118, 117, 117))),
                      child: Center(
                        child: Text(
                          displayExOh[index],
                          style: TextStyle(color: Colors.white, fontSize: 38),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Expanded(
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      Text('Tic Tac Toe', style: myTextStyle,),
                      SizedBox(height: 20,),
                      Text('@CreatedbyPinite37', style: myTextStyle,),
                    ]
                  )
                ),
                
              )
            ),
          ],
        ),
      ),
    );
  }

  void _taped(int index) {
    
    setState(() {
      if (ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'o';
        filledBoxes++;
      } else if (!ohTurn && displayExOh[index] == ''){
        displayExOh[index] = 'x';
        filledBoxes++;
      }

      ohTurn = !ohTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '') {
      _showWinDiaog(displayExOh[0]);
    }

    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      _showWinDiaog(displayExOh[3]);
    }

    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      _showWinDiaog(displayExOh[6]);
    }

    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      _showWinDiaog(displayExOh[0]);
    }

    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      _showWinDiaog(displayExOh[1]);
    }

    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      _showWinDiaog(displayExOh[2]);
    }

    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      _showWinDiaog(displayExOh[0]);
    }

    if (displayExOh[6] == displayExOh[4] &&
        displayExOh[6] == displayExOh[2] &&
        displayExOh[6] != '') {
      _showWinDiaog(displayExOh[6]);
    }

    else if (filledBoxes == 9) {
      _showDrawDiaog();
    }
  }

  void _showDrawDiaog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Egalite'),
            actions: <Widget>[
              TextButton(
                child: Text('Rejouer'),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                }
              )
            ]
          );
        }
    );
  }




  void _showWinDiaog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Le gagnant est le Joueur ' + winner),
            actions: <Widget>[
              TextButton(
                child: Text('Rejouer'),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                }
              )
            ]
          );
        }
    );

    if (winner == 'o') {
      ohScore++;
    } else if (winner == 'x') {
      exScore++;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayExOh[i] = '';
      }
    });

    filledBoxes = 0;
    
  }
}
