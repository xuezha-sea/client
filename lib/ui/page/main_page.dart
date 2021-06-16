import 'package:extended_image/extended_image.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import '../../logic/account/account_cubit.dart';
import '../container/chat_list_container.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text("We're BUG!"),
          leading: IconButton(
            icon:
                ExtendedImage.network((state as AccountLoaded).account.avatar),
            onPressed: () => print("avatar"),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.qr_code_outlined),
                onPressed: () => print('qr-code'))
          ],
        ),
        body: ChatListContainer()
            .parent(({required child}) => SafeArea(child: child)),
        // drawer: builder,
        // drawerEnableOpenDragGesture: true,
      );
    });
  }
}
