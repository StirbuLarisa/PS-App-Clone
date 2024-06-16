import 'package:flutter/material.dart';

class SlideDown extends StatefulWidget {
  const SlideDown({Key? key}) : super(key: key);

  @override
  _SlideDownState createState() => _SlideDownState();
}

class _SlideDownState extends State<SlideDown> {
  double containerHeight = 100.0;
  bool _isExpanded = false;
  bool _showChat = false;
  bool _showFriends = false;
  late double dragStart;

  void expandContainer() {
    setState(() {
      _isExpanded = !_isExpanded;
      containerHeight = _isExpanded ? MediaQuery.of(context).size.height -40 : 100.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: Colors.white, fontSize: 20);
    final textStyleSemiTransparent = TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 16);

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: GestureDetector(
        onVerticalDragStart: (details) {
          dragStart = details.globalPosition.dy;
        },
        onVerticalDragUpdate: (details) {
          final dy = details.globalPosition.dy;
          final delta = dy - dragStart;

          setState(() {
            containerHeight += delta;
            dragStart = dy;
          });
        },
        onVerticalDragEnd: (_) {
          if (containerHeight > 250) {
            expandContainer();
          } else {
            setState(() {
              containerHeight = 100.0;
            });
          }
        },
        onTap: expandContainer,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child:  AnimatedContainer(
            height: containerHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF17181A), Color(0xFF202123)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (_isExpanded && _showChat)
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 700.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0),
                            child: Text("Chats", style: textStyle),
                          ),
                          const Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              height: 30,
                              width: 30,
                              color: Colors.white,
                              child: const Icon(Icons.keyboard_voice, color: Colors.black, size: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0, right: 40.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Container(
                                height: 30,
                                width: 30,
                                color: Colors.white,
                                child: const Icon(Icons.mode_comment, color: Colors.black, size: 20),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                if (_isExpanded && _showFriends)
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 400.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 50.0),
                                  child: Text("Friends", style: textStyle),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0, right: 40.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      color: Colors.white,
                                      child: const Icon(Icons.person_add, color: Colors.black, size: 30),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 240.0, top: 40.0),
                              child: Text("Online", style: textStyle),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0, top: 50),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.asset("assets/avatar1.jpg", height: 75),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("Titi Paduraru", style: textStyle),
                                        Text("Horazion Zero Dawn", style: textStyleSemiTransparent)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0, top: 50),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.asset("assets/avatar2.jpg", height: 75),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("Ana Ionescu", style: textStyle),
                                        Text("FIFA 22", style: textStyleSemiTransparent)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.message, color: Colors.white, size: 30),
                        onPressed: () {
                          setState(() {
                            _showChat = true;
                            _showFriends = false;
                          });
                        },
                      ),
                      if (_isExpanded)
                        const Icon(Icons.keyboard_arrow_up, color: Colors.white, size: 30)
                      else
                        const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 30),
                      IconButton(
                        icon: const Icon(Icons.group, color: Colors.white, size: 30),
                        onPressed: () {
                          setState(() {
                            _showChat = false;
                            _showFriends = true;
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
