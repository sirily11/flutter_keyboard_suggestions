import 'package:flutter/material.dart';

class Suggestion<T> {
  final String title;
  final T value;
  Suggestion({this.title, this.value});
}

typedef OnTap<T>(T value);

class KeyboardSuggestionsView<T> extends StatelessWidget {
  final List<Suggestion<T>> suggestions;
  final OnTap<T> onTap;
  final Color backgroundColor;
  final TextStyle textStyle;
  final int numberResultsPerScreen;

  KeyboardSuggestionsView({
    @required this.suggestions,
    this.onTap,
    this.backgroundColor,
    this.textStyle,
    this.numberResultsPerScreen = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: backgroundColor,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: suggestions.length,
        separatorBuilder: (c, i) => VerticalDivider(),
        itemBuilder: (c, i) {
          return Container(
            width: suggestions.length > numberResultsPerScreen
                ? (MediaQuery.of(context).size.width - 100) /
                    numberResultsPerScreen
                : (MediaQuery.of(context).size.width - 30) /
                    numberResultsPerScreen,
            child: FlatButton(
              onPressed: () {
                if (onTap != null) {
                  onTap(suggestions[i].value);
                }
              },
              child: Center(
                child: Text(
                  suggestions[i].title,
                  style: textStyle,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
