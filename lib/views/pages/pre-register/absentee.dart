// // ignore_for_file: prefer_const_constructors
//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:trilochanaa_app/constants/constants.dart';
// import 'package:trilochanaa_app/views/pages/pre-register/pre_register_add_page.dart';
// import '../../../Controllers/pre_register_controller.dart';
// import '../../shimmer/visitor-shimmer.dart';
// import '../../widget/preRegister_card.dart';
//
// class PreRegisterListPage extends StatefulWidget {
//   PreRegisterListPage({Key? key}) : super(key: key);
//
//   @override
//   State<PreRegisterListPage> createState() => _PreRegisterListPageState();
// }
//
// class _PreRegisterListPageState extends State<PreRegisterListPage> {
//   final TextEditingController searchTextController = TextEditingController();
//
//   final TextEditingController clockInController = TextEditingController();
//
//   final PreRegisterController preRegisterController =
//       Get.put(PreRegisterController());
//
//   bool clockIn = true;
//
//   bool clockingOut = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         length: 2,
//         child: SafeArea(
//           child: Scaffold(
//             backgroundColor: Colors.white,
//             floatingActionButtonLocation:
//                 FloatingActionButtonLocation.endDocked,
//             floatingActionButton: Padding(
//               padding: const EdgeInsets.all(8.0),
//              /* child: FloatingActionButton(
//                 child: Icon(Icons.add),
//                 backgroundColor: AppColor.primaryColor,
//                 onPressed: () {
//                   Get.to(() => PreRegisterAddPage(),
//                       duration: Duration(milliseconds: 400),
//                       transition: Transition.downToUp);
//                 },
//               ),*/
//             ),
//             body: GetBuilder<PreRegisterController>(
//                 init: PreRegisterController(),
//                 builder: (controller) {
//                   return (GestureDetector(
//                     onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//                     child: SingleChildScrollView(
//                       physics: const NeverScrollableScrollPhysics(),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               'Absentee'.tr,
//                               style: TextStyle(
//                                 color: AppColor.primaryColor,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                             const SizedBox(height: 24),
//                             SizedBox(
//                               height: 45,
//                               width: double.infinity,
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Expanded(
//                                     child: TextFormField(
//                                       controller: searchTextController,
//                                       textInputAction: TextInputAction.search,
//                                       keyboardType: TextInputType.text,
//                                       cursorColor: AppColor.primaryColor,
//                                       decoration: InputDecoration(
//                                         contentPadding: EdgeInsets.only(
//                                             top: 0, left: 15, right: 15),
//                                         hintText: 'search'.tr,
//                                         hintStyle: TextStyle(
//                                           fontWeight: FontWeight.w500,
//                                           fontSize: 16,
//                                           color: AppColor.hintColor,
//                                         ),
//                                         fillColor: Colors.red,
//                                         focusedBorder: OutlineInputBorder(
//                                           borderRadius: box.read('lang') == 'ar'
//                                               ? BorderRadius.only(
//                                                   topRight: Radius.circular(5),
//                                                   bottomRight:
//                                                       Radius.circular(5))
//                                               : BorderRadius.only(
//                                                   topLeft: Radius.circular(5),
//                                                   bottomLeft:
//                                                       Radius.circular(5)),
//                                           borderSide: BorderSide(
//                                               width: 1,
//                                               color: AppColor.primaryColor),
//                                         ),
//                                         enabledBorder: OutlineInputBorder(
//                                           borderRadius: box.read('lang') == 'ar'
//                                               ? BorderRadius.only(
//                                                   topRight: Radius.circular(5),
//                                                   bottomRight:
//                                                       Radius.circular(5))
//                                               : BorderRadius.only(
//                                                   topLeft: Radius.circular(5),
//                                                   bottomLeft:
//                                                       Radius.circular(5)),
//                                           borderSide: BorderSide(
//                                               width: 1,
//                                               color: AppColor.borderColor),
//                                         ),
//                                       ),
//                                       onFieldSubmitted: (value) {
//                                         preRegisterController
//                                             .getSearchedPreVisitors(
//                                                 searchTextController.text);
//                                         //add code
//                                       },
//                                       onChanged: (value) {
//                                         setState(() {
//                                           preRegisterController
//                                               .getSearchedPreVisitors(
//                                                   searchTextController.text);
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                   Container(
//                                     width: 45,
//                                     height: 45,
//                                     decoration: box.read('lang') == 'ar'
//                                         ? BoxDecoration(
//                                             color: AppColor.primaryColor,
//                                             borderRadius: BorderRadius.only(
//                                                 topLeft: Radius.circular(5),
//                                                 bottomLeft: Radius.circular(5)),
//                                           )
//                                         : BoxDecoration(
//                                             color: AppColor.primaryColor,
//                                             borderRadius: BorderRadius.only(
//                                                 topRight: Radius.circular(5),
//                                                 bottomRight:
//                                                     Radius.circular(5)),
//                                           ),
//                                     child: Center(
//                                         child: IconButton(
//                                       icon: SvgPicture.asset(
//                                         Images.search,
//                                         height: 16,
//                                         width: 16,
//                                       ),
//                                       color: Colors.white,
//                                       onPressed: () {
//                                         searchTextController.clear();
//                                         //add code
//                                       },
//                                     )),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SingleChildScrollView(
//                               child: Container(
//                                 margin: const EdgeInsets.only(top: 18),
//                                 padding: const EdgeInsets.only(bottom: 90),
//                                 height: ScreenSize(context).mainHeight / 1.17,
//                                 child: ListView.builder(
//                                     //Note: API ready hole ListView.spereted use korte hobe
//                                     shrinkWrap: true,
//                                     padding: EdgeInsets.zero,
//                                     itemCount: controller.preVisitorList.length,
//                                     itemBuilder:
//                                         (BuildContext context, int index) {
//                                       return controller.loader
//                                           ? VisitorShimmer()
//                                           : PreRegisterCard(
//                                               image: controller
//                                                   .preVisitorList[index].image
//                                                   .toString(),
//                                               name: controller
//                                                   .preVisitorList[index].name
//                                                   .toString(),
//                                               date: controller
//                                                   .preVisitorList[index]
//                                                   .expectedDate
//                                                   .toString(),
//                                               time: controller
//                                                   .preVisitorList[index]
//                                                   .expectedTime
//                                                   .toString(),
//                                               id: controller
//                                                   .preVisitorList[index].id
//                                                   .toString(),
//                                             );
//                                     }),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ));
//                 }),
//           ),
//         ));
//   }
//
//   showAlertDialog(BuildContext context) {
//     Widget continueButton = TextButton(
//       child: Container(
//         height: 45,
//         width: 100,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           color: AppColor.primaryColor,
//         ),
//         child: Center(
//           child: Text(
//             "yes_sure".tr,
//             style: TextStyle(
//               fontWeight: FontWeight.w600,
//               fontSize: 16,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       onPressed: () {
//         clockingOut = false;
//         Get.back();
//         (context as Element).markNeedsBuild();
//       },
//     );
//     Widget cancelButton = TextButton(
//       child: Container(
//         height: 47,
//         width: 102,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5),
//             border: Border.all(width: 1, color: AppColor.primaryColor)),
//         child: Center(
//           child: Text(
//             "no_cancel".tr,
//             style: TextStyle(
//               fontWeight: FontWeight.w600,
//               fontSize: 16,
//               color: AppColor.primaryColor,
//             ),
//           ),
//         ),
//       ),
//       onPressed: () {
//         Get.back();
//       },
//     );
//
//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       content: Text(
//         "sure_clock_out".tr,
//         style: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w500,
//           color: AppColor.primaryColor,
//         ),
//       ),
//       actions: [
//         continueButton,
//         cancelButton,
//       ],
//     );
//
//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
// }
