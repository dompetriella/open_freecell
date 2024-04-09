import 'package:flutter/material.dart';
import 'package:truly_freecell/app/state/app_state.dart';
import 'package:truly_freecell/app/widgets/completed_pile/completed_pile.dart';
import 'package:truly_freecell/app/widgets/freecell/freecell.dart';
import 'package:truly_freecell/app/widgets/options/options.dart';
import 'package:truly_freecell/app/widgets/play_area/play_area.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(appStateProvider);
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'felt_background.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CompletedCardsBar(),
              Flexible(
                child: Column(
                  children: [
                    OptionsBar(),
                    PlayArea(),
                  ],
                ),
              ),
              FreeCellBar(),
            ],
          ),
        ],
      ),
    ));
  }
}
