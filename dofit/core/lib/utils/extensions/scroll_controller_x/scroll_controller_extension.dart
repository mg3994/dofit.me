import 'package:flutter/material.dart';

/// Extension on [ScrollController] to add a method for
/// smoothly scrolling to the bottom.
extension ScrollControllerExtension on ScrollController {
  /// Animates the scroll view to the bottom after the current frame.
  void scrollToBottomAfterFrame() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (hasClients) {
        animateTo(
          position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }
   /// Animates the scroll view to the top after the current frame.
  void scrollToTopAfterFrame() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (hasClients) {
        animateTo(
          position.minScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }
  ///
   /// Animates the scroll view to the specific Offset after the current frame.
  void scrollToOffsetAfterFrame(double offset) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (hasClients) {
        animateTo(
          offset,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }
}