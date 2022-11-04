import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late TextEditingController controller;
  OverlayEntry? entry;
  final layerLink = LayerLink();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        showOverlay();
      } else {
        hideOverlay();
      }
    });
  }

  void showOverlay() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    entry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 8),
          child: buildOverlay(),
        ),
      ),
    );
    overlay?.insert(entry!);
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        decoration: InputDecoration(
          label: const Text('Username'),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget buildOverlay() => Material(
        elevation: 8,
        child: Column(
          children: [
            ListTile(
              title: const Text('Gabriel Jesus'),
              subtitle: const Text('CF'),
              onTap: () {
                controller.text = 'Gabriel Jesus';
                hideOverlay();
                focusNode.unfocus();
              },
            ),
            ListTile(
              title: const Text('Bukayo Saka'),
              subtitle: const Text('RWF'),
              onTap: () {
                controller.text = 'Bukayo Saka';
                hideOverlay();
                focusNode.unfocus();
              },
            ),
            ListTile(
              title: const Text('John White'),
              subtitle: const Text('RB'),
              onTap: () {
                controller.text = 'John White';
                hideOverlay();
                focusNode.unfocus();
              },
            ),
          ],
        ),
      );
}
