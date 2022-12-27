import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:retrofit_test/model/base_response.dart';
import 'package:retrofit_test/view/custom_response_dialog.dart';

class BaseLayout extends StatefulWidget {
  final String title;
  final Future<BaseResponse>? future;
  final Widget body;

  const BaseLayout(
      {Key? key, required this.title, this.future, required this.body})
      : super(key: key);

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  Future<BaseResponse<dynamic>>? _future;

  @override
  void initState() {
    _future = widget.future;
    showApiError();
    super.initState();
  }

  showApiError() async {
    final result = await _future;

    if (result!.type != APIResultType.success) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        showAlertDialog(context);
      });
    }
  }

  showAlertDialog(BuildContext context) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const CustomResponseDialog(
            title: 'Error', descriptions: 'No data found');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: FutureBuilder<BaseResponse<dynamic>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final data = snapshot.data;
            if (data!.type == APIResultType.success) {
              return widget.body;
            } else {
              return Container();
            }
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
