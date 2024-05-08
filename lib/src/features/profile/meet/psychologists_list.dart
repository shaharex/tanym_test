import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanymtest_app/src/core/common/common_app_bar.dart';
import 'package:tanymtest_app/src/core/common/common_text.dart';
import 'package:tanymtest_app/src/core/common/common_title.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';
import 'package:tanymtest_app/src/features/profile/meet/provider/psychologist_provider.dart';
import 'package:tanymtest_app/src/features/profile/meet/psychologist_details.dart';

class PsychologistsList extends StatefulWidget {
  const PsychologistsList({super.key});

  @override
  State<PsychologistsList> createState() => _PsychologistsListState();
}

class _PsychologistsListState extends State<PsychologistsList> {
  @override
  void initState() {
    Provider.of<FirebaseProvider>(context, listen: false).getPsychologists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CommonAppBar(
          background_color: AppColors.background_color,
          title: 'Выберите психолога',
          text_color: AppColors.primary_color,
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.primary_color,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.background_color,
        body: FutureBuilder(
          future: Provider.of<FirebaseProvider>(context, listen: false)
              .getPsychologists(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary_color,
                ),
              );
            } else {
              return Consumer<FirebaseProvider>(
                builder: (context, firebaseProvider, child) {
                  return ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 15);
                    },
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(20.0),
                    physics: const BouncingScrollPhysics(),
                    itemCount: firebaseProvider.psychologists.length,
                    itemBuilder: (context, index) {
                      final psychologist =
                          firebaseProvider.psychologists[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PsychologistsDetails(
                                      psychologist: firebaseProvider
                                          .psychologists[index])));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.white_color,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  psychologist.image,
                                  fit: BoxFit.cover,
                                  height: 65,
                                  width: 70,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonTitle(
                                      text: psychologist.name,
                                      maxLines: 1,
                                      size: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: CommonText(
                                        text: psychologist.gov_institution,
                                        color: AppColors.grey_color,
                                        maxLines: 2,
                                        size: 14,
                                        text_align: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
