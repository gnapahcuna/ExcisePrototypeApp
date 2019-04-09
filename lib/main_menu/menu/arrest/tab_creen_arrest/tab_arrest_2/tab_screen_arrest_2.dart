import 'package:flutter/material.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_2.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/tab_creen_arrest/tab_arrest_2/tab_screen_arrest_2_search.dart';

class TabScreenArrest2 extends StatefulWidget {
  bool onSaved;
  bool onEdited;
  bool onDeleted;
  TabScreenArrest2({
    Key key,
    @required this.onSaved,
    @required this.onEdited,
    @required this.onDeleted,
  }) : super(key: key);
  @override
  _TabScreenArrest2State createState() => new _TabScreenArrest2State();
}
class _TabScreenArrest2State extends State<TabScreenArrest2> {
  TabController tabController;
  TextEditingController controller = new TextEditingController();
  List<String> _searchResult = [];
  List<ItemsList> _itemsData = [];
  @override
  void initState() {
    super.initState();
    print("tab 2 Save: "+widget.onSaved.toString());
    print("tab 2 Edit: "+widget.onEdited.toString());
    print("tab 2 Delete: "+widget.onDeleted.toString());
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    setState(() {});
  }
  void _getRequests(){
    print("request");
  }
  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TabScreenArrest2Search()),
    );
    List<ItemsList> items = result;
    _itemsData=result;
    items.forEach((item){
      print(item.NumberValue);
    });
  }

  Widget _buildDataResults() {
    Color labelColor = Color(0xff087de1);
    TextStyle textDataStyle = TextStyle(fontSize: 16.0, color: Colors.black);
    TextStyle textLabelStyle = TextStyle(fontSize: 16.0, color: labelColor);
    TextStyle textLabelDeleteStyle = TextStyle(
        fontSize: 16.0, color: Colors.red[200]);
    TextStyle textDataStyleSub = TextStyle(fontSize: 14.0, color: Colors.black);
    EdgeInsets paddingInputBox = EdgeInsets.only(top: 4.0, bottom: 4.0);
    EdgeInsets paddingLabel = EdgeInsets.only(top: 0.0,bottom: 8.0);
    var size = MediaQuery
        .of(context)
        .size;
    return Container(
      padding: EdgeInsets.only(bottom: 12.0),
      child: ListView.builder(
        itemCount: _itemsData.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 0.0, bottom: 8.0),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: paddingLabel,
                      child: Text("เลขที่ใบจับกุม", style: textLabelStyle,),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: paddingInputBox,
                            child: Text(
                              _itemsData[index].NumberValue,
                              style: textDataStyle,),
                          ),
                        ),
                        Center(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _itemsData.removeAt(index);
                                });
                              },
                              child: Container(
                                  child: Text(
                                    "ลบ", style: textLabelDeleteStyle,)
                              ),
                            )
                        ),
                      ],
                    ),
                    /*Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: paddingLabel,
                          child: Text(
                            "ผู้รับแจ้งความ "+_itemsData[index].NameInforman, style: textDataStyleSub,),
                        ),
                        Padding(
                          padding: paddingInputBox,
                          child: Text(
                            _itemsData[index].NameInformant,
                            style: textDataStyleSub,),
                        ),
                      ],
                    )*/
                    Container(
                      padding: paddingLabel,
                      child: Text(
                        "ผู้รับแจ้งความ "+_itemsData[index].NameInformant, style: textDataStyleSub,),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              //height: 34.0,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border(
                      top: BorderSide(color: Colors.grey[300], width: 1.0),
                    )
                ),
                child: Column(
                  children: <Widget>[Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: new Text('ILG60_B_01_00_04_00',
                          style: TextStyle(color: Colors.grey[400]),),
                      ),
                    ],
                  ),
                  Container(
                    //width: itemWidth,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: new Card(
                        elevation: 0.0,
                        color: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: new GestureDetector(
                          onTap: () {
                            _navigateAndDisplaySelection(context);
                          },
                          child: new ListTile(
                            leading: new Icon(Icons.search),
                            title: new Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text('ค้นหาใบแจ้งความ', style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey[500]),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ],
                )
            ),
            Expanded(
              child: new ConstrainedBox(
                constraints: const BoxConstraints.expand(),
                child: _buildDataResults(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}