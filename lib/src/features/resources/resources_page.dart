import 'package:flutter/material.dart';
import 'package:tanymtest_app/src/core/common/common_app_bar.dart';
import 'package:tanymtest_app/src/core/common/common_text.dart';
import 'package:tanymtest_app/src/core/constants/app_colors.dart';
import 'package:tanymtest_app/src/features/resources/tab_screens/articles/articles_screen.dart';
import 'package:tanymtest_app/src/features/resources/tab_screens/books/books_screen.dart';
import 'package:tanymtest_app/src/features/resources/tab_screens/podcasts/podcasts_screen.dart';

class ResourcesPage extends StatefulWidget {
  const ResourcesPage({super.key});

  @override
  State<ResourcesPage> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  /// List of Tab Bar Item
  List<String> items = [
    "Статьи",
    "Книги",
    "Подкасты",
  ];

  List screens = const [
    ArticlesScreen(),
    BooksScreen(),
    PodcastsScreen(),
  ];
  int current = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color,
      appBar: const CommonAppBar(
        title: 'Ресурсы',
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            /// Tab Bar
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                          pageController.animateToPage(
                            current,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.ease,
                          );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.all(5),
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            color: current == index
                                ? AppColors.primary_color
                                : Colors.white54,
                            borderRadius: BorderRadius.circular(30),
                            border: current == index
                                ? Border.all(
                                    color: AppColors.white_color, width: 1.0)
                                : Border.all(
                                    color: AppColors.primary_color, width: 1.5),
                          ),
                          child: Center(
                            child: CommonText(
                              size: 16,
                              fontWeight: FontWeight.w500,
                              text: items[index],
                              color: current == index
                                  ? AppColors.white_color
                                  : AppColors.primary_color,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              child: PageView.builder(
                itemCount: screens.length,
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return screens[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
