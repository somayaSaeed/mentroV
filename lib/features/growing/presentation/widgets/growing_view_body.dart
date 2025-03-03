import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentroverso/features/growing/presentation/widgets/growing_option_card.dart';
import 'motivational_banner.dart';

class GrowingViewBody extends StatelessWidget {
  const GrowingViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SliverVisibility(
        sliver: Column(
          children: [
            const SizedBox(
              height: 36,
            ),
            const MotivationalBanner(),
            const SizedBox(
              height: 55,
            ),
            GrowingOptionCard(
              title: 'Finished',
              description: 'View completed courses & achievements',
              icon: Icons.checklist,
              onTap: () {},
            ),
            const SizedBox(
              height: 65,
            ),
            GrowingOptionCard(
              title: 'Recommended',
              description: 'Personalized courses for your growth',
              icon: Icons.format_list_numbered,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
