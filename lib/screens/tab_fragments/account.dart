import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwni_driver/utils/Dimentions.dart';

class AccountFragment extends StatefulWidget {
  const AccountFragment({Key? key}) : super(key: key);

  @override
  State<AccountFragment> createState() => _AccountFragmentState();
}

class _AccountFragmentState extends State<AccountFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Diamentions.screenHeight,
      width: Diamentions.screenWidth,
    );
  }
}
