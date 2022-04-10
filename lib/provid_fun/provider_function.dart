
import 'package:flutter/cupertino.dart';
import 'package:state_provider/model/model_function.dart';

class Provid extends ChangeNotifier {

  List<Funcation> tools = [];

  addNewItem(title,description){
    var NewItem = Funcation(title: title, description: description);
    tools.add(NewItem);
    notifyListeners();
  }

  deleteItem(index){
    tools.removeAt(index);
    notifyListeners();
  }

}