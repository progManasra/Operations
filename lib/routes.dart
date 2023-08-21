import 'package:app01/core/constant/routes.dart';
import 'package:app01/core/middelware/mymiddleware.dart';
import 'package:app01/view/screen/Home/inbox.dart';
import 'package:app01/view/screen/Home/profile.dart';
import 'package:app01/view/screen/Home/setting.dart';
import 'package:app01/view/screen/auth/Forgetpassword/forgetpassword.dart';
import 'package:app01/view/screen/auth/Forgetpassword/resetpassword.dart';
import 'package:app01/view/screen/auth/Forgetpassword/success_resetpassword.dart';
import 'package:app01/view/screen/auth/Forgetpassword/verfiycode.dart';
import 'package:app01/view/screen/auth/Forgetpassword/verfiycodesignup.dart';
import 'package:app01/view/screen/auth/login.dart';
import 'package:app01/view/screen/auth/signup.dart';
import 'package:app01/view/screen/auth/success_signup.dart';
import 'package:app01/view/screen/equipment/equipment_add.dart';
import 'package:app01/view/screen/equipment/equipment_edit.dart';
import 'package:app01/view/screen/equipment/equipment_view_by_dept.dart';
import 'package:app01/view/screen/equipment/equipment_view_detail.dart';
import 'package:app01/view/screen/equipment/equipment_view_main.dart';
import 'package:app01/view/screen/homescreen.dart';
import 'package:app01/view/screen/language.dart';
import 'package:app01/view/screen/Home/note.dart';
import 'package:app01/view/screen/onboarding.dart';
import 'package:app01/view/screen/order/order_Edit_cam.dart';
import 'package:app01/view/screen/order/order_Edit_location_transportation.dart';
import 'package:app01/view/screen/order/order_Edit_summary.dart';
import 'package:app01/view/screen/order/order_add.dart';
import 'package:app01/view/screen/order/order_add_audio.dart';
import 'package:app01/view/screen/order/order_add_cam.dart';
import 'package:app01/view/screen/order/order_add_employee.dart';
import 'package:app01/view/screen/order/order_add_equipment.dart';
import 'package:app01/view/screen/order/order_add_light.dart';
import 'package:app01/view/screen/order/order_add_location_transportation.dart';
import 'package:app01/view/screen/order/order_add_summary.dart';
import 'package:app01/view/screen/order/order_edit.dart';
import 'package:app01/view/screen/order/order_view_details.dart';
import 'package:app01/view/screen/order/order_view_main.dart';
import 'package:get/get.dart';
import 'view/screen/order/order_Edit_audio.dart';
import 'view/screen/order/order_Edit_employee.dart';
import 'view/screen/order/order_Edit_equipment.dart';
import 'view/screen/order/order_edit_light.dart';

List<GetPage<dynamic>>? routes = [
  //Auth
  GetPage(name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),

  GetPage(
    name: AppRoute.login,
    page: () => const Login(),
  ),
  GetPage(
    name: AppRoute.signUp,
    page: () => const SignUp(),
  ),
  GetPage(
    name: AppRoute.forgetPassword,
    page: () => const ForgetPassword(),
  ),
  GetPage(
    name: AppRoute.verfiyCode,
    page: () => VerfiyCode(),
  ),
  GetPage(
    name: AppRoute.resetPassword,
    page: () => const ResetPassword(),
  ),
  GetPage(
    name: AppRoute.successResetPassword,
    page: () => const SuccessResetPassword(),
  ),
  GetPage(
    name: AppRoute.successSignUp,
    page: () => const SuccessSignUp(),
  ),
  GetPage(
    name: AppRoute.verfiyCodeSignUp,
    page: () => const VerfiyCodeSignUp(),
  ),
  //OnBoarding

  GetPage(
    name: AppRoute.OnBoarding,
    page: () => const OnBoarding(),
  ),

  GetPage(
    name: AppRoute.homepage,
    page: () => const HomeScreen(),
  ),

//OrderViewMain
  GetPage(
    name: AppRoute.orderviewmain,
    page: () => OrderViewMain(),
  ),
  //OrderAdd
  GetPage(
    name: AppRoute.orderadd,
    page: () => OrderAdd(),
  ),
  //OrderAddCam
  GetPage(
    name: AppRoute.orderaddcam,
    page: () => OrderAddCam(),
  ),
  //orderaddaudio
  GetPage(
    name: AppRoute.orderaddaudio,
    page: () => OrderAddAudio(),
  ),
//OrderAddLight
  GetPage(
    name: AppRoute.orderaddlight,
    page: () => OrderAddLight(),
  ),
//OrderAddEquipment
  GetPage(
    name: AppRoute.orderaddequipment,
    page: () => OrderAddEquipment(),
  ),
//OrderAddEmployee
  GetPage(
    name: AppRoute.orderaddemployee,
    page: () => OrderAddEmployee(),
  ),
//OrderAddLocationAndTransportation
  GetPage(
    name: AppRoute.orderaddlocationandtransportation,
    page: () => OrderAddLocationAndTransportation(),
  ),
//OrderAddSummary
  GetPage(
    name: AppRoute.orderaddsummary,
    page: () => OrderAddSummary(),
  ),
//OrderViewdetails
  GetPage(
    name: AppRoute.OrderViewdetails,
    page: () => OrderViewdetails(),
  ),
  //OrderEdit
  GetPage(
    name: AppRoute.OrderEdit,
    page: () => OrderEdit(),
  ),
  //OrderEditCam
  GetPage(
    name: AppRoute.ordereditcam,
    page: () => OrderEditCam(),
  ),
  //orderEditaudio
  GetPage(
    name: AppRoute.ordereditaudio,
    page: () => OrderEditAudio(),
  ),
//OrderEditLight
  GetPage(
    name: AppRoute.ordereditlight,
    page: () => OrderEditLight(),
  ),
//OrderEditEquipment
  GetPage(
    name: AppRoute.ordereditequipment,
    page: () => OrderEditEquipment(),
  ),
//OrderEditEmployee
  GetPage(
    name: AppRoute.ordereditemployee,
    page: () => OrderEditEmployee(),
  ),
//OrderEditLocationAndTransportation
  GetPage(
    name: AppRoute.ordereditlocationandtransportation,
    page: () => OrderEditLocationAndTransportation(),
  ),
//OrderEditSummary
  GetPage(
    name: AppRoute.ordereditsummary,
    page: () => OrderEditSummary(),
  ),
  //EquipmentViewMain
  GetPage(
    name: AppRoute.equipmentviewmain,
    page: () => EquipmentViewMain(),
  ),
  //EquipmentViewByDept
  GetPage(
    name: AppRoute.equipmentviewbydept,
    page: () => EquipmentViewByDept(),
  ),
//EquipmentViewDetail
  GetPage(
    name: AppRoute.equipmentviewdetail,
    page: () => EquipmentViewDetail(),
  ),
  //EquipmentAdd
  GetPage(
    name: AppRoute.equipmentadd,
    page: () => EquipmentAdd(),
  ),
  //EquipmentEdit
  GetPage(
    name: AppRoute.equipmentedit,
    page: () => EquipmentEdit(),
  ),

  //Notification
  GetPage(
    name: AppRoute.note,
    page: () => Note(),
  ),
  //Profile
  GetPage(
    name: AppRoute.profile,
    page: () => Profile(),
  ),
  //Inbox
  GetPage(
    name: AppRoute.inbox,
    page: () => Inbox(),
  ),
  //Setting
  GetPage(
    name: AppRoute.setting,
    page: () => Setting(),
  ),
];
