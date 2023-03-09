import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_audio_call/model/call_model.dart';

part 'call_state.dart';

class CallCubit extends Cubit<CallState> {
  CallCubit() : super(CallState());
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  createChat(String chatName) async {
    emit(state.copyWith(isLoading: true));

    await firestore.collection("calls").doc(chatName).set(
        CallModel(time: DateTime.now().toString(), name: chatName).toJson());
    emit(state.copyWith(isLoading: false));
  }

  getAllChat() async {
    emit(state.copyWith(isLoading: true));
    var doc = await firestore.collection("calls").get();
    List<CallModel> list = [];
    for (var element in doc.docs) {
      list.add(CallModel.fromJson(element.data()));
    }
    emit(state.copyWith(listOfCall: list, isLoading: false));
  }
}
