import 'package:flutter/material.dart';
import 'package:letsgo/components/card_ranking.dart';
import 'package:letsgo/dto/score_card.dart';
import 'package:letsgo/enumerations/modality.dart';
import 'package:letsgo/enumerations/tab_view_ranking_enum.dart';
import 'package:letsgo/services/ranking_service.dart';

class TabViewRanking extends StatelessWidget {
  final RankingService service = RankingService();
  final TabViewRankingEnum tabView;

  TabViewRanking({super.key, required this.tabView});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ScoreCard>>(
      initialData: List.empty(),
      future: getRanking(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    SizedBox(height: 8),
                    Text(
                      'Carregando ranking...',
                      style: TextStyle(
                        fontFamily: "Vinque",
                      ),
                    )
                  ],
                ),
              );
              break;
            }
          case ConnectionState.done:
            {
              final List<ScoreCard>? scores = snapshot.data;

              if (scores != null && scores.isNotEmpty) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final ScoreCard score = scores[index];
                    return CardRanking(score: score);
                  },
                  itemCount: scores.length,
                );
              } else {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.inbox,
                        color: Colors.black45,
                        size: 48,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "Ainda não há dados para este ranking!",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black45,
                          fontFamily: "Vinque"
                        ),
                      ),
                    ],
                  ),
                );
              }
            }
          default:
            break;
        }

        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.black45,
                size: 48,
              ),
              Text(
                textAlign: TextAlign.center,
                "Falha no processamento",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black45,
                  fontFamily: "Vinque",
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<List<ScoreCard>> getRanking() async {
    await Future.delayed(Duration(seconds: 1));

    switch (tabView) {
      case TabViewRankingEnum.run:
        return await service.getRankingByModality(Modality.run);
      case TabViewRankingEnum.jump:
        return await service.getRankingByModality(Modality.jump);
      case TabViewRankingEnum.walk:
        return await service.getRankingByModality(Modality.walk);
      default:
        return await service.getGeneralRanking();
    }
  }
}
