
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/leave_list_response.dart';
import '../models/loan.dart';
import '../models/overtime_request_response.dart';
import '../models/pms_detail_model.dart';
import '../services/employee_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/pms_service.dart';

class PmsListController extends GetxController {
  static PmsListController to = Get.find();
  PMSService? pmsService;
  var pmsDetailModels = <PMSDetailModel>[].obs;
  var pmsManagerDetailModels = <PMSDetailModel>[].obs;
  var pmsManagerDoneDetailModels = <PMSDetailModel>[].obs;
  final box = GetStorage();
  var isLoading = false.obs;
  var offset = 0.obs;
  @override
  void onReady() async {
    super.onReady();
    this.pmsService = await PMSService().init();
    getPmsList();
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<List<PMSDetailModel>> getPmsList() async {
    Future.delayed(
        Duration.zero,
        () => Get.dialog(
            Center(
                child: SpinKitWave(
              color: Color.fromRGBO(63, 51, 128, 1),
              size: 30.0,
            )),
            barrierDismissible: false));
    //fetch emp_id from GetX Storage
    var employee_id = box.read('emp_id');

    await pmsService?.getPmSelfList(int.tryParse(employee_id),offset.toString()).then((data){
      if(offset!=0){
        // update data and loading status
        isLoading.value = false;
        // data.forEach((element) {
        //   pmsDetailModels.add(element);
        // });
        for(var i=0;i<data.length;i++){
          pmsDetailModels.add(data[i]);
        }
      }else{
        pmsDetailModels.value = data;
      }
      Get.back();
    });
    return pmsDetailModels.value;

  }
  Future<List<PMSDetailModel>> getPmsApprovalList() async{

   Future.delayed(
       Duration.zero,
           () => Get.dialog(
           Center(
               child: SpinKitWave(
                 color: Color.fromRGBO(63, 51, 128, 1),
                 size: 30.0,
               )),
           barrierDismissible: false));
   var employee_id = box.read('emp_id');
   await pmsService?.getPmsToApproveList(int.tryParse(employee_id),offset.toString()).then((value){
     if(offset!=0){
       // update data and loading status
       isLoading.value = false;
       pmsManagerDetailModels.addAll(value);
     }else{
       pmsManagerDetailModels.value = value;
     }
     Get.back();
   });
   return pmsManagerDetailModels.value;
 }
  Future<List<PMSDetailModel>> getPmsApprovedList() async{
    Future.delayed(
        Duration.zero,
            () => Get.dialog(
            Center(
                child: SpinKitWave(
                  color: Color.fromRGBO(63, 51, 128, 1),
                  size: 30.0,
                )),
            barrierDismissible: false));
    var employee_id = box.read('emp_id');
    await pmsService?.getPmsApprovedList(int.tryParse(employee_id),offset.toString()).then((value){
      if(offset!=0){
        // update data and loading status
        isLoading.value = false;
        pmsManagerDoneDetailModels.addAll(value);
      }else{
        pmsManagerDoneDetailModels.value = value;
      }
      Get.back();
    });
    return pmsManagerDoneDetailModels.value;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
