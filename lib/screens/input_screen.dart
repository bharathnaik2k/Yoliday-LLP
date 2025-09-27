import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset('assets/svg/input.svg'),
    );
  }
}
