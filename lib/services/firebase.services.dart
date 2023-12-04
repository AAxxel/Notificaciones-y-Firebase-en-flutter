import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getTarea() async {
  List task = [];
  CollectionReference collectionReferenceTask = db.collection('task');
  QuerySnapshot queryTask = await collectionReferenceTask.get();

  queryTask.docs.forEach((documento) {
    task.add(documento.data());
  });

  return task;
}

Future<void> setTarea(int id, String name, bool status) async {
  await db.collection('task').add({
    "Titulo": name,
    "ID": id,
    "Estado": status,
  });
}
