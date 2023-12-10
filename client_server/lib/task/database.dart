import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod{
  Future addTodayTask(Map<String, dynamic> userTodayMap, String id) async{
    return await FirebaseFirestore.instance.collection("Today").doc(id).set(userTodayMap);
  }

  Future addTommorowTask(Map<String, dynamic> userTodayMap, String id) async{
    return await FirebaseFirestore.instance.collection("Tommorow").doc(id).set(userTodayMap);
  }

  Future addWeekendTask(Map<String, dynamic> userTodayMap, String id) async{
    return await FirebaseFirestore.instance.collection("This Weekend").doc(id).set(userTodayMap);
  }

  Future<Stream<QuerySnapshot>> getalltheWork(String day) async{
    return FirebaseFirestore.instance.collection(day).snapshots();
  }
  updateifTicked(String id, String day)async{
    return await FirebaseFirestore.instance.collection(day).doc(id).update({"Yes":true});
  }
}