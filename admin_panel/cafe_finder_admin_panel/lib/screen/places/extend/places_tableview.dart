import 'package:cafe_finder_admin_panel/models/newmodels.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PlacesTable extends StatefulWidget {
  const PlacesTable({Key? key}) : super(key: key);

  @override
  State<PlacesTable> createState() => _PlacesTableState();
}

class _PlacesTableState extends State<PlacesTable> {
  late CoffeeshopDataSource coffeeshopDataSource;
  List<Places> cData = [];

  final getDataFromFireStore =
      FirebaseFirestore.instance.collection('places').snapshots();

  Widget _buildDataGrid() {
    return StreamBuilder(
      stream: getDataFromFireStore,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          if (cData.isNotEmpty) {
            getDataGridRowFromDatabase(DocumentChange<Object?> data) {
              var reload = data.doc.toString();
              return DataGridRow(cells: [
                DataGridCell(
                    columnName: 'id',
                    value: reload.contains('id') ? data.doc['id'] : ''),
                DataGridCell(
                    columnName: 'name',
                    value: reload.contains('name') ? data.doc['name'] : ''),
                DataGridCell(
                    columnName: 'tags',
                    value: reload.contains('tags') ? data.doc['tags'] : ''),
                DataGridCell(
                    columnName: 'description',
                    value: reload.contains('description')
                        ? data.doc['description']
                        : ''),
              ]);
            }

            for (var data in snapshot.data!.docChanges) {
              if (data.type == DocumentChangeType.modified) {
                if (data.oldIndex == data.newIndex) {
                  coffeeshopDataSource.dataGridRows[data.oldIndex] =
                      getDataGridRowFromDatabase(data);
                }
                coffeeshopDataSource.updateDataGridSource();
              } else if (data.type == DocumentChangeType.added) {
                coffeeshopDataSource.dataGridRows
                    .add(getDataGridRowFromDatabase(data));
                coffeeshopDataSource.updateDataGridSource();
              } else if (data.type == DocumentChangeType.removed) {
                coffeeshopDataSource.dataGridRows.removeAt(data.oldIndex);
                coffeeshopDataSource.updateDataGridSource();
              }
            }
          } else {
            for (var data in snapshot.data!.docs) {
              cData.add(Places(
                  id: data.toString().contains('id') ? data['id'] : '',
                  name: data.toString().contains('name') ? data['name'] : '',
                  tags: data.toString().contains('tags') ? data['tags'] : '',
                  description: data.toString().contains('description')
                      ? data['description']
                      : ''));
            }
            coffeeshopDataSource = CoffeeshopDataSource(cData);
          }
          return SfDataGrid(
            source: coffeeshopDataSource,
            columns: getColumns,
            columnWidthMode: ColumnWidthMode.fill,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: _buildDataGrid(),
    );
  }
}

class CoffeeshopDataSource extends DataGridSource {
  CoffeeshopDataSource(this.cData) {
    _buildDataRow();
  }
  List<DataGridRow> dataGridRows = [];
  List<Places> cData;

  void _buildDataRow() {
    dataGridRows = cData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(columnName: 'tags', value: e.tags),
              DataGridCell<String>(
                  columnName: 'description', value: e.description),
            ]))
        .toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(
    DataGridRow row,
  ) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }

  void updateDataGridSource() {
    notifyListeners();
  }
}

List<GridColumn> get getColumns {
  return <GridColumn>[
    GridColumn(
      columnName: 'id',
      label: Container(
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: const Text('ID'),
      ),
    ),
    GridColumn(
      columnName: 'name',
      label: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: const Text('Name'),
      ),
    ),
    GridColumn(
      columnName: 'tags',
      label: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: const Text('Tags'),
      ),
    ),
    GridColumn(
      columnName: 'description',
      label: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: const Text('Description'),
      ),
    ),
  ];
}
