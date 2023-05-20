import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import 'get_user_data.dart';

class TestFire extends StatefulWidget {
  const TestFire({Key? key}) : super(key: key);

  @override
  State<TestFire> createState() => _TestFireState();
}

class _TestFireState extends State<TestFire> {

  List<String> docIDs = [];

  Future getDOCId() async{
    await FirebaseFirestore.instance.collection('Pavlodar').get().then(
          (snapshot) => snapshot.docs.forEach((element) {

        print(element.reference.id  );
        docIDs.add(element.reference.id);
      }),);
  }

  @override
  // void initState(){
  //   getDOCId();
  //   super.initState();
  // }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children:[ Expanded(
            child: FutureBuilder(
              future: getDOCId(),
              builder: (context, snapshot){
                print(this.docIDs.length);
                return ListView.builder(
                    itemCount: this.docIDs.length,

                    itemBuilder: (context, index){
                      return ListTile(
                        title: GetUserData(documentId: docIDs[index],),
                      );
                    }
                );
              },
            ),
          ),],
        ),
      ),
    );
  }
}
