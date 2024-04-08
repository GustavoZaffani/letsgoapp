import 'package:flutter/material.dart';
import 'package:letsgo/components/tab_view_ranking.dart';
import 'package:letsgo/enumerations/tab_view_ranking_enum.dart';

class Ranking extends StatelessWidget {
  const Ranking({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Ranking",
              style: TextStyle(
                fontFamily: "Vinque",
              ),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.add_chart_rounded),
                  text: "Geral",
                ),
                Tab(
                  icon: Icon(Icons.directions_walk),
                  text: "Caminhar",
                ),
                Tab(
                  icon: Icon(Icons.directions_run),
                  text: "Correr",
                ),
                Tab(
                  icon: Icon(Icons.emoji_people),
                  text: "Pular",
                )
              ],
            ),
            backgroundColor: Colors.black45,
          ),
          body: TabBarView(
            children: [
              Center(
                  child: TabViewRanking(
                tabView: TabViewRankingEnum.general,
              )),
              Center(
                  child: TabViewRanking(
                tabView: TabViewRankingEnum.walk,
              )),
              Center(
                  child: TabViewRanking(
                tabView: TabViewRankingEnum.run,
              )),
              Center(
                  child: TabViewRanking(
                tabView: TabViewRankingEnum.jump,
              )),
            ],
          )),
    );
  }
}
