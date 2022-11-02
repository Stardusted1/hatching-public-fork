import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

extension SnackBarUtills on BuildContext {
  void showErrorBanner({
    required String title,
  }) {
    showCupertinoDialog(
      context: this,
      anchorPoint: Offset.zero,
      useRootNavigator: true,
      builder: (context) => CupertinoActionSheet(
        title: Text(title.split("\n").first),
        message: Text(title, textAlign: TextAlign.start),
        actions: [
          CupertinoDialogAction(
            child: Text("copy_share".tr()),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: title));
              Share.share(title, subject: "crashlog".tr());
            },
          ),
        ],
        cancelButton: CupertinoDialogAction(
          child: Text("close".tr()),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
