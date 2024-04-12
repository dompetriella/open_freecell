import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:open_freecell/app/models/enums.dart';

part 'card_data.freezed.dart';

@freezed
class CardData with _$CardData {
  factory CardData(
      {required int id,
      required Suits suit,
      required int value,
      required int lastColumnIndex,
      @Default(false) bool isExpanded}) = _CardData;
}
