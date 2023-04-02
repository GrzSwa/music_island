import 'package:ai_desktop_chat/components/existedChatButton.dart';
import 'package:ai_desktop_chat/components/newChatButton.dart';
import 'package:ai_desktop_chat/components/drawerOptions.dart';
import 'package:flutter/material.dart';

class Drawer extends StatelessWidget {
  const Drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const NewChatButton(),
            Expanded(
                child: ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return ExistedChatButton(
                          "[$index] Lorem ipsun deus vult hesus nawas itp");
                    }))),
            Container(
              alignment: Alignment.bottomCenter,
              child: DrawerOptions(),
            ),
          ],
        ));
  }
}
