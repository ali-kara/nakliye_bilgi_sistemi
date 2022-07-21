import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Api/tombala_service.dart';
import 'package:nakliye_bilgi_sistemi/Model/tombala.dart';
import 'package:nakliye_bilgi_sistemi/Snippets/base_appbar.dart';

class TombalaList extends StatefulWidget {
  const TombalaList({Key? key}) : super(key: key);

  @override
  State<TombalaList> createState() => _TombalaListState();
}

class _TombalaListState extends State<TombalaList> {
  late TombalaService _tombalaService;
  List<NakliyeTombala>? list;

  @override
  void initState() {
    super.initState();

    _tombalaService = TombalaService();
    tombalaGetList();
  }

  Future<void> tombalaGetList() async {
    list = await _tombalaService.getList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      body: Column(
        children: [
          Row(children: [
            Expanded(child: Container(height: 40, color: Colors.red)),
          ]),
          list != null
              ? ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: list?.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          width: 50.0,
                          child: Text(
                            list?[index].ureticiKodu.toString() ?? "0",
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          width: 250.0,
                          child: Text(
                            list?[index].ureticiAdiSoyadi ?? "-",
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          width: 50.0,
                          child: Text(
                            list?[index].adet.toString() ?? "0",
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    );
                  },
                )
              : const CircularProgressIndicator.adaptive(),
        ],
      ),
    );
  }
}
