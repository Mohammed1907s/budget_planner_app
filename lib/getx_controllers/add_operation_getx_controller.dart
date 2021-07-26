
import 'package:budget_planner_app/database/controllers/actions_db_controller.dart';
import 'package:budget_planner_app/models/actions.dart';
import 'package:get/get.dart';

class ActionsGetxController extends GetxController {
  List<Operation> operations = <Operation>[];
  ActionDbController dbController = ActionDbController();

  static ActionsGetxController get to => Get.find();

  @override
  void onInit() {
    readOperation();
    super.onInit();
  }

  @override
  void onClose() {
    operations.clear();
    super.onClose();
  }

  Future<void> readOperation() async {
    operations = await dbController.read();
    update();
  }

  Future<bool> createOperation(Operation newOperation) async {
    int id = await dbController.create(newOperation);
    if (id != 0) {
      newOperation.id = id;
      operations.insert(0,newOperation);
      update();
      return true;
    }
    return false;
  }

  Future<void> deleteAllRows() async {
    await dbController.deleteAllRows();
    operations.clear();
  }

  List<Operation> getTheLastActions() {
    List<Operation> lastOperations = [];
    for (int i = 0; i < operations.length; i++) {
      if (i == 4)
        break;
      else
        lastOperations.add(operations.elementAt(i));
    }
    return lastOperations;
  }


  List<Operation> get todayOperations {
    List<Operation> operation = [];
    operations.forEach((element) {
      if (element.date.year == DateTime.now().year &&
          element.date.month == DateTime.now().month &&
          element.date.day == DateTime.now().day) {
        operation.add(element);
      }
    });
    return operation;
  }

  double get totalExpenses {
    double _totalExpenses = 0.0;
    todayOperations.forEach((element) {
      if(element.expense){
        _totalExpenses += element.amount;
      }
    }) ;
    return _totalExpenses;
  }

  double get totalIncome {
    double _totalIncome = 0.0;
    todayOperations.forEach((element) {
      if(!element.expense){
        _totalIncome += element.amount;
      }
    }) ;
    return _totalIncome;
  }


}
