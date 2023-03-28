 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/redDeal.dart';

class dbPage extends StatefulWidget {
  const dbPage({super.key});

  @override
  State<dbPage> createState() => _dbPageState();
}

class _dbPageState extends State<dbPage> {
@override
Widget build(BuildContext context){
  return Scaffold(
    body: StreamBuilder(
      stream: FirebaseFirestore.instance.collection("deal").snapshots(),
      builder: (context, AsyncSnapshot<dynamic> snapShots){
        if (!snapShots.hasData){
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        }else{
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: snapShots.data.docs.length,
            itemBuilder: (context, index) => buildList(
              context,
              snapShots.data.docs[index],
              index,
            ),
          );
        }
      },
    ),
  );
}
}

Widget buildList(context,docs,index){
      return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(
                  color: Colors.black,
                ),
              ),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                tileColor: Colors.blueGrey[100],
                leading: Text(
                  (index+1).toString()
                ),
                title: Text(docs['title']),
                subtitle: Text(docs['discription']),
                trailing: const Icon(
                  Icons.arrow_right,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(
                    builder: (context) => redactDeadPage(
                      title: docs['title'],
                      discription: docs['discription'],
                      img: docs['img'],
                      documentFirebase: docs,
                    )
                    )
                  );
                },
              ),
            );
    }

