import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:truly_freecell/app/models/card_data.dart';

part 'app_state_data.freezed.dart';

@freezed
class AppStateData with _$AppStateData {
  factory AppStateData({
    @Default([]) List<List<CardData>> completedPiles,
    @Default([]) List<List<CardData>> playColumns,
  }) = _AppStateData;
}
