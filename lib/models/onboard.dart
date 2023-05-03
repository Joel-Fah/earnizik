import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../ui/components/helper.dart';

class PageData {
  final String image;
  final String title;
  final String subtitle;
  final bool isLastPage;
  final IconData icon;

  PageData({
    required this.image,
    required this.title,
    required this.subtitle,
    this.isLastPage = false,
    required this.icon,
  });
}

final pages = [
  PageData(
    image: ImagePath.onboard1,
    title: 'You & Your hits',
    subtitle: 'Listen to your music the way you like and let it rock.',
    icon: IconlyBroken.play,
  ),
  PageData(
    image: ImagePath.onboard2,
    title: 'Yet to know all',
    subtitle: 'Level up your fav\'s list by daily discovering new songs and artists.',
    icon: IconlyBroken.heart,
  ),
  PageData(
    image: ImagePath.onboard3,
    title: 'Get rewarded',
    subtitle: 'And cherish on cake, get amazing rewards just by listening to your tops.',
    icon: IconlyBroken.wallet,
    isLastPage: true,
  ),
];