import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_freecell/app/state/app_state.dart';
import 'package:open_freecell/app/theme.dart';

class OptionsBar extends ConsumerWidget {
  const OptionsBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appStateActions = ref.watch(appStateProvider.notifier);
    var appState = ref.watch(appStateProvider);

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
          OptionsElevatedButton(
            icon: Icons.undo,
            enabled: appState.undoEnabled,
            onPressed: () {
              appStateActions.undoLastMove();
            },
            buttonText: 'Undo',
          ),
          // OptionsElevatedButton(
          //   icon: Icons.settings,
          //   onPressed: () {
          //     showDialog(
          //       context: context,
          //       builder: (context) {
          //         return Dialog(
          //             backgroundColor: Colors.transparent,
          //             alignment: Alignment.bottomCenter,
          //             insetPadding: EdgeInsets.zero,
          //             child: OptionsModal());
          //       },
          //     );
          //   },
          //   buttonText: 'Options',
          // ),
        ],
      ),
    );
  }
}

class OptionChassis extends StatelessWidget {
  final Widget child;
  const OptionChassis({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
          child: child,
        ),
      ),
    );
  }
}

class OptionsModal extends StatelessWidget {
  const OptionsModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 2,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [freecellGreen, freecellGreen.withOpacity(.90)]),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.settings,
                        color: Colors.black,
                        size: 32,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Options'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Wrap(
                  children: [
                    OptionsTileToggle(),
                    OptionChassis(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Moves:',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '29',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 48,
                  )),
            )
          ],
        ),
      ),
    ).animate().slideY(begin: 1, curve: Curves.easeInOut);
  }
}

class OptionsTileToggle extends HookConsumerWidget {
  const OptionsTileToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var toggle = useState(true);
    return OptionChassis(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Auto-Complete',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          SizedBox(
            width: 8,
          ),
          Switch(
              activeColor: freecellGreen,
              value: toggle.value,
              onChanged: (value) {
                toggle.value = !toggle.value;
              })
        ],
      ),
    );
  }
}

class OptionsElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final IconData icon;
  final bool enabled;
  const OptionsElevatedButton({
    required this.onPressed,
    required this.buttonText,
    required this.icon,
    this.enabled = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
          onPressed: enabled ? onPressed : null,
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
