import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class CustomerList extends StatefulWidget {
  const CustomerList({super.key});

  @override
  State<CustomerList> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Customers'),
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('persons').snapshots(),
          builder:(context,customerSnapshot){
          if(customerSnapshot.connectionState==ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          else{
            final custDocs = customerSnapshot.data!.docs;
            return ListView.builder(itemCount: custDocs.length,
                itemBuilder: (context,index){
              return ListTile(
                title: Text(custDocs[index]['name']),
                subtitle: Text(custDocs[index]['age']),
              );
            });

          }

          },
      ),
      ),
    );
  }
}
