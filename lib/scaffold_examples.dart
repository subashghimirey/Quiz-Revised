import 'package:flutter/material.dart';

class ScaffoldExamples extends StatefulWidget {
  const ScaffoldExamples({super.key});

  @override
  State<ScaffoldExamples> createState() => _ScaffoldExamplesState();
}

class _ScaffoldExamplesState extends State<ScaffoldExamples> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scaffold Learning with Examples"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Center(
        child: Text("You have pressed the button $count times"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: const Color.fromARGB(255, 89, 86, 86),
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        
        tooltip: 'incrementCounter',
        onPressed: () {
        setState(() {
          count++;
        });
      }, 
      backgroundColor: Colors.blue,
      child: const Icon(Icons.add),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,


      drawer: Drawer(
        elevation: 20,
        child: ListView(children:const [
          UserAccountsDrawerHeader(accountName: Text("Subash Ghimire"), accountEmail: Text('learningflutter@gmail.com'), currentAccountPicture: CircleAvatar( backgroundColor: Colors.blueGrey, child: Icon(Icons.person, size: 50,),
              ),),

              ListTile(title: Text("Inbox"), leading: Icon(Icons.inbox),),
            ListTile(
              title: Text("Primary"),
              leading: Icon(Icons.inbox),
            ),

            Divider(height: 1,),

              ListTile(
              title: Text("Social"),
              leading: Icon(Icons.people),
            ),


              ListTile(
              title: Text("Promotions"),
              leading: Icon(Icons.local_offer_outlined),
            ),

              ListTile(
              title: Text("Spam"),
              leading: Icon(Icons.error),
            ),




        ],),
      ),
    );
  }
}
