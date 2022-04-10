import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/provid_fun/provider_function.dart';
import 'package:state_provider/shefu.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  TextEditingController _titlecontroller = TextEditingController();
  TextEditingController _discriptioncontroller = TextEditingController();


  bool titleempity = false;


  @override
  Widget build(BuildContext context) {
    final tools = Provider.of<Provid>(context);
    return Scaffold(
      appBar: AppBar(title: Text(""),
        automaticallyImplyLeading: false,
        centerTitle: true,),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(context: context, builder: (context) =>
            Padding(
              padding: const EdgeInsets.only(bottom: 140),
              child: AlertDialog(
                title: Text("Add Items"),
                content: Column(
                  children: [
                    TextFormField(
                      controller: _titlecontroller,
                      decoration: InputDecoration(
                        hintText: "Title",
                        labelText: "Title",
                      ),
                    ),
                    TextFormField(
                      controller: _discriptioncontroller,
                      decoration: InputDecoration(
                        hintText: "Discription",
                        labelText: "Discription",
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(onPressed: () {
                      final title = _titlecontroller.text;
                      final description = _discriptioncontroller.text;
                      tools.addNewItem(title, description);

                      Navigator.pop(context);

                      _titlecontroller.clear();
                      _discriptioncontroller.clear();



                    },
                        child: Text("ADD")),

                  ],
                ),
              ),
            ));
      },
        child: Icon(Icons.add),

      ),
      body: ListView.builder(
          itemCount: tools.tools.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              background: Container(
                color: Colors.red,
                child: Icon(Icons.delete),
              ),
              key: ValueKey('abc'),
              
              child: ListTile(
                title: Text(tools.tools[index].title,),
                subtitle: Text(tools.tools[index].description),
              ),
            );
          }),
    );
  }

}