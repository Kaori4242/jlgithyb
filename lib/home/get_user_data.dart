import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserData extends StatelessWidget {
  final String documentId;
  const GetUserData({Key? key , required this.documentId}) : super(key: key);

  @override
  Widget build( BuildContext context) {
    CollectionReference kazakhstan = FirebaseFirestore.instance.collection("Pavlodar");

    return FutureBuilder<DocumentSnapshot>(future: kazakhstan.doc(documentId).get(), builder: ((context, snapshot){

      if(snapshot.connectionState == ConnectionState.done){
        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
        return Text("First Name: ${data['name']}");
      }
      return Text("loading...");
    }),);


  }
}
