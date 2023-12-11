import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddController {
  var transactions = FirebaseFirestore.instance.collection("transactions");
  var user = FirebaseAuth.instance.currentUser!;

  void create(String name, String date, String amount, String balance,
      String income, String expenses) async {
    // ini create
    await transactions.add({
      "uid": user.uid,
      "name": name,
      "date": date,
      "amount": amount,
      "balance": balance,
      "income": income,
      "expenses": expenses
    });
  }

  void update(String id, String name, String date, String amount,
      String balance, String income, String expenses) async {
    // ini update
    await transactions.doc(id).update({
      "uid": user.uid,
      "name": name,
      "date": date,
      "amount": amount,
      "balance": balance,
      "income": income,
      "expenses": expenses
    });
  }

  void delete(String id) async {
    // delete
    await transactions.doc(id).delete();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> read(String id) async {
    // read
    return await transactions.doc(id).get();
  }

  Future<QuerySnapshot> readAll() async {
    // read all
    return await transactions.where("uid", isEqualTo: user.uid).get();
  }

  // void read_pagination(int start, int end) {
  //   return await transactions.where("uid", isEqualTo: user.uid).limit(end - start).;
  // }
}
