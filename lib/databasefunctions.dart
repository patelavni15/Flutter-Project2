import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:userauthentication/crud.dart';
import 'package:userauthentication/pages/customers.dart';

class DatabaseOperations extends StatefulWidget {
  const DatabaseOperations({super.key});

  @override
  State<DatabaseOperations> createState() => _DatabaseOperationsState();
}

class _DatabaseOperationsState extends State<DatabaseOperations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD Operations'),
            actions: [
              IconButton(
          onPressed: () async{
            await FirebaseAuth.instance.signOut();

          },icon: Icon(Icons.logout)
      )
        ],
      ),
      body: Center(
        child: Container(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
                  create(
                    'persons', 'Customer', 'Sana', 24, 'Mumbai', 'Female'
                  );
                }, child: Text('Create')),
            ElevatedButton(onPressed: (){
              update('persons', 'Customer', 'age', 22);
            }, child: Text('Update')),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomerList()));
              },
             child: Text('Retrive')),
            ElevatedButton(onPressed: (){
              delete('persons', 'Customer');
            }, child: Text('Delete')),
          ],
            ),),
      ),
    );
  }
}
