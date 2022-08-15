import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Api/tombala_service.dart';
import 'package:nakliye_bilgi_sistemi/Model/tombala.dart';
import 'package:nakliye_bilgi_sistemi/Snippets/base_appbar.dart';
import 'package:nakliye_bilgi_sistemi/Widgets/loading_view.dart';

class TombalaListesi extends StatefulWidget {
  TombalaListesi({Key? key, this.showAppBar = true}) : super(key: key);
  bool showAppBar = true;

  @override
  State<TombalaListesi> createState() => _TombalaListesiState();
}

class _TombalaListesiState extends State<TombalaListesi> {
  List<NakliyeTombala>? list;
  late TombalaService _tombalaService;

  @override
  void initState() {
    super.initState();

    _tombalaService = TombalaService();
    tombalaGetir();
  }

  Future<void> tombalaGetir() async {
    list = await _tombalaService.getList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: widget.showAppBar == false ? null : const BaseAppBar(),
        body: RefreshIndicator(
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          onRefresh: () async {
            tombalaGetir();
          },
          child: ListView(
            children: [
              list == null ? loadingWidget() : _createDataTable(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createDataTable() {
    return FittedBox(
      fit: BoxFit.fill,
      child: DataTable(
        dataRowHeight: 34,
        headingTextStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w700,
        ),
        //columnSpacing: 10,
        columns: _createColumns(),
        rows: _createRows(),
      ),
    );
  }

  List<DataColumn> _createColumns() {
    return const [
      DataColumn(label: Text('Üretici Kodu')),
      DataColumn(label: Text('Üretici Adı Soyadı')),
      DataColumn(label: Text('Adet'))
    ];
  }

  List<DataRow> _createRows() {
    return list!
        .map((e) => DataRow(cells: [
              DataCell(Text(e.UreticiKodu ?? "")),
              DataCell(Text(e.UreticiAdiSoyadi ?? "")),
              DataCell(Text(e.Adet?.toString() ?? "0")),
            ]))
        .toList();
  }
}
