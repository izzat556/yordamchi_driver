import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  String? message;
  ProgressDialog({this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      //baclgroundColor: Colors.black54,
   //   backgroundColor:  Color.fromARGB(255, 121, 30, 138),
      child: Container(
        padding: const EdgeInsets.all(10),
        //margin: const  EdgeInsets.all(16),
        decoration: BoxDecoration(
          //  color:  Colors.black54,
          color: Colors.black12,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
          SizedBox(
                width: 6.0,
              ),
             CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              SizedBox(
                width: 26.0,
              ),
              Text(
                'Please Wait',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
