import 'package:flutter/material.dart';
import 'package:quizapp/screens/qns.dart';
import 'package:quizapp/utils/mycolors.dart';

class Quizpage extends StatefulWidget {
  const Quizpage({Key? key}) : super(key: key);

  @override
  State<Quizpage> createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  PageController pcontroller = PageController();

  late List<String?> userAnswer;
  int? tappedIndex;
  int? correctIndex;
  late List<List<Color>> tileColorsList; // List to store tile colors for each question

  @override
  void initState() {
    userAnswer = List.filled(queAns.length, null);
    tappedIndex = null;
    // Initialize tileColorsList with default colors for each question
    tileColorsList = List.generate(
      queAns.length,
          (index) => List.filled(4, MyColors.bgcolor),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgcolor,
      body: PageView.builder(
        itemCount: queAns.length,
        controller: pcontroller,
        itemBuilder: (context, index) {
          return buildQuizPage(index);
        },
      ),
    );
  }

  Widget buildQuizPage(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            queAns[index]['question'],
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Column(
            children: List.generate(
              queAns[index]['options'].length,
                  (optionindex) {
                String option = queAns[index]['options'][optionindex];
                return InkWell(
                  onTap: () {
                    setState(() {
                      // Reset colors for current question
                      tileColorsList[index] =
                          List.filled(4, MyColors.bgcolor);

                      if (option == queAns[index]['correctAnswer']) {
                        // If the selected option is correct
                        tileColorsList[index][optionindex] = Colors.green;
                      } else {
                        // If the selected option is wrong
                        tileColorsList[index][optionindex] = Colors.red;
                        correctIndex = queAns[index]['options']
                            .indexOf(queAns[index]['correctAnswer']);
                        tileColorsList[index][correctIndex!] = Colors.green;
                      }

                      userAnswer[index] = option;
                      tappedIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      tileColor: tileColorsList[index][optionindex],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.white),
                      ),
                      title: Text(
                        "${optionindex + 1}.  $option",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () {
              if (index < queAns.length - 1) {
                pcontroller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              } else {
                showResult();
              }
            },
            child: Text(
              "Next",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  void showResult() {
    int correctAns = 0;
    for (int i = 0; i < queAns.length; i++) {
      if (userAnswer[i] == queAns[i]['correctAnswer']) {
        correctAns++;
      }
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
         // title: Text("Quiz Result"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Congrats!",
              style: TextStyle(fontSize: 30,color: Colors.green,fontWeight: FontWeight.bold),),
             Text("You have completed Quiz Successfully",
             style: TextStyle(fontWeight: FontWeight.bold),),
              Text(
                  " $correctAns out of ${queAns.length} questions correct",
              style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Ok"),
            ),
          ],
        );
      },
    );
  }
}
