import 'package:flutter/material.dart';
import 'package:mentroverso/features/home/presentation/widgets/info_card.dart';
import '../../../../core/utils/color_resources.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/feature_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          icon: Icon(
            Icons.menu,
            color: ColorResources.softWhite,
            size: 30,
          ),
        ),
        const SizedBox(height: 0),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),

                const InfoCard(),
                const SizedBox(height: 24),
                FeatureCard(
                  imagePath: '',
                  title: 'Questionnaire',
                  description: 'Discover your strengths and interests.',
                  onTap: () {
                  },
                ),
                const SizedBox(height: 24),
                FeatureCard(
                  imagePath: '',
                  title: 'Interview',
                  description: 'Test your skills and get feedback.',
                  onTap: () {},
                ),
                const SizedBox(height: 24),
                FeatureCard(
                  imagePath: '',
                  title: 'Meeting',
                  description: 'Discuss progress with your mentor',
                  onTap: () {},
                ),
                const SizedBox(height: 24),
                FeatureCard(
                  imagePath: '',
                  title: 'Chatbot',
                  description: 'Get instant AI guidance',
                  onTap: () {},
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
