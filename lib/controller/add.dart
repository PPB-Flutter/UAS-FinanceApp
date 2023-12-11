import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddController {
  CollectionReference<Map<String, dynamic>> get transactions {
    return FirebaseFirestore.instance.collection("transactions");
  }

  User get user {
    return FirebaseAuth.instance.currentUser!;
  }

  Future<void> addCallback(
      String type, String amount, String date, String note) async {
    var _amount = int.parse(amount);
    var _type = type == "Income" ? 1 : -1;

    var last_balance = 0;
    var last_income = 0;
    var last_expenses = 0;

    try {
      var last = await read_latest();

      last?.docs.forEach((element) {
        last_balance = element.data()["balance"] as int;
        last_income = element.data()["income"] as int;
        last_expenses = element.data()["expenses"] as int;

        print("Transaction created successfully AA ${last_balance}");
      });
    } catch (e) {
      print(e);
    }

    last_balance += _amount * _type;
    if (_type == 1)
      last_income += _amount;
    else
      last_expenses += _amount;

    print("Transaction created successfully AA");

    try {
      await create(
          type, date, _amount, last_balance, last_income, last_expenses, note);
    } catch (e) {}
    print("Transaction created successfully VBBB");
  }

  Future<void> create(String name, String date, int amount, int balance,
      int income, int expenses, String note) async {
    // ini create
    try {
      await transactions.add({
        "uid": user.uid,
        "created_at": DateTime.now().toString(),
        "name": name,
        "date": date,
        "amount": amount,
        "balance": balance,
        "income": income,
        "expenses": expenses,
        "note": note,
      });
    } catch (e) {
      print(e);
    }
    print("Transaction created successfully");
  }

  Future<void> update(String id, String name, String date, int amount,
      int balance, int income, int expenses, String note) async {
    // ini update
    try {
      await transactions.doc(id).update({
        "uid": user.uid,
        "name": name,
        "date": date,
        "amount": amount,
        "balance": balance,
        "income": income,
        "expenses": expenses,
        "note": note,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(String id) async {
    // delete
    try {
      await transactions.doc(id).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>?> read(String id) async {
    // read
    try {
      return await transactions.doc(id).get();
    } catch (e) {
      print(e);
    }

    return null;
  }

  Future<QuerySnapshot<Map<String, dynamic>>?> readAll() async {
    // read all
    try {
      return await transactions
          .where("uid", isEqualTo: user.uid)
          .orderBy("created_at", descending: true)
          .get();
    } catch (e) {
      print(e);
    }

    return null;
  }

  Future<QuerySnapshot<Map<String, dynamic>>?> read_pagination(
      DocumentSnapshot last, int limit) async {
    try {
      return await transactions
          .where("uid", isEqualTo: user.uid)
          .orderBy("created_at", descending: true)
          .startAfterDocument(last)
          .limit(limit)
          .get();
    } catch (e) {
      print(e);
    }

    return null;
  }

  Future<QuerySnapshot<Map<String, dynamic>>?> read_latest() async {
    try {
      return await transactions
          .where("uid", isEqualTo: user.uid)
          .orderBy("created_at", descending: true)
          .limit(1)
          .get();
    } catch (e) {
      print(e);
    }

    return null;
  }
}
