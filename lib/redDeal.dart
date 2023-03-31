import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class redactDeadPage extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();
  TextEditingController imgController = TextEditingController();
  String? title;
  String? discription;
  String? img;
  dynamic documentFirebase;
  redactDeadPage(
    {
      Key? key,
      this.title,
      this.discription,
      this.img,
      this.documentFirebase,
    }
  ) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    titleController.text = title.toString();
    discriptionController.text = discription.toString();
    imgController.text = img.toString();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100,),
          TextField(
            decoration: InputDecoration(
              label: const Text("Заголовок"),
              labelStyle: const TextStyle(color: Colors.black),
            ),
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(
              label: const Text("Описание"),
              labelStyle: const TextStyle(color: Colors.black),
            ),
            controller: discriptionController,
          ),
          TextField(
            decoration: InputDecoration(
              label: const Text("ссылка на картинку"),
              labelStyle: const TextStyle(color: Colors.black),
            ),
            controller: imgController,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            label: "delete",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.border_color,
              color: Colors.yellow,
            ),
            label: "redaction",
          ),
        ],
        onTap: (value){
          CollectionReference deal = FirebaseFirestore.instance.collection('deal');
          if (value == 0){
             deal.doc(documentFirebase.id).delete();
            titleController.clear();
            discriptionController.clear();
            imgController.clear();
            Navigator.pop(context);
          }
          else if (value == 1){
             deal.doc(documentFirebase.id).update(
              {
                'title': titleController.text,
                'discription': discriptionController.text,
                'img': imgController.text
              }
            );
            titleController.clear();
            discriptionController.clear();
            imgController.clear();
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}