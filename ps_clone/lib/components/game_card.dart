import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final String imageUrl;
  final String gameName;
  final String hoursPlayed;
  final Map<String, int> trophies;

  const GameCard({
    Key? key,
    required this.imageUrl,
    required this.gameName,
    required this.hoursPlayed,
    required this.trophies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF17181A), Color(0xFF202123)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow:  [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 7.0,
            spreadRadius: 4,
            offset: const Offset(2.0, 2.0),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(imageUrl, width: 100),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(gameName,
                              style:
                                  const TextStyle(fontSize: 20, color: Colors.white)),
                          const Text('Played',
                              style:
                                  TextStyle(fontSize: 11, color: Colors.grey)),
                          Row(
                            children: [
                              const Icon(Icons.access_time,
                                  size: 16, color: Colors.white),
                              Text(' $hoursPlayed',
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey[800],
          ),
          Row(
            children: [
              const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: ImageIcon(AssetImage("assets/troph.png"),
                        color: Colors.white, size: 28),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Trophies', style: TextStyle(color: Colors.white)),
                    Row(children: [
                      Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 3.0),
                                child:
                                    Image.asset("assets/plat.png", width: 12.5),
                              ),
                              Text('${trophies['plat'] ?? 0}',
                                  style: const TextStyle(color: Colors.white)),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 3.0),
                                child:
                                    Image.asset("assets/gold.png", width: 15),
                              ),
                              Text('${trophies['gold'] ?? 0}',
                                  style: const TextStyle(color: Colors.white)),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 3.0),
                                child:
                                    Image.asset("assets/silver.png", width: 14),
                              ),
                              Text('${trophies['silver'] ?? 0}',
                                  style: const TextStyle(color: Colors.white)),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 3.0),
                                child:
                                    Image.asset("assets/bronze.png", width: 15),
                              ),
                              Text('${trophies['bronze'] ?? 0}',
                                  style: const TextStyle(color: Colors.white)),
                            ],
                          )),
                    ]),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(padding: const EdgeInsets.only(left: 100),

                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        foregroundColor: Colors.transparent,
                        elevation: 0,
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(Icons.chevron_right_sharp,
                          color: Colors.white, size: 25),
                    )
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
