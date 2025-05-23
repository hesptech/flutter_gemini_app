import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';

final user = types.User(
  id: 'user-id-abc',
  firstName: 'fernando',
  lastName: 'herrera',
  imageUrl: 'https://picsum.photos/id/177/200/200',
);

final geminiUser = types.User(
  id: 'gemini-id',
  firstName: 'gemini',
  imageUrl: 'https://picsum.photos/id/179/200/200',
);

final messages = <types.Message>[
  types.TextMessage(author: user, id: Uuid().v4(), text: 'Hola mundo'),
  types.TextMessage(author: user, id: Uuid().v4(), text: 'Hola mundo 2'),
  types.TextMessage(author: geminiUser, id: Uuid().v4(), text: 'Hola mundo')
];

class BasicPromptScreen extends StatelessWidget {
  const BasicPromptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Prompt'),
      ),
      body: Chat(
        messages: messages,
        onSendPressed: (types.PartialText partialText) {
          print('mensaje: ${partialText.text}');
        },
        user: user,
        theme: DarkChatTheme(),
        showUserNames: true,
        typingIndicatorOptions: TypingIndicatorOptions(
            //typingUsers: [geminiUser],
            customTypingWidget: const Center(
          child: Text('Gemini esta pensando ... '),
        )),
      ),
    );
  }
}
