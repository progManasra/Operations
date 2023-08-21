class AppLink {
  static const String test = "$server/test.php";

  //=================== Server ====================================
  static const String server = "https://www.sbamobileapp.net/ecommerce";
  static const String imagestatic = "https://www.sbamobileapp.net/ecommerce/upload";
  //--New
  static const String server2 = "https://www.sbamobileapp.net/shq";
  static const String imagestatic2 = "https://www.sbamobileapp.net/shq/upload/equipment";

  // ==================== Image =================================
  static const String imagecategories = "$imagestatic/categories";
  static const String imageitems = "$imagestatic/items";
  // ==================== Image_New =================================
  static const String imagecategories2 = "$imagestatic2/categories";
  static const String imageitems2 = "$imagestatic2/items";

  // ====================== Auth ================================
  static const String SignUp = "$server/auth/signup.php";
  static const String Login = "$server/auth/login.php";
  static const String verfiycodesignUp = "$server/auth/verfiycode.php";
  // ====================== Auth_New ================================
  static const String SignUp2 = "$server2/auth/signup.php";
  static const String Login2 = "$server2/auth/login.php";
  static const String verfiycodesignUp2 = "$server2/auth/verfiycode.php";

  // ====================== Forget Password ======================
  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword = "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword = "$server/forgetpassword/verifycode.php";
// ====================== Forget_Password_New ======================
  static const String checkEmail2 = "$server2/forgetpassword/checkemail.php";
  static const String resetPassword2 = "$server2/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword2 = "$server2/forgetpassword/verfiycode.php";

// ======================== Home ================================
  static const String homepage = "$server/home.php";

  //static const String CategoriesView = "$server/categories/view.php";
// ======================== items ================================
  static const String items = "$server/items/items.php";
// ======================== favorite ================================
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
// ======================== order ================================
  static const String OrderViewMain = "$server2/order/orderviewmain.php";
  static const String OrderViewDetail = "$server2/order/orderviewdetail.php";
  static const String OrderAdd = "$server2/order/orderadd.php";
  static const String OrderAddCam = "$server2/order/orderaddcam.php";
  static const String OrderAddAudio = "$server2/order/orderaddaudio.php";
  static const String OrderAddLight = "$server2/order/orderaddlight.php";
  static const String OrderAddEquip = "$server2/order/orderaddequip.php";
  static const String OrderAddEmp = "$server2/order/orderaddemployee.php";
  static const String OrderAddLocation = "$server2/order/orderaddlocation.php";
  static const String OrderAddSummary = "$server2/order/orderaddsummary.php";
  static const String OrderEditSummary = "$server2/order/ordereditsummary.php";

  static const String OrderEdit = "$server2/order/";
  static const String OrderDelete = "$server2/order/orderdelete.php";
// ======================== Equipment ================================
  static const String EquipmentViewByDept = "$server2/equipment/equipmentviewdetail.php";
  static const String EquipmentViewDetail = "$server2/equipment/equipmentviewdetailalone.php";
  static const String EquipmentAddInit = "$server2/equipment/equipmentaddinit.php";
  static const String EquipmentAdd = "$server2/equipment/equipmentadd.php";
  static const String EquipmentEdit = "$server2/equipment/equipmentedit.php";
  static const String Equipmentdelete = "$server2/equipment/equipmentdelete.php";
//======================== Notification ===============================
//....View Order/Reserviation/Booking Notifications
  static const String NotificationView = "$server2/notification/orderviewnote.php";
}
