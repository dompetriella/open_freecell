import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:open_freecell/app/models/card_data.dart';

part 'app_state_data.freezed.dart';

@freezed
class AppStateData with _$AppStateData {
  factory AppStateData(
      {@Default([]) List<List<CardData>> completedPiles,
      @Default([]) List<List<CardData>> playColumns,
      @Default([]) List<List<CardData>> undoCompletedPiles,
      @Default([]) List<List<CardData>> undoPlayColumns,
      @Default(false) isAutocompleting,
      @Default(false) bool undoEnabled,
      @Default(false) bool gameIsWon}) = _AppStateData;
}
