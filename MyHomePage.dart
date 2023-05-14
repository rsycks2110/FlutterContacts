import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Contact.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

@override
  void initState() {
  super.initState();

  }
  TextEditingController nameController =TextEditingController();
  TextEditingController contactController=TextEditingController();
List<Contact> contacts= List.empty(growable: true);

int   selectedIndex=-1;

@override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
        title: Text("Contact List / Create Contact")),

            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                     children: [
                    SizedBox(height :20),
                   TextField(
                     controller: nameController,
                     keyboardType: TextInputType.name,maxLength: 100,
                     decoration: InputDecoration
              (hintText:"Contact Name",border:OutlineInputBorder
              (borderRadius:BorderRadius.all(Radius.circular(10)))),

                ),
                       const  SizedBox(height: 25,),
                       TextField(
                         controller: contactController,
                         keyboardType: TextInputType.number,
                         maxLength: 12,
                         decoration: InputDecoration
                           (hintText:"Contact Number",border:OutlineInputBorder
                           (borderRadius:BorderRadius.all(Radius.circular(10)))),

                       ),
                         SizedBox(height: 24,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(onPressed: ()  {

                          String name =nameController.text.trim();
                          String contact=contactController.text.trim();
                          if(name.isNotEmpty&&contact.isNotEmpty){
                           setState(() {
                             nameController.text="  ";
                             contactController.text=" ";
                             contacts.add(Contact(name:name ,contact:contact));
                           });
                          }
                        }, child: Text("Save",style: TextStyle(fontSize: 34),)),
                        ElevatedButton(onPressed: ()  {
                          String name =nameController.text.trim();
                          String contact=contactController.text.trim();
                          setState(() {
                            nameController.text="  ";
                            contactController.text=" ";
                            contacts[selectedIndex].name=name;

                            contacts[selectedIndex].contact=contact;
                            contacts.add(Contact(name:name ,contact:contact));
                          });
    }

                        , child: Text("Update",style: TextStyle(fontSize: 34),))
                      ],
                    ),
                         SizedBox(height: 24,),
                    contacts.isEmpty ? Text("No Contact Yet Added!!",style:
                    TextStyle(fontSize: 30,fontWeight: FontWeight.w300),) :
                       Expanded(
                         child: ListView.builder(
                           itemCount: contacts.length,
                           itemBuilder:(context,index) =>getRow(index),
                         ),
                       )
                     ],
                           ),
                     ),
                     );
  }



 Widget getRow(int index) {
  return Card(
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.purple,
        child:Text(contacts[index].name[0]),

      ),
      title: Column(
        children: [
          Text(contacts[index].name),
          Text(contacts[index].contact)
        ],
      ),
      trailing: SizedBox(
        width: 70,
        child: Row(
          children:  [
            InkWell(
              onTap: (){
          nameController.text=contacts[index].name;
          contactController.text=contacts[index].contact;
          setState(() {
            selectedIndex=index;
          });
              },
                child:const Icon(Icons.edit)),
            
            InkWell(
                onTap: (){
                  setState(() {
                    contacts.removeAt(index);
                  });

                },   child:const Icon(Icons.delete))


          ],
        ),
      ),
    ),
  );
 }

}