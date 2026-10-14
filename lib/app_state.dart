import 'package:flutter/material.dart'
    show ChangeNotifier, Color, Colors, VoidCallback;
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_family')) {
        try {
          final serializedData = prefs.getString('ff_family') ?? '{}';
          _family =
              FamilyStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _currentMemberId =
          prefs.getString('ff_currentMemberId') ?? _currentMemberId;
    });
    _safeInit(() {
      _members = prefs
              .getStringList('ff_members')
              ?.map((x) {
                try {
                  return MemberStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _members;
    });
    _safeInit(() {
      _quests = prefs
              .getStringList('ff_quests')
              ?.map((x) {
                try {
                  return QuestStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _quests;
    });
    _safeInit(() {
      _submissions = prefs
              .getStringList('ff_submissions')
              ?.map((x) {
                try {
                  return SubmissionStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _submissions;
    });
    _safeInit(() {
      _transactions = prefs
              .getStringList('ff_transactions')
              ?.map((x) {
                try {
                  return BuckTransactionStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _transactions;
    });
    _safeInit(() {
      _rewards = prefs
              .getStringList('ff_rewards')
              ?.map((x) {
                try {
                  return RewardStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _rewards;
    });
    _safeInit(() {
      _redemptions = prefs
              .getStringList('ff_redemptions')
              ?.map((x) {
                try {
                  return RedemptionStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _redemptions;
    });
    _safeInit(() {
      _avatarItems = prefs
              .getStringList('ff_avatarItems')
              ?.map((x) {
                try {
                  return AvatarItemStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _avatarItems;
    });
    _safeInit(() {
      _wardrobe = prefs
              .getStringList('ff_wardrobe')
              ?.map((x) {
                try {
                  return WardrobeEntryStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _wardrobe;
    });
    _safeInit(() {
      _boardClaims = prefs
              .getStringList('ff_boardClaims')
              ?.map((x) {
                try {
                  return BoardClaimStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _boardClaims;
    });
    _safeInit(() {
      _boardSurprisesOn =
          prefs.getBool('ff_boardSurprisesOn') ?? _boardSurprisesOn;
    });
    _safeInit(() {
      _celebrations = prefs.getString('ff_celebrations') ?? _celebrations;
    });
    _safeInit(() {
      _boardThemes = prefs.getString('ff_boardThemes') ?? _boardThemes;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  /// Family record.
  FamilyStruct _family = FamilyStruct();
  FamilyStruct get family => _family;
  set family(FamilyStruct value) {
    _family = value;
    prefs.setString('ff_family', value.serialize());
  }

  void updateFamilyStruct(Function(FamilyStruct) updateFn) {
    updateFn(_family);
    prefs.setString('ff_family', _family.serialize());
  }

  /// Active profile.
  String _currentMemberId = '';
  String get currentMemberId => _currentMemberId;
  set currentMemberId(String value) {
    _currentMemberId = value;
    prefs.setString('ff_currentMemberId', value);
  }

  /// Parent and kid profiles.
  List<MemberStruct> _members = [];
  List<MemberStruct> get members => _members;
  set members(List<MemberStruct> value) {
    _members = value;
    prefs.setStringList('ff_members', value.map((x) => x.serialize()).toList());
  }

  void addToMembers(MemberStruct value) {
    members.add(value);
    prefs.setStringList(
        'ff_members', _members.map((x) => x.serialize()).toList());
  }

  void removeFromMembers(MemberStruct value) {
    members.remove(value);
    prefs.setStringList(
        'ff_members', _members.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromMembers(int index) {
    members.removeAt(index);
    prefs.setStringList(
        'ff_members', _members.map((x) => x.serialize()).toList());
  }

  void updateMembersAtIndex(
    int index,
    MemberStruct Function(MemberStruct) updateFn,
  ) {
    members[index] = updateFn(_members[index]);
    prefs.setStringList(
        'ff_members', _members.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInMembers(int index, MemberStruct value) {
    members.insert(index, value);
    prefs.setStringList(
        'ff_members', _members.map((x) => x.serialize()).toList());
  }

  /// All quests, templates, and recurring instances.
  List<QuestStruct> _quests = [];
  List<QuestStruct> get quests => _quests;
  set quests(List<QuestStruct> value) {
    _quests = value;
    prefs.setStringList('ff_quests', value.map((x) => x.serialize()).toList());
  }

  void addToQuests(QuestStruct value) {
    quests.add(value);
    prefs.setStringList(
        'ff_quests', _quests.map((x) => x.serialize()).toList());
  }

  void removeFromQuests(QuestStruct value) {
    quests.remove(value);
    prefs.setStringList(
        'ff_quests', _quests.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromQuests(int index) {
    quests.removeAt(index);
    prefs.setStringList(
        'ff_quests', _quests.map((x) => x.serialize()).toList());
  }

  void updateQuestsAtIndex(
    int index,
    QuestStruct Function(QuestStruct) updateFn,
  ) {
    quests[index] = updateFn(_quests[index]);
    prefs.setStringList(
        'ff_quests', _quests.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInQuests(int index, QuestStruct value) {
    quests.insert(index, value);
    prefs.setStringList(
        'ff_quests', _quests.map((x) => x.serialize()).toList());
  }

  /// Quest submissions audit trail.
  List<SubmissionStruct> _submissions = [];
  List<SubmissionStruct> get submissions => _submissions;
  set submissions(List<SubmissionStruct> value) {
    _submissions = value;
    prefs.setStringList(
        'ff_submissions', value.map((x) => x.serialize()).toList());
  }

  void addToSubmissions(SubmissionStruct value) {
    submissions.add(value);
    prefs.setStringList(
        'ff_submissions', _submissions.map((x) => x.serialize()).toList());
  }

  void removeFromSubmissions(SubmissionStruct value) {
    submissions.remove(value);
    prefs.setStringList(
        'ff_submissions', _submissions.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromSubmissions(int index) {
    submissions.removeAt(index);
    prefs.setStringList(
        'ff_submissions', _submissions.map((x) => x.serialize()).toList());
  }

  void updateSubmissionsAtIndex(
    int index,
    SubmissionStruct Function(SubmissionStruct) updateFn,
  ) {
    submissions[index] = updateFn(_submissions[index]);
    prefs.setStringList(
        'ff_submissions', _submissions.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInSubmissions(int index, SubmissionStruct value) {
    submissions.insert(index, value);
    prefs.setStringList(
        'ff_submissions', _submissions.map((x) => x.serialize()).toList());
  }

  /// Parent Bucks ledger.
  List<BuckTransactionStruct> _transactions = [];
  List<BuckTransactionStruct> get transactions => _transactions;
  set transactions(List<BuckTransactionStruct> value) {
    _transactions = value;
    prefs.setStringList(
        'ff_transactions', value.map((x) => x.serialize()).toList());
  }

  void addToTransactions(BuckTransactionStruct value) {
    transactions.add(value);
    prefs.setStringList(
        'ff_transactions', _transactions.map((x) => x.serialize()).toList());
  }

  void removeFromTransactions(BuckTransactionStruct value) {
    transactions.remove(value);
    prefs.setStringList(
        'ff_transactions', _transactions.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTransactions(int index) {
    transactions.removeAt(index);
    prefs.setStringList(
        'ff_transactions', _transactions.map((x) => x.serialize()).toList());
  }

  void updateTransactionsAtIndex(
    int index,
    BuckTransactionStruct Function(BuckTransactionStruct) updateFn,
  ) {
    transactions[index] = updateFn(_transactions[index]);
    prefs.setStringList(
        'ff_transactions', _transactions.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTransactions(int index, BuckTransactionStruct value) {
    transactions.insert(index, value);
    prefs.setStringList(
        'ff_transactions', _transactions.map((x) => x.serialize()).toList());
  }

  /// Rewards catalog.
  List<RewardStruct> _rewards = [];
  List<RewardStruct> get rewards => _rewards;
  set rewards(List<RewardStruct> value) {
    _rewards = value;
    prefs.setStringList('ff_rewards', value.map((x) => x.serialize()).toList());
  }

  void addToRewards(RewardStruct value) {
    rewards.add(value);
    prefs.setStringList(
        'ff_rewards', _rewards.map((x) => x.serialize()).toList());
  }

  void removeFromRewards(RewardStruct value) {
    rewards.remove(value);
    prefs.setStringList(
        'ff_rewards', _rewards.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromRewards(int index) {
    rewards.removeAt(index);
    prefs.setStringList(
        'ff_rewards', _rewards.map((x) => x.serialize()).toList());
  }

  void updateRewardsAtIndex(
    int index,
    RewardStruct Function(RewardStruct) updateFn,
  ) {
    rewards[index] = updateFn(_rewards[index]);
    prefs.setStringList(
        'ff_rewards', _rewards.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInRewards(int index, RewardStruct value) {
    rewards.insert(index, value);
    prefs.setStringList(
        'ff_rewards', _rewards.map((x) => x.serialize()).toList());
  }

  /// Reward and avatar purchase requests.
  List<RedemptionStruct> _redemptions = [];
  List<RedemptionStruct> get redemptions => _redemptions;
  set redemptions(List<RedemptionStruct> value) {
    _redemptions = value;
    prefs.setStringList(
        'ff_redemptions', value.map((x) => x.serialize()).toList());
  }

  void addToRedemptions(RedemptionStruct value) {
    redemptions.add(value);
    prefs.setStringList(
        'ff_redemptions', _redemptions.map((x) => x.serialize()).toList());
  }

  void removeFromRedemptions(RedemptionStruct value) {
    redemptions.remove(value);
    prefs.setStringList(
        'ff_redemptions', _redemptions.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromRedemptions(int index) {
    redemptions.removeAt(index);
    prefs.setStringList(
        'ff_redemptions', _redemptions.map((x) => x.serialize()).toList());
  }

  void updateRedemptionsAtIndex(
    int index,
    RedemptionStruct Function(RedemptionStruct) updateFn,
  ) {
    redemptions[index] = updateFn(_redemptions[index]);
    prefs.setStringList(
        'ff_redemptions', _redemptions.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInRedemptions(int index, RedemptionStruct value) {
    redemptions.insert(index, value);
    prefs.setStringList(
        'ff_redemptions', _redemptions.map((x) => x.serialize()).toList());
  }

  /// Avatar catalog.
  List<AvatarItemStruct> _avatarItems = [];
  List<AvatarItemStruct> get avatarItems => _avatarItems;
  set avatarItems(List<AvatarItemStruct> value) {
    _avatarItems = value;
    prefs.setStringList(
        'ff_avatarItems', value.map((x) => x.serialize()).toList());
  }

  void addToAvatarItems(AvatarItemStruct value) {
    avatarItems.add(value);
    prefs.setStringList(
        'ff_avatarItems', _avatarItems.map((x) => x.serialize()).toList());
  }

  void removeFromAvatarItems(AvatarItemStruct value) {
    avatarItems.remove(value);
    prefs.setStringList(
        'ff_avatarItems', _avatarItems.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromAvatarItems(int index) {
    avatarItems.removeAt(index);
    prefs.setStringList(
        'ff_avatarItems', _avatarItems.map((x) => x.serialize()).toList());
  }

  void updateAvatarItemsAtIndex(
    int index,
    AvatarItemStruct Function(AvatarItemStruct) updateFn,
  ) {
    avatarItems[index] = updateFn(_avatarItems[index]);
    prefs.setStringList(
        'ff_avatarItems', _avatarItems.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInAvatarItems(int index, AvatarItemStruct value) {
    avatarItems.insert(index, value);
    prefs.setStringList(
        'ff_avatarItems', _avatarItems.map((x) => x.serialize()).toList());
  }

  /// Owned avatar items per kid.
  List<WardrobeEntryStruct> _wardrobe = [];
  List<WardrobeEntryStruct> get wardrobe => _wardrobe;
  set wardrobe(List<WardrobeEntryStruct> value) {
    _wardrobe = value;
    prefs.setStringList(
        'ff_wardrobe', value.map((x) => x.serialize()).toList());
  }

  void addToWardrobe(WardrobeEntryStruct value) {
    wardrobe.add(value);
    prefs.setStringList(
        'ff_wardrobe', _wardrobe.map((x) => x.serialize()).toList());
  }

  void removeFromWardrobe(WardrobeEntryStruct value) {
    wardrobe.remove(value);
    prefs.setStringList(
        'ff_wardrobe', _wardrobe.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromWardrobe(int index) {
    wardrobe.removeAt(index);
    prefs.setStringList(
        'ff_wardrobe', _wardrobe.map((x) => x.serialize()).toList());
  }

  void updateWardrobeAtIndex(
    int index,
    WardrobeEntryStruct Function(WardrobeEntryStruct) updateFn,
  ) {
    wardrobe[index] = updateFn(_wardrobe[index]);
    prefs.setStringList(
        'ff_wardrobe', _wardrobe.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInWardrobe(int index, WardrobeEntryStruct value) {
    wardrobe.insert(index, value);
    prefs.setStringList(
        'ff_wardrobe', _wardrobe.map((x) => x.serialize()).toList());
  }

  /// Claimed Reward Road surprises.
  List<BoardClaimStruct> _boardClaims = [];
  List<BoardClaimStruct> get boardClaims => _boardClaims;
  set boardClaims(List<BoardClaimStruct> value) {
    _boardClaims = value;
    prefs.setStringList(
        'ff_boardClaims', value.map((x) => x.serialize()).toList());
  }

  void addToBoardClaims(BoardClaimStruct value) {
    boardClaims.add(value);
    prefs.setStringList(
        'ff_boardClaims', _boardClaims.map((x) => x.serialize()).toList());
  }

  void removeFromBoardClaims(BoardClaimStruct value) {
    boardClaims.remove(value);
    prefs.setStringList(
        'ff_boardClaims', _boardClaims.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromBoardClaims(int index) {
    boardClaims.removeAt(index);
    prefs.setStringList(
        'ff_boardClaims', _boardClaims.map((x) => x.serialize()).toList());
  }

  void updateBoardClaimsAtIndex(
    int index,
    BoardClaimStruct Function(BoardClaimStruct) updateFn,
  ) {
    boardClaims[index] = updateFn(_boardClaims[index]);
    prefs.setStringList(
        'ff_boardClaims', _boardClaims.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInBoardClaims(int index, BoardClaimStruct value) {
    boardClaims.insert(index, value);
    prefs.setStringList(
        'ff_boardClaims', _boardClaims.map((x) => x.serialize()).toList());
  }

  /// Parents can switch Reward Road mystery chests on/off.
  bool _boardSurprisesOn = true;
  bool get boardSurprisesOn => _boardSurprisesOn;
  set boardSurprisesOn(bool value) {
    _boardSurprisesOn = value;
    prefs.setBool('ff_boardSurprisesOn', value);
  }

  /// Per-hero count of treasures already celebrated, "kidId=count;...".
  String _celebrations = '';
  String get celebrations => _celebrations;
  set celebrations(String value) {
    _celebrations = value;
    prefs.setString('ff_celebrations', value);
  }

  /// Reward Road board theme per reward, "rewardId=scene;...".
  String _boardThemes = '';
  String get boardThemes => _boardThemes;
  set boardThemes(String value) {
    _boardThemes = value;
    prefs.setString('ff_boardThemes', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
