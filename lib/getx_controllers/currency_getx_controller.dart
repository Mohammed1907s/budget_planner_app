import 'package:budget_planner_app/database/controllers/currency_db_controller.dart';
import 'package:budget_planner_app/models/currency.dart';
import 'package:budget_planner_app/storge/app_pref_controller.dart';
import 'package:get/get.dart';

class CurrencyGetxController extends GetxController {

  List<Currency> currencies = [];
  CurrencyDbController dbController = CurrencyDbController();

  static CurrencyGetxController get to => Get.find();

  @override
  void onInit() {
    readCurrencies();
    super.onInit();
  }

  @override
  void onClose() {
    currencies.clear();
    super.onClose();
  }

  Future<void> readCurrencies() async {
    currencies = await dbController.read();
    update();
  }

  Future<void> deleteAllRows() async {
    await dbController.deleteAllRows();
    currencies.clear();
    update();
  }

  String getCurrencyName(int id) {
    int index = currencies.indexWhere((element) => id == element.id);
    return SharedPrefController().languageCode == 'ar'
        ? currencies[index].nameAr
        : currencies[index].nameEn;
  }

  Currency getCurrencyById(int id) {
    int index = currencies.indexWhere((element) => id == element.id);
    return currencies[index];
  }
}
/*final CurrencyDbController _dbController = CurrencyDbController();
  RxList<Currency> currencies = <Currency>[].obs;

  static CurrencyGetxController get to => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    read();
    super.onInit();
  }

  Future read() async {
    currencies.value = await _dbController.read();
  }

  Currency getCurrencyById({required int id, bool setSelected = false}){
    int index = currencies.indexWhere((element) => element.id == id);
    if(setSelected) currencies[index].checked = true;
    return currencies[index];
  }

  void changeCheckStatus(int index) {
    currencies.forEach((element) {
      element.checked = false;
      if (element.id == currencies[index].id) element.checked = true;
    });
    currencies.refresh();
  }

  Currency? getSelectedCurrency() {
    int index = currencies.indexWhere((element) => element.checked);
    if(index != -1) return currencies[index];
    return null;
  }

  void undoCheckedCurrency() {
    currencies.forEach((element) {
      element.checked = false;
    });
  }*/