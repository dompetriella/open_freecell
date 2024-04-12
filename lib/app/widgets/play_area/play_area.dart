import 'package:flutter/material.dart';
import 'package:open_freecell/app/globals/globals.dart';
import 'package:open_freecell/app/widgets/play_area/play_column.dart';

class PlayArea extends StatelessWidget {
  const PlayArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < GLOBAL_playColumnNumber; i++)
            PlayColumn(columnIndex: i)
        ],
      ),
    );
  }
}
