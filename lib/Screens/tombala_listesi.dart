import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Api/tombala_service.dart';
import 'package:nakliye_bilgi_sistemi/Model/tombala.dart';
import '../Snippets/base_appbar.dart';
import '../Widgets/loading_view.dart';

class TombalaListesi extends StatefulWidget {
  TombalaListesi({super.key, this.showAppBar = true});
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
          child: list == null
              ? loadingWidget()
              : SingleChildScrollView(child: _createDataTable()),
        ),
      ),
    );
  }

  Widget _createDataTable() {
    return FittedBox(
      child: DataTable(
        dataRowMinHeight: 30,
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
              DataCell(Text(e.ureticiKodu ?? "")),
              DataCell(Text(e.ureticiAdiSoyadi ?? "")),
              DataCell(Text(e.adet?.toString() ?? "")),
            ]))
        .toList();
  }
}
