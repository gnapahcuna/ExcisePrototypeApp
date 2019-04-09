import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_2.dart';
import 'package:expandable/expandable.dart';

class TabScreenArrest2Search extends StatefulWidget {
  @override
  _TabScreenArrest2SearchState createState() => new _TabScreenArrest2SearchState();
}
class _TabScreenArrest2SearchState extends State<TabScreenArrest2Search> {
  TabController tabController;
  TextEditingController controller = new TextEditingController();
  List<ItemsList> _searchResult = [];
  List<ItemsList> _itemsInit = [
    new ItemsList("LS2561100100002", "นายโชคชัย นานดี","Smith yohunt","01 ตุลาคม 2561", false),
    new ItemsList("LS2561100100003", "นายวสันต์ ศรีสุข","Pang Paiwad","19 มีนาคม 2562", false)
  ];
  int _countItem = 0;
  List<ItemsList> _itemsData = [];
  List<bool> _value = [];

  @override
  void initState() {
    super.initState();
  }

  CupertinoAlertDialog _createCupertinoCancelDeleteDialog(){
    TextStyle TitleStyle = TextStyle(fontSize: 16.0,);
    TextStyle ButtonAcceptStyle = TextStyle(color: Colors.blue, fontSize: 18.0, fontWeight: FontWeight.bold,);
    return new CupertinoAlertDialog(
        content: new Padding(
          padding: EdgeInsets.only(top: 22.0, bottom: 22.0),
          child: Text("ค้นหาไม่พบเลขใบแจ้งความ",
            style: TitleStyle,
          ),
        ),
        actions: <Widget>[
          new CupertinoButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: new Text('ยืนยัน', style: ButtonAcceptStyle)),
        ]
    );
  }
  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _createCupertinoCancelDeleteDialog();
      },
    );
  }

  onSearchTextSubmitted(String text) async {
    print(text);
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    _itemsInit.forEach((userDetail) {
      if (userDetail.NumberValue.contains(text) ||
          userDetail.NumberValue.contains(text))
        _searchResult.add(userDetail);
    });
    if(_searchResult.length==0){
      _showAlertDialog();
    }
    setState(() {});
  }
  buildCollapsedNonCheck(index,expandContext) {
    Color labelColor = Color(0xff087de1);
    TextStyle textInputStyle = TextStyle(fontSize: 16.0, color: Colors.black);
    TextStyle textLabelStyle = TextStyle(fontSize: 16.0, color: labelColor);
    EdgeInsets paddingInputBox = EdgeInsets.only(top: 6.0, bottom: 6.0);
    EdgeInsets paddingLabel = EdgeInsets.only(top: 0.0);
    var size = MediaQuery
        .of(context)
        .size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: paddingLabel,
                child: Text("เลขที่ใบจับกุม", style: textLabelStyle,),
              ),
            ),
            Center(
                child : InkWell(
                  onTap: () {
                    setState(() {
                      _itemsInit[index].isCheck = !_itemsInit[index].isCheck;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: _itemsInit[index].isCheck
                          ? Color(0xff3b69f3)
                          : Colors.white,
                      border: _itemsInit[index].isCheck
                          ?Border.all(color: Color(0xff3b69f3),width: 2)
                          :Border.all(color: Colors.grey[400],width: 2),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: _itemsInit[index].isCheck
                            ? Icon(
                          Icons.check,
                          size: 18.0,
                          color: Colors.white,
                        )
                            : Container(
                          height: 18.0,
                          width: 18.0,
                          color: Colors.transparent,
                        )
                    ),
                  ),
                )
            ),
          ],
        ),
        Padding(
          padding: paddingInputBox,
          child: Text(
            _searchResult[index].NumberValue, style: textInputStyle,),
        ),
        Container(
          padding: paddingLabel,
          child: Text("ผู้รับแจ้งความ", style: textLabelStyle,),
        ),
        Padding(
          padding: paddingInputBox,
          child: Text(
            _searchResult[index].NameInformant, style: textInputStyle,),
        ),

      ],
    );
  }
  buildCollapsedChecked(index,expandContext) {
    Color labelColor = Color(0xff087de1);
    TextStyle textInputStyle = TextStyle(fontSize: 16.0, color: Colors.black);
    TextStyle textLabelStyle = TextStyle(fontSize: 16.0, color: labelColor);
    EdgeInsets paddingInputBox = EdgeInsets.only(top: 6.0, bottom: 6.0);
    EdgeInsets paddingLabel = EdgeInsets.only(top: 0.0);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: paddingLabel,
                child: Text("เลขที่ใบจับกุม", style: textLabelStyle,),
              ),
            ),
            Center(
              child : Builder(
                builder: (context) {
                  var exp = ExpandableController.of(context);
                  return InkWell(
                    onTap: () {
                      exp.toggle();
                      setState(() {
                        _itemsInit[index].isCheck = !_itemsInit[index].isCheck;
                        exp.expanded;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: _itemsInit[index].isCheck
                            ? Color(0xff3b69f3)
                            : Colors.white,
                        border: _itemsInit[index].isCheck
                            ?Border.all(color: Color(0xff3b69f3),width: 2)
                            :Border.all(color: Colors.grey[400],width: 2),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: _itemsInit[index].isCheck
                              ? Icon(
                            Icons.check,
                            size: 18.0,
                            color: Colors.white,
                          )
                              : Container(
                            height: 18.0,
                            width: 18.0,
                            color: Colors.transparent,
                          )
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: paddingInputBox,
          child: Text(
            _searchResult[index].NumberValue, style: textInputStyle,),
        ),
        Container(
          padding: paddingLabel,
          child: Text("ผู้รับแจ้งความ", style: textLabelStyle,),
        ),
        Padding(
          padding: paddingInputBox,
          child: Text(
            _searchResult[index].NameInformant, style: textInputStyle,),
        ),

      ],
    );
  }
  buildExpandedChecked(index,expandContext) {
    Color labelColor = Color(0xff087de1);
    TextStyle textInputStyle = TextStyle(fontSize: 16.0, color: Colors.black);
    TextStyle textLabelStyle = TextStyle(fontSize: 16.0, color: labelColor);
    EdgeInsets paddingInputBox = EdgeInsets.only(top: 6.0, bottom: 6.0);
    EdgeInsets paddingLabel = EdgeInsets.only(top: 0.0);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: paddingLabel,
                child: Text("เลขที่ใบจับกุม", style: textLabelStyle,),
              ),
            ),
            Center(
              child : Builder(
                builder: (context) {
                  var exp = ExpandableController.of(context);
                  return InkWell(
                    onTap: () {
                      exp.toggle();
                      setState(() {
                        _itemsInit[index].isCheck = !_itemsInit[index].isCheck;
                        exp.expanded;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: _itemsInit[index].isCheck
                            ? Color(0xff3b69f3)
                            : Colors.white,
                        border: _itemsInit[index].isCheck
                            ?Border.all(color: Color(0xff3b69f3),width: 2)
                            :Border.all(color: Colors.grey[400],width: 2),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: _itemsInit[index].isCheck
                              ? Icon(
                            Icons.check,
                            size: 18.0,
                            color: Colors.white,
                          )
                              : Container(
                            height: 18.0,
                            width: 18.0,
                            color: Colors.transparent,
                          )
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: paddingInputBox,
          child: Text(
            _searchResult[index].NumberValue, style: textInputStyle,),
        ),
        Container(
          padding: paddingLabel,
          child: Text("ผู้รับแจ้งความ", style: textLabelStyle,),
        ),
        Padding(
          padding: paddingInputBox,
          child: Text(
            _searchResult[index].NameInformant, style: textInputStyle,),
        ),
        Container(
          padding: paddingLabel,
          child: Text("ผู้ต้องสงสัย", style: textLabelStyle,),
        ),
        Padding(
          padding: paddingInputBox,
          child: Text(
            _searchResult[index].NameDoubt, style: textInputStyle,),
        ),
        Container(
          padding: paddingLabel,
          child: Text("วันที่แจ้งความ", style: textLabelStyle,),
        ),
        Padding(
          padding: paddingInputBox,
          child: Text(
            _searchResult[index].Date, style: textInputStyle,),
        ),
      ],
    );
  }

  Widget _buildSearchResults() {
    Color labelColor = Color(0xff087de1);
    TextStyle textExpandStyle = TextStyle(fontSize: 16.0, color: labelColor);
    return ListView.builder(
      itemCount: _searchResult.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
          child: Container(
            padding: EdgeInsets.all(18.0),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                border: Border(
                  top: BorderSide(color: Colors.grey[300], width: 1.0),
                  bottom: BorderSide(color: Colors.grey[300], width: 1.0),
                )
            ),
            child: !_itemsInit[index].isCheck ? buildCollapsedNonCheck(index, context)
                :
            ExpandableNotifier(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expandable(
                    collapsed: buildExpandedChecked(index, context),
                    expanded: buildCollapsedChecked(index, context),
                  ),
                  _itemsInit[index].isCheck ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Builder(
                        builder: (context) {
                          var exp = ExpandableController.of(context);
                          return FlatButton(
                              onPressed: () {
                                exp.toggle();
                              },
                              child: Text(
                                exp.expanded ? "ดูเพิ่มเติม..." : "ย่อ...",
                                style: textExpandStyle,
                              )
                          );
                        },
                      ),
                    ],
                  ) : Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  Widget _buildBottom(){
    var size = MediaQuery
        .of(context)
        .size;
    TextStyle textStyleButton = TextStyle(color: Colors.white, fontSize: 18.0);
    bool isCheck =false;
    _countItem=0;
    _itemsInit.forEach((item){
      if(item.isCheck)
        setState(() {
          isCheck=item.isCheck;
          _countItem++;
        });

    });
    return  isCheck ? Container(
      width: size.width,
      height: 65,
      color: Color(0xff2e76bc),
      child: MaterialButton(
        onPressed: () {
          _itemsInit.forEach((item){
            if(item.isCheck)
              _itemsData.add(item);
          });
          Navigator.pop(context,_itemsData);
        },
        child: Center(
          child: Text('เลือก (${_countItem})', style: textStyleButton,),
        ),
      ),
    ) : null;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle styleTextSearch = TextStyle(fontSize: 16.0);
    return new WillPopScope(
        onWillPop: () {
      //
    },
    child: new Theme(
      data: new ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.white,
          hintColor: Colors.grey[400]
      ),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0), // here the desired height
          child: AppBar(
            title: new Padding(
                padding: EdgeInsets.only(right: 22.0),
              child: new TextField(
                style: styleTextSearch,
                controller: controller,
                decoration: new InputDecoration(
                  hintText: "ค้นหา",
                  hintStyle: styleTextSearch,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]),
                  ),
                ),
                //onChanged: onSearchTextChanged,
                onSubmitted: onSearchTextSubmitted,
              ),
            ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios,), onPressed: () {
              Navigator.pop(context,_itemsData);
            }),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 34.0,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border(
                      top: BorderSide(color: Colors.grey[300], width: 1.0),
                      //bottom: BorderSide(color: Colors.grey[300], width: 1.0),
                    )
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: new Text('ILG60_B_01_00_01_00',
                        style: TextStyle(color: Colors.grey[400]),),
                    )
                  ],
                ),
              ),
              Expanded(
                child: _searchResult.length != 0 || controller.text.isNotEmpty
                    ? _buildSearchResults() : new Container(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottom(),
      ),
    ),
    );
  }
}
