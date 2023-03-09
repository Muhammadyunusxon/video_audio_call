import 'dart:math';

import 'package:flutter/material.dart';
import 'package:video_audio_call/pages/call_page.dart';
import 'package:video_audio_call/pages/home_page/widgets/app_helper.dart';

import '../../../model/call_model.dart';

class MyItemContainer extends StatelessWidget {
  final CallModel model;

  const MyItemContainer({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color:  Colors.primaries[Random().nextInt(Colors.primaries.length)],
                      borderRadius: BorderRadius.circular(12)),
                  child: const Text(
                    "30 min",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  model.time ?? "",
                  style: const TextStyle(color: Color(0xff6C6F82)),
                ),
              ],
            ),
            const SizedBox(height: 7),
            Text(
              model.name ?? "",
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) =>
                        VideoCallPage(
                            channelName: model.name ?? "test", username: "NotFound")));
                  },
                  child: Container(
                    width: 80,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: const Color(0xffEDF3F3),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(child: Text("Join")),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
