import 'package:extended_image/extended_image.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import '../../logic/account/account_cubit.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final builder = BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        if (state is AccountLoaded) {
          return Hero(
              tag: "avatar",
              child: ExtendedImage.network(
                state.account.avatar,
                cache: true,
                borderRadius: BorderRadius.all(Radius.circular(96)),
              ));
        }
        return Text("none");
      },
    );

    final bodyBuilder = BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        if (state is AccountLoaded) {

          print(ExtendedNetworkImageProvider(
              "https://api.multiavatar.com/1.png")
              .imageCacheName);

          return Flex(
            direction: Axis.vertical,
            children: [
              Chat(
                disableImageGallery: true,
                isAttachmentUploading: true,
                showUserNames: true,
                messages: [
                  types.TextMessage(
                      author: types.User(
                          id: '1',
                          imageUrl: ExtendedNetworkImageProvider(
                                  "https://api.multiavatar.com/1.png")
                              .imageCacheName),
                      id: '1',
                      previewData: types.PreviewData(title: "title"),
                      createdAt:
                          (DateTime.now().microsecondsSinceEpoch - 1000 * 60) ~/
                              1000,
                      text: "content"),
                  types.TextMessage(
                      author: types.User(
                          id: '2',
                          imageUrl: ExtendedNetworkImageProvider(
                                  "https://api.multiavatar.com/1.png")
                              .imageCacheName),
                      id: '1',
                      previewData: types.PreviewData(title: "title"),
                      createdAt:
                          (DateTime.now().microsecondsSinceEpoch - 1000 * 50) ~/
                              1000,
                      text: "content"),
                  types.TextMessage(
                      author: types.User(
                          id: '3',
                          imageUrl: ExtendedNetworkImageProvider(
                                  "https://api.multiavatar.com/1.png")
                              .imageCacheName),
                      id: '1',
                      previewData: types.PreviewData(title: "title"),
                      createdAt:
                          (DateTime.now().microsecondsSinceEpoch - 1000 * 40) ~/
                              1000,
                      text: "content"),
                  types.TextMessage(
                      author: types.User(
                          id: '1',
                          imageUrl: ExtendedNetworkImageProvider(
                                  "https://api.multiavatar.com/1.png")
                              .imageCacheName),
                      id: '1',
                      previewData: types.PreviewData(title: "title"),
                      createdAt:
                          (DateTime.now().microsecondsSinceEpoch - 1000 * 30) ~/
                              1000,
                      text: "content"),
                  types.TextMessage(
                      author: types.User(
                          id: '1',
                          imageUrl: ExtendedNetworkImageProvider(
                                  "https://api.multiavatar.com/1.png")
                              .imageCacheName),
                      id: '1',
                      previewData: types.PreviewData(title: "title"),
                      createdAt:
                          (DateTime.now().microsecondsSinceEpoch - 1000 * 20) ~/
                              1000,
                      text: "content"),
                  types.TextMessage(
                      author: types.User(
                          id: '1',
                          imageUrl: ExtendedNetworkImageProvider(
                                  "https://api.multiavatar.com/1.png")
                              .imageCacheName),
                      id: '1',
                      previewData: types.PreviewData(title: "title"),
                      createdAt:
                          (DateTime.now().microsecondsSinceEpoch - 1000 * 10) ~/
                              1000,
                      text: "content")
                ],
                onSendPressed: (PartialText) {
                  print(PartialText);
                },
                user: types.User(id: '1'),
              ).expanded()
            ],
          );
        }
        return Text("none");
      },
    );

    return Scaffold(
      body: bodyBuilder.parent(({required child}) => SafeArea(child: child)),
      drawer: builder,
      drawerEnableOpenDragGesture: true,
    );
  }
}
