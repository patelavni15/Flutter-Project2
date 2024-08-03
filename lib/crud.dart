import 'package:cloud_firestore/cloud_firestore.dart';

/*create()async{
  await FirebaseFirestore.instance
      .collection('person')
      .doc('Jack')
      .set({
    'name':'Jack',
    'age':21,
    'city':'Delhi',
    'gender':'Male'});
  print('Data is added');

}*/
create(String collName, docName, name, int age, city, gender)async{
  await FirebaseFirestore.instance
      .collection(collName)
      .doc(docName)
      .set({
    'name':name,
    'age':age,
    'city':city,
    'gender':gender});
  print('Data is added');

}
update(String collName, docName, field, var newFieldValue) async{
  await FirebaseFirestore.instance
      .collection(collName)
      .doc(docName)
      .update({field: newFieldValue});
  print('Data is updated');
}

delete(String collName, docName)async{
  await FirebaseFirestore.instance
      .collection(collName)
      .doc(docName)
      .delete();
  print("data is deleted");
}



