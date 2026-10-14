// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// A mystery-chest surprise on a Reward Road board (kind: gold | item).
class BoardPrizeStruct extends BaseStruct {
  BoardPrizeStruct({
    /// BoardPrize.space
    int? space,

    /// BoardPrize.kind
    String? kind,

    /// BoardPrize.gold
    int? gold,

    /// BoardPrize.itemId
    String? itemId,

    /// BoardPrize.label
    String? label,

    /// BoardPrize.look
    String? look,

    /// BoardPrize.revealed
    bool? revealed,

    /// BoardPrize.claimed
    bool? claimed,
  })  : _space = space,
        _kind = kind,
        _gold = gold,
        _itemId = itemId,
        _label = label,
        _look = look,
        _revealed = revealed,
        _claimed = claimed;

  // "space" field.
  int? _space;
  int get space => _space ?? 0;
  set space(int? val) => _space = val;

  void incrementSpace(int amount) => space = space + amount;

  bool hasSpace() => _space != null;

  // "kind" field.
  String? _kind;
  String get kind => _kind ?? '';
  set kind(String? val) => _kind = val;

  bool hasKind() => _kind != null;

  // "gold" field.
  int? _gold;
  int get gold => _gold ?? 0;
  set gold(int? val) => _gold = val;

  void incrementGold(int amount) => gold = gold + amount;

  bool hasGold() => _gold != null;

  // "itemId" field.
  String? _itemId;
  String get itemId => _itemId ?? '';
  set itemId(String? val) => _itemId = val;

  bool hasItemId() => _itemId != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  // "look" field.
  String? _look;
  String get look => _look ?? '';
  set look(String? val) => _look = val;

  bool hasLook() => _look != null;

  // "revealed" field.
  bool? _revealed;
  bool get revealed => _revealed ?? false;
  set revealed(bool? val) => _revealed = val;

  bool hasRevealed() => _revealed != null;

  // "claimed" field.
  bool? _claimed;
  bool get claimed => _claimed ?? false;
  set claimed(bool? val) => _claimed = val;

  bool hasClaimed() => _claimed != null;

  static BoardPrizeStruct fromMap(Map<String, dynamic> data) =>
      BoardPrizeStruct(
        space: castToType<int>(data['space']),
        kind: data['kind'] as String?,
        gold: castToType<int>(data['gold']),
        itemId: data['itemId'] as String?,
        label: data['label'] as String?,
        look: data['look'] as String?,
        revealed: data['revealed'] as bool?,
        claimed: data['claimed'] as bool?,
      );

  static BoardPrizeStruct? maybeFromMap(dynamic data) => data is Map
      ? BoardPrizeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'space': _space,
        'kind': _kind,
        'gold': _gold,
        'itemId': _itemId,
        'label': _label,
        'look': _look,
        'revealed': _revealed,
        'claimed': _claimed,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'space': serializeParam(
          _space,
          ParamType.int,
        ),
        'kind': serializeParam(
          _kind,
          ParamType.String,
        ),
        'gold': serializeParam(
          _gold,
          ParamType.int,
        ),
        'itemId': serializeParam(
          _itemId,
          ParamType.String,
        ),
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'look': serializeParam(
          _look,
          ParamType.String,
        ),
        'revealed': serializeParam(
          _revealed,
          ParamType.bool,
        ),
        'claimed': serializeParam(
          _claimed,
          ParamType.bool,
        ),
      }.withoutNulls;

  static BoardPrizeStruct fromSerializableMap(Map<String, dynamic> data) =>
      BoardPrizeStruct(
        space: deserializeParam(
          data['space'],
          ParamType.int,
          false,
        ),
        kind: deserializeParam(
          data['kind'],
          ParamType.String,
          false,
        ),
        gold: deserializeParam(
          data['gold'],
          ParamType.int,
          false,
        ),
        itemId: deserializeParam(
          data['itemId'],
          ParamType.String,
          false,
        ),
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        look: deserializeParam(
          data['look'],
          ParamType.String,
          false,
        ),
        revealed: deserializeParam(
          data['revealed'],
          ParamType.bool,
          false,
        ),
        claimed: deserializeParam(
          data['claimed'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'BoardPrizeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BoardPrizeStruct &&
        space == other.space &&
        kind == other.kind &&
        gold == other.gold &&
        itemId == other.itemId &&
        label == other.label &&
        look == other.look &&
        revealed == other.revealed &&
        claimed == other.claimed;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([space, kind, gold, itemId, label, look, revealed, claimed]);
}

BoardPrizeStruct createBoardPrizeStruct({
  int? space,
  String? kind,
  int? gold,
  String? itemId,
  String? label,
  String? look,
  bool? revealed,
  bool? claimed,
}) =>
    BoardPrizeStruct(
      space: space,
      kind: kind,
      gold: gold,
      itemId: itemId,
      label: label,
      look: look,
      revealed: revealed,
      claimed: claimed,
    );
