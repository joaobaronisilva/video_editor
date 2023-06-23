import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:video_editor/domain/bloc/controller.dart';

class VideoViewer extends StatelessWidget {
  const VideoViewer({super.key, required this.controller, this.child});

  final VideoEditorController controller;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.betterPlayerController.videoPlayerController!.value.isPlaying) {
          controller.betterPlayerController.pause();
        } else {
          controller.betterPlayerController.play();
        }
      },
      child: Center(
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: controller.betterPlayerController.videoPlayerController!.value.aspectRatio,
              child: BetterPlayer(controller: controller.betterPlayerController),
            ),
            if (child != null)
              AspectRatio(
                aspectRatio: controller.betterPlayerController.videoPlayerController!.value.aspectRatio,
                child: child,
              ),
          ],
        ),
      ),
    );
  }
}
