import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:zobawm_vendor_app/components/my_colors.dart';

showLoader(BuildContext context) {
  return Loader.show(context,
      overlayColor: Colors.transparent,
      progressIndicator: Platform.isIOS
          ? const CupertinoActivityIndicator(
              color: Colors.black,
              radius: 12,
            )
          : CircularProgressIndicator(
              color: MyColors.blue,
            ),
      themeData: Theme.of(context).copyWith(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.green)));
}

hideLoader() {
  return Loader.hide();
}
