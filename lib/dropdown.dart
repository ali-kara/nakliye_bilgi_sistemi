import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _openDropDownProgKey = GlobalKey<DropdownSearchState<int>>();
  final _multiKey = GlobalKey<DropdownSearchState<String>>();
  final _popupBuilderKey = GlobalKey<DropdownSearchState<String>>();
  final _popupCustomValidationKey = GlobalKey<DropdownSearchState<int>>();
  final _userEditTextController = TextEditingController(text: 'Mrs');
  final myKey = GlobalKey<DropdownSearchState<MultiLevelString>>();
  final List<MultiLevelString> myItems = [
    MultiLevelString(level1: "1"),
    MultiLevelString(level1: "2"),
    MultiLevelString(
      level1: "3",
      subLevel: [
        MultiLevelString(level1: "sub3-1"),
        MultiLevelString(level1: "sub3-2"),
      ],
    ),
    MultiLevelString(level1: "4")
  ];
  bool? _popupBuilderSelection = false;

  @override
  Widget build(BuildContext context) {
    void handleCheckBoxState({bool updateState = true}) {
      var selectedItem =
          _popupBuilderKey.currentState?.popupGetSelectedItems ?? [];
      var isAllSelected =
          _popupBuilderKey.currentState?.popupIsAllItemSelected ?? false;
      _popupBuilderSelection =
          selectedItem.isEmpty ? false : (isAllSelected ? true : null);

      if (updateState) setState(() {});
    }

    handleCheckBoxState(updateState: false);

    return Scaffold(
      appBar: AppBar(title: const Text("DropdownSearch Demo")),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: const EdgeInsets.all(4),
            children: <Widget>[
              ///************************[simple examples for single and multi selection]************///
              const Text("[simple examples for single and multi selection]"),
              const Divider(),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<int>(
                      items: const [1, 2, 3, 4, 5, 6, 7],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(4)),
                  Expanded(
                    child: DropdownSearch<int>.multiSelection(
                      clearButtonProps: const ClearButtonProps(isVisible: true),
                      items: const [1, 2, 3, 4, 5, 6, 7],
                    ),
                  )
                ],
              ),

              ///************************[simple examples for each mode]*************************///
              const Padding(padding: EdgeInsets.all(8)),
              const Text("[simple examples for each mode]"),
              const Divider(),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<int>(
                      items: const [1, 2, 3, 4, 5, 6, 7],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(4)),
                  Expanded(
                    child: DropdownSearch<int>.multiSelection(
                      key: _popupCustomValidationKey,
                      items: const [1, 2, 3, 4, 5, 6, 7],
                      popupProps: PopupPropsMultiSelection.dialog(
                        validationWidgetBuilder: (ctx, selectedItems) {
                          return Container(
                            color: Colors.blue[200],
                            height: 56,
                            child: Align(
                              alignment: Alignment.center,
                              child: MaterialButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  _popupCustomValidationKey.currentState
                                      ?.popupOnValidate();
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
              const Padding(padding: EdgeInsets.all(4)),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<int>(
                      items: const [1, 2, 3, 4, 5, 6, 7],
                      dropdownDecoratorProps: const DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "BottomSheet mode",
                          hintText: "Select an Int",
                        ),
                      ),
                      popupProps: const PopupProps.bottomSheet(
                          bottomSheetProps: BottomSheetProps(
                              elevation: 16,
                              backgroundColor: Color(0xFFAADCEE))),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(4)),
                  Expanded(
                    child: DropdownSearch<int>(
                      items: const [1, 2, 3, 4, 5, 6, 7],
                      dropdownDecoratorProps: const DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Modal mode",
                          hintText: "Select an Int",
                          filled: true,
                        ),
                      ),
                      popupProps: PopupPropsMultiSelection.modalBottomSheet(
                        disabledItemFn: (int i) => i <= 3,
                      ),
                    ),
                  )
                ],
              ),

              ///************************[Favorites examples]**********************************///
              const Padding(padding: EdgeInsets.all(8)),
              const Text("[Favorites examples]"),
              const Divider(),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<UserModel>(
                      asyncItems: (filter) => getData(filter),
                      compareFn: (i, s) => i.isEqual(s),
                      popupProps: PopupPropsMultiSelection.modalBottomSheet(
                        isFilterOnline: true,
                        showSelectedItems: true,
                        showSearchBox: true,
                        itemBuilder: _customPopupItemBuilderExample2,
                        favoriteItemProps: FavoriteItemProps(
                          showFavoriteItems: true,
                          favoriteItems: (us) {
                            return us
                                .where((e) => e.name.contains("Mrs"))
                                .toList();
                          },
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(4)),
                  Expanded(
                    child: DropdownSearch<UserModel>.multiSelection(
                      asyncItems: (filter) => getData(filter),
                      compareFn: (i, s) => i.isEqual(s),
                      popupProps: PopupPropsMultiSelection.modalBottomSheet(
                        showSearchBox: true,
                        itemBuilder: _customPopupItemBuilderExample2,
                        favoriteItemProps: FavoriteItemProps(
                          showFavoriteItems: true,
                          favoriteItems: (us) {
                            return us
                                .where((e) => e.name.contains("Mrs"))
                                .toList();
                          },
                          favoriteItemBuilder: (context, item, isSelected) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 6),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[100]),
                              child: Row(
                                children: [
                                  Text(
                                    item.name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(color: Colors.indigo),
                                  ),
                                  const Padding(padding: EdgeInsets.only(left: 8)),
                                  isSelected
                                      ? const Icon(Icons.check_box_outlined)
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              ///************************[validation examples]********************************///
              const Padding(padding: EdgeInsets.all(8)),
              const Text("[validation examples]"),
              const Divider(),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<int>(
                      items: const [1, 2, 3, 4, 5, 6, 7],
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator: (int? i) {
                        if (i == null) {
                          return 'required filed';
                        } else if (i >= 5) return 'value should be < 5';
                        return null;
                      },
                      clearButtonProps: const ClearButtonProps(isVisible: true),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(4)),
                  Expanded(
                    child: DropdownSearch<int>.multiSelection(
                      items: const [1, 2, 3, 4, 5, 6, 7],
                      validator: (List<int>? items) {
                        if (items == null || items.isEmpty) {
                          return 'required filed';
                        } else if (items.length > 3)
                          return 'only 1 to 3 items are allowed';
                        return null;
                      },
                    ),
                  )
                ],
              ),

              ///************************[custom popup background examples]********************************///
              const Padding(padding: EdgeInsets.all(8)),
              const Text("[custom popup background examples]"),
              const Divider(),
              DropdownSearch<String>(
                items: List.generate(5, (index) => "$index"),
                popupProps: PopupProps.menu(
                  fit: FlexFit.loose,
                  menuProps: const MenuProps(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  containerBuilder: (ctx, popupWidget) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Image.asset(
                            'assets/images/arrow-up.png',
                            color: const Color(0xFF2F772A),
                            height: 12,
                          ),
                        ),
                        Flexible(
                          child: Container(
                            color: const Color(0xFF2F772A),
                            child: popupWidget,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.all(8)),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<String>.multiSelection(
                      key: _popupBuilderKey,
                      items: List.generate(30, (index) => "$index"),
                      popupProps: PopupPropsMultiSelection.dialog(
                        onItemAdded: (l, s) => handleCheckBoxState(),
                        onItemRemoved: (l, s) => handleCheckBoxState(),
                        showSearchBox: true,
                        containerBuilder: (ctx, popupWidget) {
                          return _CheckBoxWidget(
                            isSelected: _popupBuilderSelection,
                            onChanged: (v) {
                              if (v == true) {
                                _popupBuilderKey.currentState!
                                    .popupSelectAllItems();
                              } else if (v == false)
                                _popupBuilderKey.currentState!
                                    .popupDeselectAllItems();
                              handleCheckBoxState();
                            },
                            child: popupWidget,
                          );
                        },
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(4)),
                  Expanded(
                    child: DropdownSearch<String>.multiSelection(
                      key: _multiKey,
                      items: List.generate(30, (index) => "$index"),
                      popupProps: PopupPropsMultiSelection.dialog(
                        onItemAdded: (l, s) => handleCheckBoxState(),
                        onItemRemoved: (l, s) => handleCheckBoxState(),
                        showSearchBox: true,
                        containerBuilder: (ctx, popupWidget) {
                          return Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: OutlinedButton(
                                      onPressed: () {
                                        // How should I unselect all items in the list?
                                        _multiKey.currentState
                                            ?.closeDropDownSearch();
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: OutlinedButton(
                                      onPressed: () {
                                        // How should I select all items in the list?
                                        _multiKey.currentState
                                            ?.popupSelectAllItems();
                                      },
                                      child: const Text('All'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: OutlinedButton(
                                      onPressed: () {
                                        // How should I unselect all items in the list?
                                        _multiKey.currentState
                                            ?.popupDeselectAllItems();
                                      },
                                      child: const Text('None'),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(child: popupWidget),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),

              ///************************[dropdownBuilder examples]********************************///
              const Padding(padding: EdgeInsets.all(8)),
              const Text("[DropDownSearch builder examples]"),
              const Divider(),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<UserModel>.multiSelection(
                      asyncItems: (String? filter) => getData(filter),
                      clearButtonProps: const ClearButtonProps(isVisible: true),
                      popupProps: PopupPropsMultiSelection.modalBottomSheet(
                        showSelectedItems: true,
                        isFilterOnline: true,
                        itemBuilder: _customPopupItemBuilderExample2,
                        showSearchBox: true,
                        searchFieldProps: TextFieldProps(
                          controller: _userEditTextController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                _userEditTextController.clear();
                              },
                            ),
                          ),
                        ),
                      ),
                      compareFn: (item, selectedItem) =>
                          item.id == selectedItem.id,
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: 'Users *',
                          filled: true,
                          fillColor:
                              Theme.of(context).inputDecorationTheme.fillColor,
                        ),
                      ),
                      dropdownBuilder: _customDropDownExampleMultiSelection,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(4)),
                  Expanded(
                    child: DropdownSearch<UserModel>(
                      asyncItems: (String? filter) => getData(filter),
                      popupProps: PopupPropsMultiSelection.modalBottomSheet(
                        showSelectedItems: true,
                        itemBuilder: _customPopupItemBuilderExample2,
                        showSearchBox: true,
                      ),
                      compareFn: (item, sItem) => item.id == sItem.id,
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: 'User *',
                          filled: true,
                          fillColor:
                              Theme.of(context).inputDecorationTheme.fillColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              ///************************[Dynamic height depending on items number]********************************///
              const Padding(padding: EdgeInsets.all(8)),
              const Text("[popup dynamic height examples]"),
              const Divider(),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<int>(
                      items: List.generate(50, (i) => i),
                      popupProps: const PopupProps.menu(
                        showSearchBox: true,
                        title: Text('default fit'),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(4)),
                  Expanded(
                    child: DropdownSearch<int>(
                      items: List.generate(50, (i) => i),
                      popupProps: const PopupProps.menu(
                        title: Text('With fit to loose and no constraints'),
                        showSearchBox: true,
                        fit: FlexFit.loose,
                        //comment this if you want that the items do not takes all available height
                        constraints: BoxConstraints.tightFor(),
                      ),
                    ),
                  )
                ],
              ),
              const Padding(padding: EdgeInsets.all(4)),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<int>(
                      items: List.generate(50, (i) => i),
                      popupProps: const PopupProps.menu(
                        showSearchBox: true,
                        fit: FlexFit.loose,
                        title: Text('fit to a specific max height'),
                        constraints: BoxConstraints(maxHeight: 300),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(4)),
                  Expanded(
                    child: DropdownSearch<int>(
                      items: List.generate(50, (i) => i),
                      popupProps: const PopupProps.menu(
                        title: Text('fit to a specific width and height'),
                        showSearchBox: true,
                        fit: FlexFit.loose,
                        constraints: BoxConstraints.tightFor(
                          width: 300,
                          height: 300,
                        ),
                      ),
                    ),
                  )
                ],
              ),

              ///************************[Handle dropdown programmatically]********************************///
              const Padding(padding: EdgeInsets.all(8)),
              const Text("[handle dropdown programmatically]"),
              const Divider(),
              DropdownSearch<int>(
                key: _openDropDownProgKey,
                items: const [1, 2, 3],
              ),
              const Padding(padding: EdgeInsets.all(4)),
              ElevatedButton(
                onPressed: () {
                  _openDropDownProgKey.currentState?.changeSelectedItem(100);
                },
                child: const Text('set to 100'),
              ),
              const Padding(padding: EdgeInsets.all(4)),
              ElevatedButton(
                onPressed: () {
                  _openDropDownProgKey.currentState?.openDropDownSearch();
                },
                child: const Text('open popup'),
              ),

              ///************************[multiLevel items example]********************************///
              const Padding(padding: EdgeInsets.all(8)),
              const Text("[multiLevel items example]"),
              const Divider(),
              DropdownSearch<MultiLevelString>(
                key: myKey,
                items: myItems,
                compareFn: (i1, i2) => i1.level1 == i2.level1,
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                  interceptCallBacks: true, //important line
                  itemBuilder: (ctx, item, isSelected) {
                    return ListTile(
                      selected: isSelected,
                      title: Text(item.level1),
                      trailing: item.subLevel.isEmpty
                          ? null
                          : (item.isExpanded
                              ? IconButton(
                                  icon: const Icon(Icons.arrow_drop_down),
                                  onPressed: () {
                                    item.isExpanded = !item.isExpanded;
                                    myKey.currentState?.updatePopupState();
                                  },
                                )
                              : IconButton(
                                  icon: const Icon(Icons.arrow_right),
                                  onPressed: () {
                                    item.isExpanded = !item.isExpanded;
                                    myKey.currentState?.updatePopupState();
                                  },
                                )),
                      subtitle: item.subLevel.isNotEmpty && item.isExpanded
                          ? SizedBox(
                              height: item.subLevel.length * 50,
                              child: ListView(
                                children: item.subLevel
                                    .map(
                                      (e) => ListTile(
                                        selected: myKey.currentState
                                                ?.getSelectedItem?.level1 ==
                                            e.level1,
                                        title: Text(e.level1),
                                        onTap: () {
                                          myKey.currentState
                                              ?.popupValidate([e]);
                                        },
                                      ),
                                    )
                                    .toList(),
                              ),
                            )
                          : null,
                      onTap: () => myKey.currentState?.popupValidate([item]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customDropDownExampleMultiSelection(
      BuildContext context, List<UserModel> selectedItems) {
    if (selectedItems.isEmpty) {
      return const ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: CircleAvatar(),
        title: Text("No item selected"),
      );
    }

    return Wrap(
      children: selectedItems.map((e) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            child: ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(""),
              ),
              title: Text(e.name),
              subtitle: Text(
                e.createdAt.toString(),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _customPopupItemBuilderExample2(
      BuildContext context, UserModel item, bool isSelected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item.name),
        subtitle: Text(item.createdAt.toString()),
        leading: const CircleAvatar(
          backgroundImage: NetworkImage(""),
        ),
      ),
    );
  }

  Future<List<UserModel>> getData(filter) async {
    var response = await Dio().get(
      "https://63c1210999c0a15d28e1ec1d.mockapi.io/users",
      queryParameters: {"filter": filter},
    );

    final data = response.data;
    if (data != null) {
      return UserModel.fromJsonList(data);
    }

    return [];
  }
}

class _CheckBoxWidget extends StatefulWidget {
  final Widget child;
  final bool? isSelected;
  final ValueChanged<bool?>? onChanged;

  const _CheckBoxWidget({required this.child, this.isSelected, this.onChanged});

  @override
  CheckBoxState createState() => CheckBoxState();
}

class CheckBoxState extends State<_CheckBoxWidget> {
  bool? isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  @override
  void didUpdateWidget(covariant _CheckBoxWidget oldWidget) {
    if (widget.isSelected != isSelected) isSelected = widget.isSelected;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0x88F44336),
            Colors.blue,
          ],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('Select: '),
              Checkbox(
                  value: isSelected,
                  tristate: true,
                  onChanged: (bool? v) {
                    v ??= false;
                    setState(() {
                      isSelected = v;
                      if (widget.onChanged != null) widget.onChanged!(v);
                    });
                  }),
            ],
          ),
          Expanded(child: widget.child),
        ],
      ),
    );
  }
}

class MultiLevelString {
  final String level1;
  final List<MultiLevelString> subLevel;
  bool isExpanded;

  MultiLevelString({
    this.level1 = "",
    this.subLevel = const [],
    this.isExpanded = false,
  });

  MultiLevelString copy({
    String? level1,
    List<MultiLevelString>? subLevel,
    bool? isExpanded,
  }) =>
      MultiLevelString(
        level1: level1 ?? this.level1,
        subLevel: subLevel ?? this.subLevel,
        isExpanded: isExpanded ?? this.isExpanded,
      );

  @override
  String toString() => level1;
}

class UserModel {
  final String id;
  final DateTime? createdAt;
  final String name;
  final String? avatar;

  UserModel(
      {required this.id, this.createdAt, required this.name, this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      createdAt:
          json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
      name: json["name"],
      avatar: json["avatar"],
    );
  }

  static List<UserModel> fromJsonList(List list) {
    return list.map((item) => UserModel.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '#$id $name';
  }

  ///this method will prevent the override of toString
  bool userFilterByCreationDate(String filter) {
    return createdAt?.toString().contains(filter) ?? false;
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(UserModel model) {
    return id == model.id;
  }

  @override
  String toString() => name;
}
