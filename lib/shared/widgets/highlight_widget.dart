import 'dart:async';
import 'package:flutter/material.dart';
import '../models/highlight_model.dart';

class HighlightSliderWidget extends StatefulWidget {
  final List<HighlightModel> highlights;
  final Duration autoSlideDuration;

  const HighlightSliderWidget({
    super.key,
    required this.highlights,
    this.autoSlideDuration = const Duration(seconds: 3),
  });

  @override
  State<HighlightSliderWidget> createState() => _HighlightSliderWidgetState();
}

class _HighlightSliderWidgetState extends State<HighlightSliderWidget> {
  final PageController controller = PageController(
    viewportFraction: 0.9,
  );

  int currentIndex = 0;
  Timer? _timer;   

  @override
  void initState() {   
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(widget.autoSlideDuration, (_) {
      if (!mounted) return;

      final nextIndex = (currentIndex + 1) % widget.highlights.length;

      controller.animateToPage(
        nextIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();   
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemCount: widget.highlights.length,
        itemBuilder: (context, index) {
          final item = widget.highlights[index];

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                image: NetworkImage(item.image),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Text(
                item.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}