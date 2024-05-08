import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizapp/utils/mycolors.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgcolor,
      body: Center(
        child: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(height: 280,),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Colors.purple.shade800,
                  Colors.purpleAccent
                ])
              ),
              height: 100,
              width: 200,
              //color: Colors.purple,
              child: const Text("QUIZ!",
              style: TextStyle( fontSize: 75,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              ),
            ),
            Container(
              height: 80,
              width: 150,
              color: Colors.orangeAccent,
              child: Text("TIME",
              style: TextStyle(fontSize: 60,
              fontWeight: FontWeight.bold,
                color: Colors.purple[800]
              ),),
            ),
            const SizedBox(height: 60,),
            MaterialButton(onPressed: (){},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              color: Colors.purple[800],
            minWidth: 150,
            height: 50,
            child: const Text("Start Quiz",
            style: TextStyle(color: Colors.white,fontSize: 18),),),
            const SizedBox(height: 150,),
            const Text("Powered by",style: TextStyle(color: Colors.grey),),
            const Text("www.artifitia.com",style: TextStyle(color: Colors.grey),),
          ],
        ),
      ),

    );
  }
}
