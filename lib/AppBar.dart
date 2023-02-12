import 'package:flutter/material.dart';
import 'package:subq/SubPages.dart';
import 'package:subq/constants.dart';

Widget MainAppBar(BuildContext context, {iconBtn}) {
  return Material(
    child: Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            padding: const EdgeInsets.all(5),
            height: screenHeight(context) * 0.07,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                iconBtn,
                Image.asset(
                  'assets/image/icon/logo.png',
                  fit: BoxFit.fitHeight,
                  // width: 90.0,
                ),
                IconButton(
                  padding: const EdgeInsets.only(bottom: 5),
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TermsPage()));
                    },
                    icon: const Icon(
                      Icons.info_outline,
                      color: Colors.black,
                      size: 30,
                    ))
              ],
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Divider(color: Colors.black, thickness: 2.0))
        ],
      ),
    ),
  );
}

Widget TestAppBar(BuildContext context) {
  return Material(
    child: Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            padding: const EdgeInsets.all(5),
            height: screenHeight(context) * 0.07,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                backIcon(context),
                Image.asset(
                  'assets/image/icon/logo.png',
                  fit: BoxFit.fitHeight,
                ),
                const SizedBox(
                  width: 35,
                )
              ],
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Divider(color: Colors.black, thickness: 2.0))
        ],
      ),
    ),
  );
}
