import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:recyclify/models/chat.dart';
import 'package:recyclify/models/message.dart';
import 'package:recyclify/models/user_profile.dart';
import 'package:recyclify/services/auth_service.dart';
import 'package:recyclify/utils.dart';

class DatabaseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  late AuthService _authService;
  final GetIt _getIt = GetIt.instance;

  late CollectionReference<UserProfile> _userscollection;

  //CollectionReference? _userscollection;
  CollectionReference? _chatsCollection;

  DatabaseService() {
    _authService = _getIt.get<AuthService>();
    _setupCollectionReferences();
  }

  void _setupCollectionReferences() {
    _userscollection =
        _firebaseFirestore.collection('users').withConverter<UserProfile>(
          fromFirestore: (snapshots, _) => UserProfile.fromJson(
            snapshots.data()!,
          ),
          toFirestore: (UserProfile userProfile, _) => userProfile.toJson(),
        );
    _chatsCollection = _firebaseFirestore
        .collection('chats')
        .withConverter<Chat>(
          fromFirestore: (snapshots, _) => Chat.fromJson(snapshots.data()!),
          toFirestore: (chat, _) => chat.toJson());
  }

  Future<void> createUserProfile({required UserProfile userProfile}) async {
    await _userscollection.doc(userProfile.uid).set(userProfile);
  }

  Stream<QuerySnapshot<UserProfile>> getUSerProfiles() {
    return _userscollection
        ?.where("uid", isNotEqualTo: _authService.user!.uid)
        .snapshots() as Stream<QuerySnapshot<UserProfile>>;
  }

  Future<bool> checkChatExists(String uid1, String uid2) async {
    String chatID = generateChatID(uid1: uid1, uid2: uid2);
    final result = await _chatsCollection?.doc(chatID).get();
    if (result != null) {
      return result.exists;
    }
    return false;
  }

  Future<void> createNewChat(String uid1, String uid2) async {
    String chatID = generateChatID(uid1: uid1, uid2: uid2);
    final docRef = _chatsCollection!.doc(chatID);
    final chat = Chat(
      id: chatID,
      participants: [uid1, uid2],
      messages: [],
    );
    await docRef.set(chat);
  }

  Stream<DocumentSnapshot<Chat>> getChatData(String uid1, String uid2) {
    String chatID = generateChatID(uid1: uid1, uid2: uid2);
    return _chatsCollection?.doc(chatID).snapshots()
        as Stream<DocumentSnapshot<Chat>>;
  }

  Future<void> storeDeviceData({
    required String? selectedRAM,
    required String? selectedSSD,
    required String? selectedHDD,
    required String? selectedGPU,
    required String? selectedWarranty,
    required String? selectedOS,
    required String age,
    String? selectedworkingCondition,
    String? scratches,
    required String? batteryCondition, // Now marked as required
  }) async {
    CollectionReference deviceDataCollection = _firebaseFirestore.collection('device_data');

    Map<String, dynamic> deviceData = {
      'selectedRAM': selectedRAM ?? 'N/A',
      'selectedSSD': selectedSSD ?? 'N/A',
      'selectedHDD': selectedHDD ?? 'N/A',
      'selectedGPU': selectedGPU ?? 'N/A',
      'selectedWarranty': selectedWarranty ?? 'N/A',
      'selectedOS': selectedOS ?? 'N/A',
      'age': age,
      'selectedworkingCondition': selectedworkingCondition ?? 'N/A',
      'batteryCondition': batteryCondition ?? '', // Empty string instead of 'N/A'
    };

    await deviceDataCollection.add(deviceData);
  }

  sendChatMessage(String id, String id2, Message message) {}
}
