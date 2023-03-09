part of 'call_cubit.dart';

class CallState {
  List<CallModel>? listOfCall = [];
  bool isLoading;

  CallState({this.listOfCall, this.isLoading = false});

  CallState copyWith({List<CallModel>? listOfCall, bool? isLoading}) {
    return CallState(
        listOfCall: listOfCall ?? this.listOfCall,
        isLoading: isLoading ?? this.isLoading);
  }
}
