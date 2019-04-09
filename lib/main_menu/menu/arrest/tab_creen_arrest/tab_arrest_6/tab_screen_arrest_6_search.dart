import 'package:flutter/material.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_5.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_6_section.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_6_suspect.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/tab_creen_arrest/tab_arrest_6/tab_screen_arrest_6_section.dart';

class TabScreenArrest6Search extends StatefulWidget {
  @override
  _TabScreenArrest6SearchState createState() => new _TabScreenArrest6SearchState();
}
class _TabScreenArrest6SearchState extends State<TabScreenArrest6Search>  {
  TabController tabController;
  TextEditingController controller = new TextEditingController();
  List<ItemsListArrest6Section> _searchResult = [];
  List<ItemsListArrest6Section> _itemsInit = [
    new ItemsListArrest6Section("ฐานความผิดมาตรา 203", "มีไว้ครอบครองซึ่งสินค้าไม่ได้เสียภาษี",[
      new ItemsListArrest6Suspect("นายเสนาะ อุตโม",2,false),
      new ItemsListArrest6Suspect("นายวสันต์ ศรีสุข",4,false),
      new ItemsListArrest6Suspect("นางสาวแค๊ปเฌอ อารี",5,false)
    ],[
      new ItemsListArrest5("สุรา",
        "สราแช่",
        "ชนิดเบียร์",
        "4.4",
        "ดีกรี",
        "hoegaarden",
        "",
        "SADLER S PEAKY BLINDER",
        0.5,
        "ลิตร",
        0,
        "",
        0,
        "",
        false,),
      new ItemsListArrest5(
          "สุรา",
          "สราแช่",
          "ชนิดเบียร์",
          "4.5",
          "ดีกรี",
          "hoegaarden",
          "",
          "SADLER S PEAKY BLINDER",
          0.7,
          "ลิตร",
          0,
          "",
          0,
          "",
          false)
    ],false),
    new ItemsListArrest6Section("ฐานความผิดมาตรา 204", "มีไว้ครอบครองซึ่งสินค้าไม่ได้เสียภาษีไม่ครบถ้วน",[
      new ItemsListArrest6Suspect("นายเสนาะ อุตมา",2,false),
      new ItemsListArrest6Suspect("นายอนุชา ไปวัด",3,false)
    ],[
      new ItemsListArrest5("สุรา",
        "สราแช่",
        "ชนิดเบียร์",
        "4.4",
        "ดีกรี",
        "hoegaarden",
        "",
        "SADLER S PEAKY BLINDER",
        0.5,
        "ลิตร",
        0,
        "",
        0,
        "",
        false,),
      new ItemsListArrest5(
          "สุรา",
          "สราแช่",
          "ชนิดเบียร์",
          "4.5",
          "ดีกรี",
          "hoegaarden",
          "",
          "SADLER S PEAKY BLINDER",
          0.7,
          "ลิตร",
          0,
          "",
          0,
          "",
          false)
    ], false)
  ];
  int _countItem = 0;
  List<ItemsListArrest6Section> _itemsData = [];
  List<bool> _value = [];

  @override
  void initState() {
    super.initState();
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    _itemsInit.forEach((userDetail) {
      if (userDetail.SectionName.contains(text) ||
          userDetail.SectionName.contains(text))
        _searchResult.add(userDetail);
    });
    setState(() {});
  }
  buildDataContent(index) {
    Color labelColor = Colors.grey[500];
    Color labelPreview = Color(0xff2e76bc);
    TextStyle textInputStyleTitle = TextStyle(
        fontSize: 16.0, color: Colors.black);
    TextStyle textInputStyleSub = TextStyle(fontSize: 14.0, color: labelColor);
    TextStyle textPreviewStyle = TextStyle(fontSize: 14.0, color: labelPreview);
    EdgeInsets paddingInputBox = EdgeInsets.only(top: 0.0, bottom: 0.0);
    EdgeInsets paddingLabel = EdgeInsets.only(top: 0.0);
    return Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: paddingLabel,
                    child: Text(_searchResult[index].SectionName,
                      style: textInputStyleTitle,),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(Icons.arrow_forward_ios,color: Colors.grey[300],size: 18,),
              ],
            ),
            Padding(
              padding: paddingInputBox,
              child: Text(
                _searchResult[index].SectionDetail,
                style: textInputStyleSub,),
            ),
          ],
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
        return InkWell(
          onTap: (){
            _navigateSelection(context,_searchResult[index].SectionName,_searchResult[index].SectionDetail,_searchResult[index].ItemSuspect);
          },
          child: Padding(
            padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
            child: Container(
              padding: EdgeInsets.all(22.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  border: Border(
                    top: BorderSide(color: Colors.grey[300], width: 1.0),
                    bottom: BorderSide(color: Colors.grey[300], width: 1.0),
                  )
              ),
              child: buildDataContent(index),
            ),
          ),
        );
      },
    );
  }

  _navigateSelection(BuildContext context,String title,String detail,items) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TabScreenArrest6Section(Title: title,Detail: detail,ItemsSuspect: items)),
    );
    //_itemsData=result;
    //Navigator.pop(context);
    if(result.toString()!="back"){
      //_itemsData = result;
      Navigator.pop(context,result);
    }
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
                onChanged: onSearchTextChanged,
              ),
            ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios,), onPressed: () {
              Navigator.pop(context,"back");
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
      ),
    )
    );
  }
}
