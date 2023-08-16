import 'package:flutter/material.dart';
import 'package:renttt/screens/styles.dart';

class RatingButton extends StatefulWidget {
  @override
  _RatingButtonState createState() => _RatingButtonState();
}

class _RatingButtonState extends State<RatingButton> {
  int _rating = 0;

  void _showRatingDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rate the Product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 400,
                child: Row(
                  children: <Widget>[
                    for (int i = 1; i <= 5; i++)
                      IconButton(
                        icon: Icon(
                          i <= _rating ? Icons.star : Icons.star_border,
                          size: 30,
                          // Decrease the size of the stars
                        ),
                        onPressed: () {
                          setState(() {
                            _rating = i;
                          });
                          Navigator.of(context).pop();
                        },
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _showRatingDialog,
      child: Text('Rate'),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        primary: primaryColor, // Set the button color to black
      ),
    );
  }
}
