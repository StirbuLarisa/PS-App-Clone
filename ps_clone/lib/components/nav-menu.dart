import 'package:flutter/material.dart';
import 'curved_cliper.dart';

class NavMenu extends StatefulWidget {
  const NavMenu({Key? key}) : super(key: key);
  @override
  _NavMenuState createState() => _NavMenuState();
}

class _NavMenuState extends State<NavMenu> with SingleTickerProviderStateMixin{
  late TabController _tabController = TabController(length: 5, vsync: this);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
    SafeArea(
      child: Material(
          color: Colors.transparent,
          child:ClipPath(
            clipper: CurvedClipper(),
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 105.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black45.withOpacity(0.6) , Colors.black26.withOpacity(0.6)],
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(children: [
                  TabBar(
                    dividerHeight: 0,
                  indicatorSize: TabBarIndicatorSize.label,
                  controller: _tabController,
                  indicatorPadding: const EdgeInsets.symmetric(vertical: -20.0),
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white.withOpacity(0.5),
                  tabs: [
                    Transform.translate(offset: const Offset(0, 25),
                        child:const Tab(icon: Icon(Icons.gamepad_outlined))),
                    Transform.translate(offset: const Offset(0, 20),
                        child:const Tab(icon: Icon(Icons.explore))),
                    Transform.translate(offset: const Offset(0, 15),
                        child:const Tab(icon: Icon(Icons.shop))),
                    Transform.translate(offset: const Offset(0, 20),
                        child:const Tab(icon: Icon(Icons.videogame_asset))),
                    Transform.translate(offset: const Offset(0, 25),
                        child:const Tab(icon: Icon(Icons.search))),
                  ],
                ),
                  Padding(
                      padding: EdgeInsets.only(top: 15),
                      child:Material(
                          color: Colors.transparent,
                          child:ClipPath(
                            clipper: CurvedClipper(),
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 42.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.black45 .withOpacity(1) , Colors.black12.withOpacity(1)],
                                    begin: Alignment.center,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                child: TabBarView(
                                  controller: _tabController,
                                  children:const [
                                    Center(
                                        child:Text(
                                          'Play',
                                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )),
                                    Center(
                                        child:Text(
                                          'Explore',
                                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )),
                                    Center(
                                        child:Text(
                                          'PS Store',
                                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )),
                                    Center(
                                        child:Text(
                                          'Game Library',
                                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )),
                                    Center(
                                        child:Text(
                                          'Search',
                                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )),
                                  ],
                                )
                            ),
                          )
                      ))
                ],)
            ),
          )
      ),
    );
  }
}
