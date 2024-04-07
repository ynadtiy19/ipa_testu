import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyper_effects/hyper_effects.dart';

// 关键词标签

class TagLine extends StatefulWidget {
  const TagLine({super.key});

  @override
  State<TagLine> createState() => _TagLineState();
}

class _TagLineState extends State<TagLine> {
  List<String> tagLines = [
    'Connect',
    'Innovate',
    'Create',
    'Develop',
    'Grow',
    'Learn',
    'Share',
    'Create',
    'Design',
    'Build',
    'Code',
  ];
  int lastTagLine = 0;
  int tagLine = 0;

  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        Duration(milliseconds: (1800 * timeDilation).toInt()), (timer) {
      setState(() {
        lastTagLine = tagLine;
        tagLine = (tagLine + 1) % tagLines.length;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'We help you',
          style: GoogleFonts.robotoMono().copyWith(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 48,
          ),
          strutStyle: const StrutStyle(
            fontSize: 56,
            height: 1,
            forceStrutHeight: true,
            leading: 1,
          ),
        ),
        ShaderMask(
          shaderCallback: (rect) => LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white.withOpacity(0),
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white.withOpacity(0),
              // Colors.white,
            ],
          ).createShader(rect),
          child: ShaderMask(
            shaderCallback: (rect) => const LinearGradient(
              colors: [
                Color(0xFFBFF098),
                Color(0xFF6FD6FF)
                // Colors.white,
              ],
            ).createShader(rect),
            child: Text(
              tagLines[lastTagLine],
              style: GoogleFonts.gloriaHallelujah().copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 56,
              ),
            )
                .roll(
                  tagLines[tagLine],
                  symbolDistanceMultiplier: 2,
                  tapeSlideDirection: TapeSlideDirection.down,
                  tapeCurve: Curves.easeInOutCubic,
                  widthCurve: Curves.easeOutCubic,
                  widthDuration: const Duration(milliseconds: 1000),
                  padding: const EdgeInsets.only(left: 16),
                )
                .animate(
                  trigger: tagLine,
                  duration: const Duration(milliseconds: 1000),
                ),
          ),
        ),
      ],
    );
  }
}
