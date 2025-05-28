import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_gemini_app/presentation/providers/chat/basic_chat.dart';
import 'package:flutter_gemini_app/presentation/providers/chat/is_gemini_writing.dart';
import 'package:flutter_gemini_app/presentation/providers/users/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:uuid/uuid.dart';

/* final user = types.User(
  id: 'user-id-abc',
  firstName: 'fernando',
  lastName: 'herrera',
  imageUrl: 'https://picsum.photos/id/177/200/200',
); */

/* final geminiUser = types.User(
  id: 'gemini-id',
  firstName: 'gemini',
  imageUrl: 'https://picsum.photos/id/179/200/200',
); */

final messages = <types.Message>[
  //types.TextMessage(author: user, id: Uuid().v4(), text: 'Hola mundo'),
  //types.TextMessage(author: user, id: Uuid().v4(), text: 'Hola mundo 2'),
  //types.TextMessage(author: geminiUser, id: Uuid().v4(), text: 'Hola mundo')
];

class BasicPromptScreen extends ConsumerWidget {
  const BasicPromptScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final geminiUser = ref.watch(geminiUserProvider);
    final user = ref.watch(userProvider);
    final isGeminiWriting = ref.watch(isGeminiWritingProvider);
    final chatMessages = ref.watch(basicChatProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Prompt'),
      ),
      body: Chat(
        messages: chatMessages
        /* [
          //types.TextMessage(author: geminiUser, id: 'asdf', text: 'Hola mundo')
          types.TextMessage(author: user, id: 'asdf3', text: 'Hola mundo'),
          types.TextMessage(author: user, id: 'asdf2', text: 'Hola mundo'),
          types.TextMessage(author: user, id: 'asdf1', text: 'Hola mundo'),
        ] */,
        onSendPressed: (types.PartialText partialText) {
          final basicChatNotifier = ref.read(basicChatProvider.notifier);
          basicChatNotifier.addMessage(
            partialText: partialText,
            user: user,
          );
        },
        user: user,
        theme: DarkChatTheme(),
        showUserNames: true,
        typingIndicatorOptions: TypingIndicatorOptions(
            typingUsers: isGeminiWriting
                ? [geminiUser]
                : [],
            customTypingWidget: const Center(
          child: Text('Gemini esta pensando ... '),
        )),
      ),
    );
  }
}
