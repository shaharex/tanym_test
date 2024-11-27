import 'package:flutter/material.dart';
import 'package:tanymtest_app/src/core/common/common_button.dart';
import 'package:tanymtest_app/src/core/common/common_text.dart';
import 'package:tanymtest_app/src/core/common/common_title.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';
import 'package:tanymtest_app/src/features/profile/chat/chats_page.dart';
import 'package:tanymtest_app/src/features/profile/meet/make_appointment/make_appointment.dart';
import 'package:tanymtest_app/src/features/profile/meet/model/psychologist_model.dart';

class PsychologistsDetails extends StatelessWidget {
  final PsychologistModel psychologist;
  const PsychologistsDetails({super.key, required this.psychologist});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 340,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)),
                image: DecorationImage(
                  image: AssetImage(psychologist.image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  color: AppColors.white_color,
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTitle(
                        text: psychologist.name,
                        fontWeight: FontWeight.w500,
                        size: 26,
                      ),
                      CommonText(
                        text: psychologist.gov_institution,
                        text_align: TextAlign.start,
                        color: AppColors.low_black_color,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(height: 15),
                      CommonText(
                        text: psychologist.description,
                        text_align: TextAlign.start,
                        color: AppColors.low_black_color,
                        maxLines: 40,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CommonButton(
                            itMustbe: true,
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MakeAppointment()));
                            },
                            text: 'Назначить встречу'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: AppColors.primary_color,
                            width: 2.0,
                          ),
                        ),
                        height: 50,
                        width: 60,
                        child: IconButton(
                          icon: const Icon(
                            size: 32,
                            Icons.message_outlined,
                            color: AppColors.primary_color,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatsPage()));
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
