import 'package:flutter/material.dart';
import 'package:real_soft_task/log_service.dart';

import '../TreatmentModel.dart';
import '../service/https_service.dart';

class ListPage extends StatefulWidget {
  static final String id = "detail_page";

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  bool isLoading = false;
  TreatmentModel treatmentModel = TreatmentModel();

  @override
  void initState() {
    super.initState();
    _apiList();
  }

  void _apiList() async {
    setState(() {
      isLoading = true;
    });
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    //var response = await Network.getTreatmentData();
    setState(() {
      isLoading = false;
      /*
      // treatmentModel = TreatmentModel.fromJson({
      //   "error": null,
      //   "message": null,
      //   "timestamp": "2024-01-11 12:04:02",
      //   "status": 200,
      //   "path": null,
      //   "data": [
      //     {
      //       "title": "Хонадонда даволанишга муҳтожлар",
      //       "need_treatment": [
      //         {"name": "Бош мия касаллиги", "total": 10, "one_day_total": 0},
      //         {
      //           "name": "Юрак-қон томирлар касаллиги",
      //           "total": 47,
      //           "one_day_total": 2
      //         },
      //         {
      //           "name": "Буйрак ва пешоб касаллиги",
      //           "total": 11,
      //           "one_day_total": 0
      //         },
      //         {
      //           "name": "Асаб-руҳий тизим касаллиги",
      //           "total": 22,
      //           "one_day_total": 2
      //         },
      //         {
      //           "name": "Ошқозон ичак тизими касаллиги",
      //           "total": 5,
      //           "one_day_total": 0
      //         },
      //         {
      //           "name": "Нафас аъзолари касаллиги",
      //           "total": 6,
      //           "one_day_total": 0
      //         },
      //         {
      //           "name": "Эндокрин безлар касаллиги",
      //           "total": 4,
      //           "one_day_total": 0
      //         },
      //         {"name": "Онкологик касаллик", "total": 9, "one_day_total": 0},
      //         {
      //           "name": "Суяк тизими касаллиги",
      //           "total": 19,
      //           "one_day_total": 0
      //         },
      //         {
      //           "name": "Мушак тизими касаллиги",
      //           "total": 2,
      //           "one_day_total": 0
      //         },
      //         {"name": "Бўғим касаллиги", "total": 8, "one_day_total": 1},
      //         {"name": "Қон тизими касаллиги", "total": 1, "one_day_total": 0},
      //         {"name": "Сил касаллиги", "total": 0, "one_day_total": 0},
      //         {"name": "Бошқа касаллик", "total": 23, "one_day_total": 0}
      //       ]
      //     },
      //     {
      //       "title": "Хонадонда даволанишга муҳтожлар",
      //       "need_treatment": [
      //         {"name": "Бош мия касаллиги", "total": 10, "one_day_total": 0},
      //         {
      //           "name": "Юрак-қон томирлар касаллиги",
      //           "total": 47,
      //           "one_day_total": 2
      //         },
      //         {
      //           "name": "Буйрак ва пешоб касаллиги",
      //           "total": 11,
      //           "one_day_total": 0
      //         },
      //         {
      //           "name": "Асаб-руҳий тизим касаллиги",
      //           "total": 22,
      //           "one_day_total": 2
      //         },
      //         {
      //           "name": "Ошқозон ичак тизими касаллиги",
      //           "total": 5,
      //           "one_day_total": 0
      //         },
      //         {
      //           "name": "Нафас аъзолари касаллиги",
      //           "total": 6,
      //           "one_day_total": 0
      //         },
      //         {
      //           "name": "Эндокрин безлар касаллиги",
      //           "total": 4,
      //           "one_day_total": 0
      //         },
      //         {"name": "Онкологик касаллик", "total": 9, "one_day_total": 0},
      //         {
      //           "name": "Суяк тизими касаллиги",
      //           "total": 19,
      //           "one_day_total": 0
      //         },
      //         {
      //           "name": "Мушак тизими касаллиги",
      //           "total": 2,
      //           "one_day_total": 0
      //         },
      //         {"name": "Бўғим касаллиги", "total": 8, "one_day_total": 1},
      //         {"name": "Қон тизими касаллиги", "total": 1, "one_day_total": 0},
      //         {"name": "Сил касаллиги", "total": 0, "one_day_total": 0},
      //         {"name": "Бошқа касаллик", "total": 23, "one_day_total": 0}
      //       ]
      //     },
      //     {
      //       "title": "Хонадонда даволанишга муҳтожлар",
      //       "need_treatment": [
      //         {"name": "Бош мия касаллиги", "total": 10, "one_day_total": 0},
      //         {
      //           "name": "Юрак-қон томирлар касаллиги",
      //           "total": 47,
      //           "one_day_total": 2
      //         },
      //         {
      //           "name": "Буйрак ва пешоб касаллиги",
      //           "total": 11,
      //           "one_day_total": 0
      //         },
      //         {
      //           "name": "Асаб-руҳий тизим касаллиги",
      //           "total": 22,
      //           "one_day_total": 2
      //         },
      //         {
      //           "name": "Ошқозон ичак тизими касаллиги",
      //           "total": 5,
      //           "one_day_total": 0
      //         },
      //         {
      //           "name": "Нафас аъзолари касаллиги",
      //           "total": 6,
      //           "one_day_total": 0
      //         },
      //         {
      //           "name": "Эндокрин безлар касаллиги",
      //           "total": 4,
      //           "one_day_total": 0
      //         },
      //         {"name": "Онкологик касаллик", "total": 9, "one_day_total": 0},
      //         {
      //           "name": "Суяк тизими касаллиги",
      //           "total": 19,
      //           "one_day_total": 0
      //         },
      //         {
      //           "name": "Мушак тизими касаллиги",
      //           "total": 2,
      //           "one_day_total": 0
      //         },
      //         {"name": "Бўғим касаллиги", "total": 8, "one_day_total": 1},
      //         {"name": "Қон тизими касаллиги", "total": 1, "one_day_total": 0},
      //         {"name": "Сил касаллиги", "total": 0, "one_day_total": 0},
      //         {"name": "Бошқа касаллик", "total": 23, "one_day_total": 0}
      //       ]
      //     },
      //   ],
      //   "response": null
      // });
      */
      if (response != null) {
         treatmentModel = TreatmentModel.fromJson(response);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
          children: [

          isLoading
          ? Center(
          child: CircularProgressIndicator(),
    ): Container(
    padding: EdgeInsets.fromLTRB(5, 30, 5, 10),
    child: ListView.builder(
    padding: const EdgeInsets.all(8),
    itemCount: treatmentModel.data!.length ?? 0,
    itemBuilder: (BuildContext context, int index) {
    return _buildPlayerModelList(treatmentModel.data![index]);
    },
    ),
    ),
    ],
    ),
    );
  }

  Widget _buildPlayerModelList(Data data) {
    LogService.e(data.needTreatment!.length.toString());
    return Card(
      child: ExpansionTile(
        title: Text(
          data.title.toString(),
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ListView.builder(
                  itemCount: data?.needTreatment?.length ?? 0,
                  itemBuilder: (context, index) {
                    return _treatment(data.needTreatment![index]);
                  },
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _treatment(NeedTreatment needTreatment) {
    return Column(
      children: [
        Text(needTreatment.name.toString()),
        Text(needTreatment.total.toString()),
        Text(needTreatment.oneDayTotal.toString()),
      ],
    );
  }
}
