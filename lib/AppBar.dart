import 'package:flutter/material.dart';
import 'package:subq/SubPages.dart';

Widget MainAppBar(BuildContext context, {iconBtn}) {
  return Material(
    child: Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                iconBtn,
                Image.asset(
                  'assets/image/icon/logo.png',
                  width: 90.0,
                ),
                IconButton(
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
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 30,
                    )),
                Image.asset(
                  'assets/image/icon/logo.png',
                  width: 90.0,
                ),
                const SizedBox(
                  height: 10,
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
