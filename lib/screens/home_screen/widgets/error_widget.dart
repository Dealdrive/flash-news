import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  final String? errorMessage;

  const ErrorWidget({
    Key? key,
    this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.red.shade800,
              radius: 80,
              child: CircleAvatar(
                backgroundColor: Colors.red.shade600,
                radius: 65,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 50,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Error Occurred! \n${errorMessage ?? ''}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}