import 'package:bajaj_hackrx_techwizzes/models/top_data/top_data_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:ternav_icons/ternav_icons.dart';

class TopData {
  List<TopDataModel> topData = [
    TopDataModel(
      name: 'Dow Jones',
      price: '35,906',
      icon: TernavIcons.light.arrow_up_2,
      perChnage: '+13.26',
      stops: const [
        FlSpot(0, 1),
        FlSpot(0.5, 0.5),
        FlSpot(1, 2),
        FlSpot(1.5, 2.5),
        FlSpot(2, 4),
        FlSpot(2.2, 4.8),
        FlSpot(2.5, 4.5),
        FlSpot(3, 1),
        FlSpot(4, 3),
        FlSpot(5, 8),
        FlSpot(6, 3),
        FlSpot(7, 5),
        FlSpot(8, 1),
        FlSpot(9, 3),
      ],
    ),
    TopDataModel(
      name: 'Nasdaq',
      price: '15,306',
      icon: TernavIcons.light.arrow_up_2,
      perChnage: '+20.2',
      stops: const [
        FlSpot(0, 1),
        FlSpot(0.5, 0.5),
        FlSpot(2, 4),
        FlSpot(2.5, 4.5),
        FlSpot(3, 1),
        FlSpot(4, 3),
        FlSpot(5, 8),
        FlSpot(6, 3),
        FlSpot(7, 5),
        FlSpot(8, 1),
        FlSpot(9, 3),
      ],
    ),
    TopDataModel(
      name: 'Usdinr',
      price: '70,095',
      icon: TernavIcons.light.arrow_up_2,
      perChnage: '+10.26',
      stops: const [
        FlSpot(0, 1),
        FlSpot(0.5, 0.5),
        FlSpot(2, 4),
        FlSpot(2.5, 4.5),
        FlSpot(3, 1),
        FlSpot(4, 4),
        FlSpot(5, 8),
        FlSpot(6, 3),
        FlSpot(7, 5),
      ],
    ),
    TopDataModel(
      name: 'Bowespa',
      price: '15,906',
      icon: TernavIcons.light.arrow_up_2,
      perChnage: '+10.26',
      stops: const [
        FlSpot(2, 4),
        FlSpot(2.5, 4.5),
        FlSpot(3, 1),
        FlSpot(4, 3),
        FlSpot(5, 8),
        FlSpot(6, 3),
        FlSpot(7, 5),
        FlSpot(7, 5),
        FlSpot(9, 3),
      ],
    ),
  ];
}
