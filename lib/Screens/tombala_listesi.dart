import 'package:flutter/material.dart';
import 'package:nakliye_bilgi_sistemi/Api/tombala_service.dart';
import 'package:nakliye_bilgi_sistemi/Model/tombala.dart';
import '../Snippets/base_appbar.dart';
import '../Widgets/loading_view.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TombalaListesi extends StatefulWidget {
  TombalaListesi({super.key, this.showAppBar = true});
  late bool showAppBar = true;

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
              : ListView(children: [
                  _createDataTable(),
                ]),
        ),
      ),
    );
  }

  List<DataRow> _testRows() {
    return [
      DataRow(
        cells: [
          DataCell(
            Container(
              width: 100,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Text(index.toString());
                },
              ),
            ),
          ),
          DataCell(
            Text('Data B'),
          ),
          DataCell(
            Text('Data C'),
          ),
        ],
      ),
    ];
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

  late final List<DataRow> _rows;

  List<DataRow> _createRows() {
    return _rows = list!
        .map((e) => DataRow(cells: [
              DataCell(Text(e.ureticiKodu ?? "")),
              DataCell(Text(e.ureticiAdiSoyadi ?? "")),
              DataCell(Text(e.adet?.toString() ?? "")),
            ]))
        .toList();
  }

  Widget slidable() {
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: const ValueKey(0),

      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {}),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: doNothing,
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: doNothing,
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Share',
          ),
        ],
      ),

      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 2,
            onPressed: doNothing,
            backgroundColor: Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: 'Archive',
          ),
          SlidableAction(
            onPressed: doNothing,
            backgroundColor: Color(0xFF0392CF),
            foregroundColor: Colors.white,
            icon: Icons.save,
            label: 'Save',
          ),
        ],
      ),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: _createDataTable(),
    );
  }

  void doNothing(BuildContext context) {}
}
