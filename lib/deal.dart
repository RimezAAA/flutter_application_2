
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Deal{
  int? id;
  String? title;
  String? discription;
  String? img;
  dynamic firebase_id;
  Deal({this.id, this.title, this.discription, this.img, this.firebase_id});
}



// DownloadData() async{
//   var snapshot = await FirebaseFirestore.instance.collection("deal").get();
//   for (var i = 0; i < snapshot.docs.length; i++){
//     deals.add(Deal(id:deals.length+1,title:snapshot.docs[i]['title'],discription:snapshot.docs[i]['discription']));
//   }
  
// }

// List<Deal> deals = [
//   Deal(
//     id: 1,
//     title: "Дописать Flutter",
//     discription: "В четверг вечером добавить новую функцию",
//   ),
//   Deal(
//     id: 2,
//     title: "Добавить func JS",
//     discription: "Сделать уведомление о новых сообщениях",
//   ),
//   Deal(
//     id: 3,
//     title: "Почистить пк",
//     discription: "Купить сжатый воздух и почитсить пк",
//   ),
//   Deal(
//     id: 4,
//     title: "Приготовить покушать",
//     discription: "Сходить в магаз и купить всё для лазаньи",
//   )
// ];

List<Deal> deals = [];