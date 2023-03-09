import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_audio_call/model/call_model.dart';
import 'package:video_audio_call/pages/home_page/widgets/app_helper.dart';
import 'package:video_audio_call/pages/home_page/widgets/my_app_bar.dart';
import 'package:video_audio_call/pages/home_page/widgets/my_item_container.dart';

import '../../application/call_cubit/call_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController channelName = TextEditingController();
  final TextEditingController userName = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CallCubit>().getAllChat();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDF3F3),
      body: SafeArea(
          child: Column(
        children: [
          MyAppBar(
            onAdd: () {
              AppHelper.myDialog(context, channelName, userName);
            },
          ),
          Expanded(child: BlocBuilder<CallCubit, CallState>(
            builder: (context, state) {
              return state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: state.listOfCall?.length,
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      itemBuilder: (context, index) {
                        return MyItemContainer(
                          model: CallModel(
                            time: state.listOfCall?[index].time,
                            name: state.listOfCall?[index].name,
                          ),
                        );
                      });
            },
          )),
        ],
      )),
    );
  }
}
