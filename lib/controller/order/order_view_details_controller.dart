import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/constant/routes.dart';
import 'package:app01/core/functions/handlingdatacontroller.dart';
import 'package:app01/core/services/services.dart';
import 'package:app01/data/datasource/remote/order_data/order_delete_data.dart';
import 'package:app01/data/datasource/remote/order_data/order_view_detail_data.dart';
import 'package:get/get.dart';

abstract class OrderViewdetailsController extends GetxController {
  intialData();
  goToViewMain();
  goToAddOrder();
  goToEditOrder();
}

class OrderViewdetailsControllerImp extends OrderViewdetailsController {
  OrderViewDetailsData orderViewdetailsData = OrderViewDetailsData(Get.find());
  OrderDeleteData OrderDelete = OrderDeleteData(Get.find());
  bool inTrue = false;
  StatusRequest statusRequest = StatusRequest.loading;
  late StatusRequest statusRequestOnDel;

  MyServices myServices = Get.find();
  String? resID;
  List dataReservation = [];
  List dataReservation_Location = [];
  List dataReservation_Status = [];
  List dataReservation_Order_Type = [];
  List dataReservation_Production_Type = [];
  List dataReservation_Car = [];
  List dataReservation_Employee = [];
  List dataReservation_Equip = [];

  @override
  goToEditOrder() {
    Get.toNamed(AppRoute.OrderEdit, arguments: {
      "resID": resID,
    });
  }

  @override
  goToViewMain() {
    Get.offAndToNamed(AppRoute.orderviewmain);
  }

  late String OrderTitle;
  late String OrderDisc;
  late String OrderStartDateTime;
  late String OrderEndDateTime;
  late String data_Order;
  late String data_Order_ID;
  late String data_Production;
  late String data_Production_ID;
  late String AddByEmp;
  bool isLoading = true;

