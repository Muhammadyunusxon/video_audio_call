import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_audio_call/application/call_cubit/call_cubit.dart';

import '../../call_page.dart';

abstract class AppHelper {
  AppHelper._();

  static myDialog(
    BuildContext context,
    TextEditingController channelName,
    TextEditingController userName,
  ) {
    showDialog(
        context: context,
        builder: (con) {
          return AlertDialog(
            title: Column(
              children: [
                TextFormField(
                  controller: channelName,
                  decoration:
                      const InputDecoration(labelText: "Channel Name"),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: userName,
                  decoration: const InputDecoration(labelText: "Username"),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<CallCubit>().createChat(channelName.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => VideoCallPage(
                                  channelName: channelName.text,
                                  username: userName.text,
                                )));
                  },
                  child: const Text("Go"))
            ],
          );
        });
  }
}
