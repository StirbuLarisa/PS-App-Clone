
import 'package:flutter/material.dart';

class Account extends StatelessWidget {

  final String imageUrl;
  final String name;

  const Account({
    Key? key,
    required this.imageUrl,
    required this.name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.only(left: 20.0, right: 16.0, top: 20.0, bottom: 15.0),
        child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   CircleAvatar(
                     backgroundImage: AssetImage(imageUrl),
                   ),
                   const Padding(
                       padding: EdgeInsets.only(left: 15.0)
                   ),
                   Text(name, style: TextStyle(color: Colors.white)),
                 ],
               ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: 50,
                        ),
                        child:
                        Image.asset("assets/level.png", width: 50, height: 50),
                    ),
                     ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 50,
                      ),
                      child: const Icon(Icons.notifications, color: Colors.white),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 50,
                      ),
                      child: const Icon(Icons.settings, color: Colors.white),
                    ),
                  ],
               )
             ],
            ),
      );
  }
}

