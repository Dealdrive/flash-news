import 'package:flutter/material.dart';
import 'package:news_app/utils/build_context_ext.dart';


class NoResultWidget extends StatelessWidget {
  const NoResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: Theme.of(context).primaryColor,
            size: 80,
          ),
          const SizedBox(height: 8.0),
          Text(
            context.localizations.no_result_message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
