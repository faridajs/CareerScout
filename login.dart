import 'package:flutter/material.dart';


class Login extends StatelessWidget {
 const Login({super.key});


 @override
 Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBar(),
       body: Padding(padding: EdgeInsets.all(30)),
       child: Column(
         children: [
           TextField(
               decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: 'Enter Login'), //textfield
               SizedBox(
                 height: 100,
               ), //sizedbox
               ElevatedButton(onPressed: () {}, child: Text('Login')))
         ], //column
       )); //padding //scaffold
       SizedBox(
                 height: 100,
               ), //sizedbox
               ElevatedButton(onPressed: () {}, child: Text('Password'))
 }
}
