import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'bottom_sheet.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(55.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        Builder(
          builder: (context) => Center(
            child: Container(
              height: 100,
              //width: 50,
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                onPressed: () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    // <-- SEE HERE
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30.0),
                    ),
                  ),
                  // enableDrag: false,
                  builder: (context) => DraggableScrollableSheet(
                    expand: false,
                    initialChildSize: 0.27,
                    maxChildSize: 0.9,
                    minChildSize: 0.19,
                    builder: (context, scrollController) =>
                        SingleChildScrollView(
                            controller: scrollController,
                            child: const BuildSheet()),
                  ),
                ),
                icon: const Icon(
                  Icons.account_circle,
                  size: 40,
                ),
              ),
            ),
          ),
        ),
      ],
      centerTitle: true,
      title: Text(
        DateFormat('dd/MM/yyyy').format(DateTime.now()),
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
      //leading: IconButton(
      // onPressed: (){},
      // icon: const Icon(Icons.menu),
      // ),
    );
  }
}
