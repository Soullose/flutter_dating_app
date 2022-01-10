import 'package:flutter/material.dart';
import 'package:flutter_dating_app/models/models.dart';
import 'package:flutter_dating_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          UserCard(user: User.users[0]),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 60,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ChoiceButton(
                  width: 60,
                  height: 60,
                  size: 25,
                  hasGradient: false,
                  color: Theme.of(context).colorScheme.secondary,
                  icon: Icons.clear_rounded,
                ),
                const ChoiceButton(
                  width: 80,
                  height: 80,
                  size: 30,
                  hasGradient: true,
                  color: Colors.white,
                  icon: Icons.favorite,
                ),
                ChoiceButton(
                  width: 60,
                  height: 60,
                  size: 25,
                  hasGradient: false,
                  color: Theme.of(context).primaryColor,
                  icon: Icons.watch_later,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChoiceButton extends StatelessWidget {
  final double width;
  final double height;
  final double size;
  final Color color;
  final bool hasGradient;
  final IconData icon;
  const ChoiceButton({
    Key? key,
    required this.width,
    required this.height,
    required this.size,
    required this.color,
    required this.hasGradient,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        gradient: hasGradient
            ? LinearGradient(colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).colorScheme.secondary,
              ])
            : const LinearGradient(colors: [
                Colors.white,
                Colors.white,
              ]),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(50),
            spreadRadius: 4,
            blurRadius: 4,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: Icon(
        icon,
        size: size,
        color: color,
      ),
    );
  }
}
