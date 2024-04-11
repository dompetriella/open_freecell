import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:truly_freecell/app/state/app_state.dart';

class OptionsBar extends ConsumerWidget {
  const OptionsBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appStateActions = ref.watch(appStateProvider.notifier);

    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OptionsElevatedButton(
            icon: Icons.style,
            onPressed: () {
              appStateActions.restartGame();
            },
            buttonText: 'New Game',
          ),
          // OptionsElevatedButton(
          //   icon: Icons.undo,
          //   onPressed: () {
          //     appStateActions.undoLastMove();
          //   },
          //   buttonText: 'Undo',
          // ),
          // OptionsElevatedButton(
          //   icon: Icons.settings,
          //   onPressed: () {},
          //   buttonText: 'Options',
          // ),
          // OptionsElevatedButton(
          //   icon: Icons.wind_power,
          //   onPressed: () {
          //     appStateActions.winGame();
          //   },
          //   buttonText: 'Win',
          // ),
        ],
      ),
    );
  }
}

class OptionsElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final IconData icon;
  const OptionsElevatedButton({
    required this.onPressed,
    required this.buttonText,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
          onPressed: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 36,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                buttonText,
                style: TextStyle(fontSize: 36, color: Colors.black),
              ),
            ],
          )),
    );
  }
}
