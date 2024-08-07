

import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_number_picker/flutter_number_picker.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:open_file/open_file.dart';
import '../controllers/pms_employee_detail_controller.dart';
import '../models/pms_detail_model.dart';
import '../my_class/my_app_bar.dart';
import '../my_class/my_style.dart';
import '../pages/leave_detail.dart';
import '../pages/pms_details.dart';
import '../routes/app_pages.dart';
import '../ui/components/textbox.dart';
import '../utils/app_utils.dart';
import '../utils/pdf_file_utils.dart';

class PmsDoneDetails extends StatefulWidget {
  @override
  _PmsDetailsState createState() => _PmsDetailsState();
}

class _PmsDetailsState extends State<PmsDoneDetails>
    with SingleTickerProviderStateMixin {
  final box = GetStorage();
  late TabController _tabController;
  TextEditingController remarkTextController = TextEditingController();

  PMSEmployeeDetailController controller =
  Get.put(PMSEmployeeDetailController());
  double ratingValue = 0;
  String role = '';
  int empID = 0;

  @override
  void initState() {
    role = box.read('role_category');
    _tabController = TabController(length: 3, vsync: this);
    controller.detailModel.value = Get.arguments;
    empID = int.tryParse(box.read('emp_id'))!;

    if(controller.detailModel.value!=null){
      if(controller.detailModel.value.state == 'mid_year_self_assessment'|| controller.detailModel.value.state == 'year_end_self_assessment')
        controller.detailModel.value.state == 'mid_year_self_assessment' || controller.detailModel.value.state == 'year_end_self_assessment' ? controller.showApprove.value=true : controller.showApprove.value=false;
      else
        controller.detailModel.value.state == 'mid_year_manager_approve' || controller.detailModel.value.state == 'year_end_manager_approve' || controller.detailModel.value.state == 'mid_year_dotted_manager_approve'|| controller.detailModel.value.state == 'year_end_dotted_manager_approve' ? controller.showApprove.value=true : controller.showApprove.value=false;
    }

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //PMSDetailModel pmsDetailModel = Get.arguments;
    // controller.detailModel.value = Get.arguments;

    //controller.calculateTotalEmployeeRate();
    //controller.calculateTotalFinalRate();
    //controller.calculateTotalScoreAverage();
    final box = GetStorage();
    String user_image = box.read('emp_image');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(8.0),
        child: appbar(context, "PMS Details", user_image)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 30, right: 30,top:20),
            child: Text(
              (controller.detailModel.value.name),
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(58, 47, 112, 1)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (("Period")),
                      style: pmstitleStyle(),
                    ),
                    Text(
                      (controller.detailModel.value.dateRangeId!.name),
                      style: pmstitleStyle(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (("Position")),
                      style: pmstitleStyle(),
                    ),
                    Text(
                      (AppUtils.removeNullString(controller
                          .detailModel.value.job_id!.name)),
                      style: pmstitleStyle(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (("Strat date")),
                      style: pmstitleStyle(),
                    ),
                    Text(
                      (

                          controller.detailModel.value.startDate()!=null?
                          AppUtils.changeDateFormat(controller.detailModel.value.startDate())
                              :''),
                      style: pmstitleStyle(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (("End date")),
                      style: pmstitleStyle(),
                    ),
                    Text(
                      (controller.detailModel.value.endDate()!=null?
                      AppUtils.changeDateFormat(controller.detailModel.value.endDate())
                          :''),
                      style: pmstitleStyle(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       (("Deadline")),
                //       style: pmstitleStyle(),
                //     ),
                //     Text(
                //       AppUtils.changeDateFormat(controller.detailModel.value.deadline)
                //       ,
                //       style: pmstitleStyle(),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(
                10.0,
              ),
            ),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              // give the indicator a decoration (color and border radius)
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                color: backgroundIconColor,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  text: 'THE WHAT:',
                ),
                Tab(
                  text: 'THE HOW:',
                ),
                Tab(
                  text: 'Final Evaluation',
                ),
                // Tab(
                //   text: 'Attachments',
                // ),
              ],
            ),
          ),
          // tab bar view here
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // first tab bar view widget
                Container(
                    margin: EdgeInsets.only(left:20,right:20,top:20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10,left:10,right:10),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Goal',
                                    style: TextStyle(color: backgroundIconColor),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Employee Self-Assessment',
                                    style: TextStyle(color: backgroundIconColor),
                                  )),
                              SizedBox(width:5),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Manager Rating',
                                    style: TextStyle(color: backgroundIconColor),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(height:10),
                        Padding(
                          padding: const EdgeInsets.only(top: 0, right: 5, left: 5),
                          child: Divider(
                            height: 1,
                            thickness: 1,
                            color: backgroundIconColor,
                          ),
                        ),
                        SizedBox(height:10),
                        Expanded(
                          child: Obx(
                                () => ListView.builder(
                                shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                itemCount: controller
                                    .detailModel.value.keyPerformanceIds!.length,
                                itemBuilder: (context, index) {
                                  Key_performance_ids keyPerformance = controller
                                      .detailModel.value.keyPerformanceIds![index];
                                  controller.managerRateTextController.text = keyPerformance
                                      .managerRate
                                      .toString();
                                  return InkWell(
                                    onTap: () {
                                      if(keyPerformance.attachmentIds!=null && keyPerformance.attachmentIds!.length > 0){
                                        controller.getAttachment(keyPerformance.attachmentIds!);
                                      }
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) => ListView(
                                            children: [
                                              Container(

                                                color: Color(0xff757575),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(10),
                                                        topRight:
                                                        Radius.circular(10)),
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 5, horizontal: 5),
                                                  child: Container(
                                                    margin: EdgeInsets.only(left: 10, right: 10),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                          Alignment.bottomRight,
                                                          child: IconButton(
                                                            icon: Icon(
                                                                Icons.close_outlined),
                                                            onPressed: () {
                                                              controller.attachment_list.value = [];
                                                              controller.isShowImageAttachment.value = false;
                                                              controller.image_base64_list =[];
                                                              controller.imageList.value = [];
                                                              Get.back();
                                                            },
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                                child: Text(
                                                                  'Goal',
                                                                  style: pmstitleStyle(),
                                                                )),
                                                            Expanded(
                                                                child: Text(
                                                                    keyPerformance
                                                                        .name))
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                                child: Text(
                                                                    'KPI',
                                                                    style:
                                                                    pmstitleStyle())),
                                                            keyPerformance
                                                                        .description!=null ? Expanded(
                                                                child: Text(
                                                                    keyPerformance
                                                                        .description)):Expanded(child: Text(''))
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                                child: Text(
                                                                    'WEIGHTAGE(%)',
                                                                    style:
                                                                    pmstitleStyle())),
                                                            Expanded(
                                                                child: Text(
                                                                    keyPerformance
                                                                        .weightage
                                                                        .toString()))
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                                child: Text(
                                                                    'Employee Self-Assessment',
                                                                    style:
                                                                    pmstitleStyle())),
                                                            keyPerformance
                                                              .employeeRating !=
                                                          null &&
                                                      keyPerformance
                                                              .employeeRating!
                                                              .name !=
                                                          null ? Expanded(
                                                                child: Text(
                                                                    keyPerformance
                                                                        .employeeRating!.name
                                                                        .toString())
                                                            ):Expanded(child: Text(''),)
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                                child: Text(
                                                                    'Manager Rating',
                                                                    style:
                                                                    pmstitleStyle())),

                                                            keyPerformance
                                                              .managerRating !=
                                                          null &&
                                                      keyPerformance
                                                              .managerRating!
                                                              .name !=
                                                          null ?Expanded(
                                                                child: Text(
                                                                    keyPerformance
                                                                        .managerRating!.name
                                                                        .toString())
                                                            ):Expanded(child: Text(''))
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text('Employee Remarks',
                                                            style: pmstitleStyle()),
                                                        Text(keyPerformance
                                                            .employeeRemark
                                                            .toString() ??
                                                            ''),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text('Manager Remarks',
                                                            style: pmstitleStyle()),
                                                        Text(keyPerformance
                                                            .managerRemark
                                                            .toString() ??
                                                            ''),
                                                        SizedBox(height: 10,),
                                                        Text('Attachments',
                                                            style: pmstitleStyle()),
                                                        Obx(() => controller.attachment_list.value.length > 0
                                                                                            ? Row(
                                                                                              children: [
                                                                                                Expanded(
                                                                                                    child: GridView.count(
                                                                                                    shrinkWrap: true,
                                                                                                    physics: NeverScrollableScrollPhysics(),
                                                                                                    crossAxisCount: 3,
                                                                                                    children: List.generate(controller.attachment_list.value.length, (index1) {
                                                                                                      return controller.attachment_list.value[index1].name.contains(".pdf")
                                                                                                          ? Padding(
                                                                                                              padding: EdgeInsets.all(8.0),
                                                                                                              child: GestureDetector(
                                                                                                                onTap: () async {
                                                                                                                  createPDFFileFromString(controller.attachment_list.value[index1].attach_file).then((path) async {
                                                                                                                    await OpenFile.open(path);
                                                                                                                  });
                                                                                                                },
                                                                                                                child: Container(
                                                                                                                  height: 100,
                                                                                                                  width: 100,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                      border: Border.all(
                                                                                                                        color: Colors.black, //color of border
                                                                                                                        width: 1, //width of border
                                                                                                                      ),
                                                                                                                      borderRadius: BorderRadius.circular(5)),
                                                                                                                  child: Center(
                                                                                                                    child: Text(
                                                                                                                      controller.attachment_list.value[index1].name,
                                                                                                                      textAlign: TextAlign.center,
                                                                                                                      style: TextStyle(
                                                                                                                        color: Colors.black54,
                                                                                                                        fontSize: 16,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            )
                                                                                                          : Padding(
                                                                                                              padding: EdgeInsets.all(8.0),
                                                                                                              child: Image.memory(
                                                                                                                base64Decode(controller.attachment_list.value[index1].attach_file),
                                                                                                                fit: BoxFit.cover,
                                                                                                                width: 100,
                                                                                                                height: 100,
                                                                                                              ),
                                                                                                            );
                                                                                                    }),
                                                                                                  )),
                                                                                              ],
                                                                                            )
                                                                                            : SizedBox()),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ));
                                    },
                                    child: Container(
                                      color: index % 2 == 0
                                          ? Colors.grey.shade300
                                          : Colors.grey.shade100,
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 10, right: 10,bottom:10),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Text(
                                                keyPerformance.name,
                                                style: TextStyle(
                                                    color: backgroundIconColor),
                                              )),
                                          Expanded(
                                              flex: 1,
                                              child: keyPerformance.employeeRating!= null && keyPerformance.employeeRating!.id!= 0 && keyPerformance.employeeRating!.id!=null ?Text(
                                                keyPerformance.employeeRating!.name
                                                    .toString(),
                                                style: TextStyle(
                                                    color: backgroundIconColor),
                                                textAlign: TextAlign.center,
                                              ):Text('',style: TextStyle(
                                                    color: backgroundIconColor))),
                                          Expanded(
                                              flex: 1,
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  keyPerformance.managerRating!=null && keyPerformance.managerRating!.id!=0 && keyPerformance.managerRating!.id!=null ? Text(
                                                    keyPerformance.managerRating!.name
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: backgroundIconColor),
                                                    textAlign: TextAlign.center,
                                                  ):Text('',style: TextStyle(
                                                        color: backgroundIconColor)),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),

                        // Padding(
                        //   padding: const EdgeInsets.only(top: 10, right: 5, left: 5,bottom:10),
                        //   child: Divider(
                        //     height: 1,
                        //     thickness: 1,
                        //     color: backgroundIconColor,
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 10,left:10),
                        //   child: Row(
                        //     children: [
                        //       Expanded(
                        //           flex: 2,
                        //           child: Text(
                        //             'Average',
                        //             style: TextStyle(color: backgroundIconColor,fontSize: 16,fontWeight: FontWeight.bold),
                        //           )),
                        //       Expanded(
                        //           flex: 1,
                        //           child: Obx(
                        //                 () => Text(
                        //               NumberFormat("#.##").format(
                        //                   controller.totalEmployeeRate.value),
                        //               style: TextStyle(color: backgroundIconColor,fontSize: 16,fontWeight: FontWeight.bold),
                        //               textAlign: TextAlign.center,
                        //             ),
                        //           )),
                        //       Expanded(
                        //           flex: 1,
                        //           child: Obx(
                        //                 () => Text(
                        //               NumberFormat("#.##")
                        //                   .format(controller.totalFinalRate.value),
                        //               style: TextStyle(color: backgroundIconColor,fontSize: 16,fontWeight: FontWeight.bold),
                        //               textAlign: TextAlign.center,
                        //             ),
                        //           )),
                        //     ],
                        //   ),
                        // ),
                      ],
                    )),
                Container(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10,left:10,right:0),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Key Performance Areas',
                                    style: TextStyle(color: backgroundIconColor),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Text('Description',
                                      style: TextStyle(color: backgroundIconColor),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis)),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Employee Self-Assessment',
                                    style: TextStyle(
                                      color: backgroundIconColor,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Manager Rating',
                                    style: TextStyle(
                                      color: backgroundIconColor,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, right: 5, left: 5),
                          child: Divider(
                            height: 1,
                            thickness: 1,
                            color: backgroundIconColor,
                          ),
                        ),
                        Obx(() => ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller
                                .detailModel.value.competenciesIds!.length,
                            itemBuilder: (context, index) {
                              Competencies_ids competencies = controller
                                  .detailModel.value.competenciesIds![index];
                              return InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) => Container(
                                        color: Color(0xff757575),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight:
                                                Radius.circular(10)),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 5),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment:
                                                Alignment.bottomRight,
                                                child: IconButton(
                                                  icon: Icon(
                                                      Icons.close_outlined),
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                        'KEY PERFORMANCE AREAS',
                                                        style: pmstitleStyle(),
                                                      )),
                                                  Expanded(
                                                      child: Text(
                                                          competencies.name))
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                          'Description',
                                                          style:
                                                          pmstitleStyle())),
                                                  Expanded(
                                                      child: competencies
                                                          .description!= null ?Text(competencies
                                                          .description):Text(''))
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: Text('Employee Self-Assessment',
                                                          style:
                                                          pmstitleStyle())),
                                                  competencies.employee_rating!=null && competencies.employee_rating!.id != 0 && competencies.employee_rating!.id != null ? Expanded(
                                                      child: Text(competencies
                                                          .employee_rating!.name
                                                          .toString())):Expanded(child: Text(''),)
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: Text('Manager Rating',
                                                          style:
                                                          pmstitleStyle())),
                                                  competencies.rating!=null && competencies.rating!.id != 0 && competencies.rating!.id != null ? Expanded(
                                                      child: Text(competencies
                                                          .rating!.name
                                                          .toString())):Expanded(child: Text(''),)
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text('Remark',
                                                  style: pmstitleStyle()),
                                              Text(competencies.comment
                                                  .toString() ??
                                                  ''),
                                            ],
                                          ),
                                        ),
                                      ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 0,left:10,right:10),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20,),
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Text(
                                                competencies.name,
                                                style: TextStyle(
                                                    color: backgroundIconColor),
                                              )),
                                          Expanded(
                                              flex: 2,
                                              child: competencies.description!=null ?Text(competencies.description,
                                                  style: TextStyle(
                                                      color: backgroundIconColor),
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis):Text('')),
                                          /* Expanded(
                                                flex: 1,
                                                child: Text(
                                                  competencies.score.toString(),
                                                  style: TextStyle(
                                                    color: backgroundIconColor,
                                                  ),
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                )),*/
                                          Expanded(
                                              flex: 1,
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.end,
                                                children: [
                                                  competencies.employee_rating!=null && competencies.employee_rating!.id!=0 && competencies.employee_rating!.id!=null ? Text(
                                                    competencies.employee_rating!.name.toString(),
                                                    style: TextStyle(
                                                        color: backgroundIconColor),
                                                    textAlign: TextAlign.center,
                                                  ):Text('',style: TextStyle(
                                                        color: backgroundIconColor)),
                                                ],
                                              )),
                                          Expanded(
                                              flex: 1,
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.end,
                                                children: [
                                                  competencies.rating!=null && competencies.id!=0 && competencies.id!=null ? Text(
                                                    competencies.rating!.name.toString(),
                                                    style: TextStyle(
                                                        color: backgroundIconColor),
                                                    textAlign: TextAlign.center,
                                                  ):Text('',style: TextStyle(
                                                        color: backgroundIconColor)),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                        ),
                        SizedBox(height:10),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, right: 5, left: 5),
                          child: Divider(
                            height: 1,
                            thickness: 1,
                            color: backgroundIconColor,
                          ),
                        ),
                        SizedBox(height:10),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 10,left:10),
                        //   child: Row(
                        //     children: [
                        //       Expanded(
                        //           flex: 2,
                        //           child: Text(
                        //             'Average',
                        //             style: TextStyle(color: backgroundIconColor,fontSize: 16,fontWeight: FontWeight.bold),
                        //           )),
                        //       Expanded(
                        //           flex: 2,
                        //           child: Container()),
                        //       Expanded(
                        //           flex: 1,
                        //           child: Obx(
                        //                 () => Text(
                        //               NumberFormat("#.##").format(
                        //                   controller.totalScoreAverage.value),
                        //               style: TextStyle(color: backgroundIconColor,fontSize: 16,fontWeight: FontWeight.bold),
                        //               textAlign: TextAlign.center,
                        //             ),
                        //           )),
                        //     ],
                        //   ),
                        // ),


                      ],
                    )),
                Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:10,top: 10),
                          child: Row(
                            children: [
                              // Expanded(
                              //     flex: 1,
                              //     child: Text(
                              //       'Review Year',
                              //       style: TextStyle(color: backgroundIconColor),
                              //     )),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Final Rating',
                                    style: TextStyle(color: backgroundIconColor),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Final Description',
                                    style: TextStyle(color: backgroundIconColor),
                                  )),
                              // Expanded(
                              //     flex: 1,
                              //     child: Text(
                              //       'Competency',
                              //       style: TextStyle(color: backgroundIconColor),
                              //     )),
                              // Expanded(
                              //     flex: 1,
                              //     child: Text(
                              //       'Final Rating',
                              //       style: TextStyle(color: backgroundIconColor),
                              //     )),
                            ],
                          ),
                        ),
                        SizedBox(height:20),
                        Padding(
                          padding: const EdgeInsets.only(top: 0, right: 0, left: 0),
                          child: Divider(
                            height: 1,
                            thickness: 1,
                            color: backgroundIconColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:10,top: 10),
                          child: Row(
                            children: [
                              // Expanded(
                              //     flex: 1,
                              //     child: Text(
                              //       'Mid',
                              //       style: TextStyle(color: backgroundIconColor),
                              //     )),
                              Expanded(
                                  flex: 1,
                                  // child: Text(
                                  //   AppUtils.changeDateFormat(controller.detailModel.value.midFromDate)+" - "+AppUtils.changeDateFormat(controller.detailModel.value.midToDate),
                                  //   style: TextStyle(color: backgroundIconColor),
                                  // )),
                                  child: controller
                                          .detailModel.value.final_evaluation_rating!=null && controller
                                          .detailModel.value.final_evaluation_rating!.id != 0 && controller
                                          .detailModel.value.final_evaluation_rating!.id != null ?Text(controller
                                          .detailModel.value.final_evaluation_rating!.name.toString(),
                                          style: TextStyle(color: backgroundIconColor)):Text('',style: TextStyle(color: backgroundIconColor),)
                                 ),
                              Expanded(
                                  flex: 1,
                                  // child: Text(
                                  //   AppUtils.removeNullString(controller.detailModel.value.mid_kpi.toStringAsFixed(1)),
                                  //   style: TextStyle(color: backgroundIconColor),
                                  // )),
                                  child: controller.detailModel.value.final_evaluation_description!=null ?Text(controller.detailModel.value.final_evaluation_description.toString(),style: TextStyle(color: backgroundIconColor)):
                                  Text('',style: TextStyle(color: backgroundIconColor),)
                              ),
                              // Expanded(
                              //     flex: 1,
                              //     child: Text(
                              //       AppUtils.removeNullString(controller.detailModel.value.mid_competency_score.toStringAsFixed(1)),
                              //       style: TextStyle(color: backgroundIconColor),
                              //     )),
                              // Expanded(
                              //     flex: 1,
                              //     child: Text(
                              //       AppUtils.removeNullString(controller.detailModel.value.mid_final_rating.toStringAsFixed(1)),
                              //       style: TextStyle(color: backgroundIconColor),
                              //     )),
                            ],
                          ),
                        ),
                        // SizedBox(height:10),
                        // Padding(
                        //   padding: const EdgeInsets.only(left:10,top: 10),
                        //   child: Row(
                        //     children: [
                        //       // Expanded(
                        //       //     flex: 1,
                        //       //     child: Text(
                        //       //       'Annual',
                        //       //       style: TextStyle(color: backgroundIconColor),
                        //       //     )),
                        //       Expanded(
                        //           flex: 1,
                        //           child: Text(
                        //             AppUtils.changeDateFormat(controller.detailModel.value.endFromDate)+" - "+AppUtils.changeDateFormat(controller.detailModel.value.endToDate),
                        //             style: TextStyle(color: backgroundIconColor),
                        //           )),
                        //       Expanded(
                        //           flex: 1,
                        //           child: Text(
                        //             AppUtils.removeNullString(controller.detailModel.value.kpi.toStringAsFixed(1)),
                        //             style: TextStyle(color: backgroundIconColor),
                        //           )),
                        //       Expanded(
                        //           flex: 1,
                        //           child: Text(
                        //             AppUtils.removeNullString(controller.detailModel.value.competency_score.toStringAsFixed(1)),
                        //             style: TextStyle(color: backgroundIconColor),
                        //           )),
                        //       Expanded(
                        //           flex: 1,
                        //           child: Text(
                        //             AppUtils.removeNullString(controller.detailModel.value.final_rating.toStringAsFixed(1)),
                        //             style: TextStyle(color: backgroundIconColor),
                        //           )),
                        //     ],
                        //   ),
                        // ),
                      ],
                    )),

                // Container(
                //   child: Obx(() => 
                //   controller.detailModel.value.keyPerformanceAttachmentIds.length <= 0 ? 
                //   Center(child: Text('No attachment'),)
                //   :
                //   ListView.builder(
                //       itemCount: controller.detailModel.value.keyPerformanceAttachmentIds.length,
                //       itemBuilder: (context, index) {
                //         return InkWell(
                //           onTap: ()async{
                //             controller.detailModel.value
                //                         .keyPerformanceAttachmentIds[index].mimetype
                //                         .contains('pdf')
                //                     ?
                //                     // open pdf
                //                     createPDFFileFromString(controller
                //                             .detailModel
                //                             .value
                //                             .keyPerformanceAttachmentIds[index]
                //                             .attached_file)
                //                         .then((path) async {
                //                         await OpenFile.open(path);
                //                       })
                //                       :controller.detailModel.value
                //                         .keyPerformanceAttachmentIds[index].mimetype
                //                         .contains('application/vnd.ms-excel')
                //                     ?
                //                     // open pdf
                //                     createExcelFileFromString(controller
                //                             .detailModel
                //                             .value
                //                             .keyPerformanceAttachmentIds[index]
                //                             .attached_file)
                //                         .then((path) async {
                //                         await OpenFile.open(path);
                //                       })
                //                     :controller.detailModel.value
                //                         .keyPerformanceAttachmentIds[index].mimetype
                //                         .contains('application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
                //                     ?
                //                     // open pdf
                //                     createExFileFromString(controller
                //                             .detailModel
                //                             .value
                //                             .keyPerformanceAttachmentIds[index]
                //                             .attached_file)
                //                         .then((path) async {
                //                         await OpenFile.open(path);
                //                       })
                //                     :controller.detailModel.value
                //                         .keyPerformanceAttachmentIds[index].mimetype
                //                         .contains('application/msword')
                //                     ?
                //                     // open pdf
                //                     createWordFileFromString(controller
                //                             .detailModel
                //                             .value
                //                             .keyPerformanceAttachmentIds[index]
                //                             .attached_file)
                //                         .then((path) async {
                //                         await OpenFile.open(path);
                //                       })
                //                       :controller.detailModel.value
                //                         .keyPerformanceAttachmentIds[index].mimetype
                //                         .contains('application/vnd.openxmlformats-officedocument.wordprocessingml.document')
                //                     ?
                //                     // open pdf
                //                     createDocxWordFileFromString(controller
                //                             .detailModel
                //                             .value
                //                             .keyPerformanceAttachmentIds[index]
                //                             .attached_file)
                //                         .then((path) async {
                //                         await OpenFile.open(path);
                //                       })
                //                     :
                //                     await showDialog(
                //                         context: context,
                //                         builder: (_) {
                //                           return ImageDialog(
                //                             bytes: base64Decode(controller
                //                             .detailModel
                //                             .value
                //                             .keyPerformanceAttachmentIds[index]
                //                             .attached_file),
                //                           );
                //                         });
                //           },
                //           child: Card(
                //             child: ListTile(
                //               title: Text('${controller.detailModel.value.keyPerformanceAttachmentIds[index].name}'),
                //             ),
                //           ),
                //         );
                //       })),
                // ),
              ],
            ),
          ),

          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
