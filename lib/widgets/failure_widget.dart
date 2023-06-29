import 'package:flutter/material.dart';
import 'package:portfolio/styles/dimensions.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget(
      {Key? key, required this.errorMessage, required this.onPressed})
      : super(key: key);

  final String errorMessage;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              errorMessage,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            sizedBoxH16,
            ElevatedButton(
              onPressed: onPressed,
              child: const Text('Retry'),
            )
          ],
        ),
      ),
    );
  }
}
