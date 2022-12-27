import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomResponseDialog extends StatefulWidget {
  final String title, descriptions;
  final Image? img;

  const CustomResponseDialog({
    Key? key,
    required this.title,
    required this.descriptions,
    this.img,
  }) : super(key: key);

  @override
  _CustomResponseDialogState createState() => _CustomResponseDialogState();
}

class _CustomResponseDialogState extends State<CustomResponseDialog> {
  final double _radius = 50.0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              top: _radius + 10, bottom: 10, left: 16, right: 16),
          margin: EdgeInsets.only(top: _radius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.descriptions,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 22,
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'))),
            ],
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 50,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(_radius)),
                child: Icon(
                  Icons.warning,
                  size: _radius,
                )),
          ),
        ),
      ],
    );
  }
}