  @override
  getOrders() async {
    // dataReservation.clear();
    // dataReservation_Order_Type.clear();
    // dataReservation_Car.clear();
    // dataReservation_Employee.clear();
    // dataReservation_Equip.clear();
    // dataReservation_Location.clear();
    // dataReservation_Status.clear();
    // dataReservation_Production_Type.clear();
    resID = Get.arguments['resID'];
    statusRequest = StatusRequest.loading;
    var response = await orderViewdetailsData.getData(resID!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        dataReservation.addAll(response['Reservation']);
        dataReservation_Order_Type.addAll(response['Reservation_Order_Type']);
        //print("dataReservation_Order_Type:->  $dataReservation_Order_Type");
        dataReservation_Car.addAll(response['Reservation_Car']);
        dataReservation_Employee.addAll(response['Reservation_Employee']);
        dataReservation_Equip.addAll(response['Reservation_Equip']);
        print("dataReservation_Equip:->  $dataReservation_Equip");
        dataReservation_Location.addAll(response['Reservation_Location']);
        dataReservation_Status.addAll(response['Reservation_Status']);
        dataReservation_Production_Type.addAll(response['Reservation_Production_Type']);
        listToString();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToAddOrder() {
    Get.toNamed(AppRoute.orderadd);
  }

  @override
  getOrder() {
    return dataReservation_Order_Type;
  }

  @override
  intialData() {
    getOrders();
    update();
  }

  @override
  void onInit() {
    //resID = '';
    //getOrders();
    intialData();
    Future.delayed(Duration(seconds: 1), () {
      isLoading = false;
      update();
    });
    super.onInit();
  }

//listToString
  //cam
  String EqipStringCam = ''; //1
  String EqipStringLens = ''; //11
  String EqipStringGimbal = ''; //5
  String EqipStringDron = ''; //6
  String EqipStringCrain = ''; //7
  //audio
  String EqipStringMic = ''; //4
  String EqipStringAirBese = ''; //8
  String EqipStringAudioMixer = ''; //9
  //light
  String EqipStringlighting = ''; //2
  //
  String EqipStringlaptop = ''; //3
  String EqipStringAutoCues = ''; //10
  //Emp
  String EmpStringProduction = ''; //23
  String EmpStringProgram = ''; //14  21  22
  String EmpStringEng = ''; //1
  String EmpStringDirector = ''; //3  16
  String EmpStringCamera = ''; //4  5
  String EmpStringAudio = ''; //6  7
  String EmpStringLight = ''; //8  9
  String EmpStringPresentor = ''; //24
  String EmpStringReporter = ''; //15
  String EmpStringOfficeBoy = ''; //17
  String EmpStringCreative = ''; //  19
  String EmpStringCG = ''; //20
  String EmpStringDriver = ''; //13
  //Location
  String LocationString = '';
  //Transportation
  String TranspString = '';

  @override
  listToString() {
    dataReservation_Equip.forEach((element) {
      element['Equipment_Category_ID'] == '1'
          ? EqipStringCam += ', ' + element['Equipment_Name'].toString()
          : EqipStringCam += '';
    });
    dataReservation_Equip.forEach((element) {
      element['Equipment_Category_ID'] == '11'
          ? EqipStringLens += ', ' + element['Equipment_Name'].toString()
          : EqipStringLens += '';
    });
    dataReservation_Equip.forEach((element) {
      element['Equipment_Category_ID'] == '5'
          ? EqipStringGimbal += ', ' + element['Equipment_Name'].toString()
          : EqipStringGimbal += '';
    });
    dataReservation_Equip.forEach((element) {
      element['Equipment_Category_ID'] == '6'
          ? EqipStringDron += ', ' + element['Equipment_Name'].toString()
          : EqipStringDron += '';
    });
    dataReservation_Equip.forEach((element) {
      element['Equipment_Category_ID'] == '7'
          ? EqipStringCrain += ', ' + element['Equipment_Name'].toString()
          : EqipStringCrain += '';
    });
    dataReservation_Equip.forEach((element) {
      element['Equipment_Category_ID'] == '4'
          ? EqipStringMic += ', ' + element['Equipment_Name'].toString()
          : EqipStringMic += '';
    });
    dataReservation_Equip.forEach((element) {
      element['Equipment_Category_ID'] == '8'
          ? EqipStringAirBese += ', ' + element['Equipment_Name'].toString()
          : EqipStringAirBese += '';
    });
    dataReservation_Equip.forEach((element) {
      element['Equipment_Category_ID'] == '9'
          ? EqipStringAudioMixer += ', ' + element['Equipment_Name'].toString()
          : EqipStringAudioMixer += '';
    });
    dataReservation_Equip.forEach((element) {
      element['Equipment_Category_ID'] == '2'
          ? EqipStringlighting += ', ' + element['Equipment_Name'].toString()
          : EqipStringlighting += '';
    });
    dataReservation_Equip.forEach((element) {
      element['Equipment_Category_ID'] == '3'
          ? EqipStringlaptop += ', ' + element['Equipment_Name'].toString()
          : EqipStringlaptop += '';
    });
    dataReservation_Equip.forEach((element) {
      element['Equipment_Category_ID'] == '10'
          ? EqipStringAutoCues += ', ' + element['Equipment_Name'].toString()
          : EqipStringAutoCues += '';
    });
    dataReservation_Equip.forEach((element) {
      element['Equipment_Category_ID'] == '10'
          ? EqipStringAutoCues += ', ' + element['Equipment_Name'].toString()
          : EqipStringAutoCues += '';
    });
    //Employee
    dataReservation_Employee.forEach((element) {
      element['Employee_Type_ID'] == '23'
          ? EmpStringProduction += ', ' + element['Employee_Email'].toString()
          : EmpStringProduction += '';
    });
    dataReservation_Employee.forEach((element) {
      element['Employee_Type_ID'] == '14' ||
              element['Employee_Type_ID'] == '21' ||
              element['Employee_Type_ID'] == '22'
          ? EmpStringProgram += ', ' + element['Employee_Email'].toString()
          : EmpStringProgram += '';
    });
    dataReservation_Employee.forEach((element) {
      element['Employee_Type_ID'] == '1'
          ? EmpStringEng += ', ' + element['Employee_Email'].toString()
          : EmpStringEng += '';
    });
    dataReservation_Employee.forEach((element) {
      element['Employee_Type_ID'] == '3' || element['Employee_Type_ID'] == '16'
          ? EmpStringDirector += ', ' + element['Employee_Email'].toString()
          : EmpStringDirector += '';
    });
    dataReservation_Employee.forEach((element) {
      element['Employee_Type_ID'] == '4' || element['Employee_Type_ID'] == '5'
          ? EmpStringCamera += ', ' + element['Employee_Email'].toString()
          : EmpStringCamera += '';
    });
    dataReservation_Employee.forEach((element) {
      element['Employee_Type_ID'] == '6' || element['Employee_Type_ID'] == '7'
          ? EmpStringAudio += ', ' + element['Employee_Email'].toString()
          : EmpStringAudio += '';
    });
    dataReservation_Employee.forEach((element) {
      element['Employee_Type_ID'] == '8' || element['Employee_Type_ID'] == '9'
          ? EmpStringLight += ', ' + element['Employee_Email'].toString()
          : EmpStringLight += '';
    });
    dataReservation_Employee.forEach((element) {
      element['Employee_Type_ID'] == '24'
          ? EmpStringPresentor += ', ' + element['Employee_Email'].toString()
          : EmpStringPresentor += '';
    });
    dataReservation_Employee.forEach((element) {
      element['Employee_Type_ID'] == '15'
          ? EmpStringReporter += ', ' + element['Employee_Email'].toString()
          : EmpStringReporter += '';
    });
    dataReservation_Employee.forEach((element) {
      element['Employee_Type_ID'] == '17'
          ? EmpStringOfficeBoy += ', ' + element['Employee_Email'].toString()
          : EmpStringOfficeBoy += '';
    });
    dataReservation_Employee.forEach((element) {
      element['Employee_Type_ID'] == '19'
          ? EmpStringCreative += ', ' + element['Employee_Email'].toString()
          : EmpStringCreative += '';
    });
    dataReservation_Employee.forEach((element) {
      element['Employee_Type_ID'] == '20'
          ? EmpStringCG += ', ' + element['Employee_Email'].toString()
          : EmpStringCG += '';
    });
    dataReservation_Employee.forEach((element) {
      element['Employee_Type_ID'] == '13'
          ? EmpStringDriver += ', ' + element['Employee_Email'].toString()
          : EmpStringDriver += '';
    });
    dataReservation_Location.forEach((element) {
      LocationString += ', ' + element['Location_Name'].toString();
    });
    dataReservation_Car.forEach((element) {
      TranspString += ', ' + element['Car_Type'].toString();
    });
  }
}
