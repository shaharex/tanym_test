// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:tanymtest_app/src/core/common/common_app_bar.dart';
// import 'package:tanymtest_app/src/core/common/common_text.dart';
// import 'package:tanymtest_app/src/core/constants/app_colors.dart';
// import 'package:tanymtest_app/src/features/psychologists/provider/psychologist_provider.dart';
//
// class ChatsPage extends StatefulWidget {
//   const ChatsPage({super.key});
//
//   @override
//   State<ChatsPage> createState() => _ChatsPageState();
// }
//
// class _ChatsPageState extends State<ChatsPage> {
//   @override
//   void initState() {
//     Provider.of<FirebaseProvider>(context, listen: false).getPsychologists();
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: AppColors.white_color,
//         appBar: CommonAppBar(
//           icon: const Icon(
//             Icons.arrow_back_ios_new_rounded,
//             color: AppColors.white_color,
//           ),
//           onTap: () {
//             Navigator.pop(context);
//           },
//           title: 'Чат',
//         ),
//         body: Consumer<FirebaseProvider>(builder: (context, value, child) {
//           return ListView.separated(
//             separatorBuilder: (BuildContext context, int index) {
//               return const SizedBox(height: 15);
//             },
//             padding: const EdgeInsets.all(20.0),
//             physics: const BouncingScrollPhysics(),
//             scrollDirection: Axis.vertical,
//             itemCount: value.psychologists.length,
//             itemBuilder: (context, index) {
//               var result = value.psychologists[index];
//               return GestureDetector(
//                 onTap: () {
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(
//                   //    // builder: (context) => ChatScreen(teacher:psychologistData[index],),
//                   //   ),
//                   // );
//                 },
//                 child: Container(
//                   color: Colors.transparent,
//                   child: Row(
//                     children: [
//                       Stack(
//                         alignment: Alignment.topRight,
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(10.0),
//                             child: Image.asset(
//                               result.image,
//                               fit: BoxFit.cover,
//                               height: 65,
//                               width: 70,
//                             ),
//                           ),
//                           CircleAvatar(
//                             backgroundColor: result.is_online
//                                 ? AppColors.primary_color
//                                 : AppColors.grey_color,
//                             radius: 7,
//                           ),
//                         ],
//                       ),
//                       const SizedBox(width: 15),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             CommonText(
//                               text: result.name,
//                               maxLines: 1,
//                               size: 20,
//                             ),
//                             // CommonText(
//                             //   text: result['last_message'],
//                             //   color: AppColors.grey_color,
//                             //   maxLines: 1,
//                             //   size: 15,
//                             // ),
//                           ],
//                         ),
//                       ),
//                       const Column(
//                         children: [
//                           // CommonText(
//                           //   text: result['time'],
//                           //   size: 13,
//                           //   color: AppColors.dark_grey_color,
//                           // ),
//                           CircleAvatar(
//                             radius: 12,
//                             backgroundColor: AppColors.light_primary_color,
//                             child: CommonText(
//                               text: '1',
//                               size: 12,
//                               color: AppColors.primary_color,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         }),
//       ),
//     );
//   }
// }
