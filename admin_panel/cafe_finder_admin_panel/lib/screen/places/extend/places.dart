import 'package:cafe_finder_admin_panel/screen/setting/settings_screen.dart';
import 'package:flutter/material.dart';

import 'package:cafe_finder_admin_panel/models/models.dart';

class PlacesPage extends StatefulWidget {
  const PlacesPage({
    Key? key,
    required this.title,
    required this.coffeeshop,
  }) : super(key: key);
  final String title;
  final List<Coffeeshop> coffeeshop;
  // final Coffeeshop coffeeshop;

  @override
  State<PlacesPage> createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  bool sort = true;
  List<Coffeeshop> filterData = [];

  @override
  void initState() {
    filterData = widget.coffeeshop;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onSearch(String searchResult) {
    setState(() {
      filterData = searchResult.isEmpty
          ? widget.coffeeshop
          : widget.coffeeshop
              .where((element) => element.name
                  .toString()
                  .toLowerCase()
                  .contains(searchResult.toLowerCase()))
              .toList();
    });
  }

  onsortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        widget.coffeeshop.sort((a, b) => a.name!.compareTo(b.name!));
      } else {
        widget.coffeeshop.sort((a, b) => b.name!.compareTo(a.name!));
      }
    }
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 1000,
              child: Theme(
                data: ThemeData.light()
                    .copyWith(cardColor: Theme.of(context).canvasColor),
                child: PaginatedDataTable(
                  sortColumnIndex: 0,
                  sortAscending: sort,
                  header: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                            suffixIconColor:
                                Theme.of(context).colorScheme.primary,
                            hintText: " Enter something to filter",
                            suffixIcon: Icon(
                              Icons.search,
                              color: Theme.of(context).colorScheme.primary,
                            )),
                        onChanged: onSearch),
                  ),
                  source: RowSource(
                    myData: filterData,
                    count: filterData.length,
                    context: context,
                  ),
                  rowsPerPage: 10,
                  showCheckboxColumn: true,
                  columnSpacing: 12,
                  showFirstLastButtons: true,
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            )))
                  ],
                  horizontalMargin: 40.0,
                  columns: [
                    DataColumn(
                        label: const Text(
                          "Name",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                        onSort: (columnIndex, ascending) {
                          setState(() {
                            sort = !sort;
                          });

                          onsortColum(columnIndex, ascending);
                        }),
                    const DataColumn(
                      label: Text(
                        "Cuisines",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ),
                    const DataColumn(
                      label: Text(
                        "Category              ",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ),
                    const DataColumn(
                      label: Center(
                        child: Text(
                          "Location",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                      ),
                    ),
                    const DataColumn(
                      label: Text(
                        " Action",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              )),

          const SizedBox(height: 20),
          // const Center(
          //   child: Text(
          //     "Flutter Paginated DataTable With \n\n Sorting \n\n Filtering \n\n Pagination",
          //     style: TextStyle(
          //         fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: 5),
          //     textAlign: TextAlign.center,
          //   ),
          // )
        ],
      ),
    );
  }
}

class RowSource extends DataTableSource {
  final List<Coffeeshop> myData;
  final count;
  BuildContext context;
  RowSource({required this.myData, required this.count, required this.context});

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(myData[index], context);
    } else {
      return null;
    }
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}

DataRow recentFileDataRow(final data, BuildContext context) {
  return DataRow(
    cells: [
      DataCell(Text(data.name ?? "Name")),
      DataCell(Text(data.tags.toString())),
      DataCell(Text(data.category.toString())),
      DataCell(Text(data.locality.toString())),
      DataCell(TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SettingScreen(
                        coffeeshops: data,
                      )));
        },
        child: Icon(
          Icons.settings,
          size: 20,
          color: Theme.of(context).colorScheme.primary,
        ),
      )),
    ],
  );
}
