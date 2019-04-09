import 'package:flutter/material.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_5.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_6_section.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_6_suspect.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/tab_creen_arrest/tab_arrest_6/tab_screen_arrest_6_search.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/tab_creen_arrest/tab_arrest_6/tab_screen_arrest_6_section.dart';

class TabScreenArrest6 extends StatefulWidget {
  bool onSaved;
  bool onEdited;
  bool onDeleted;
  TabScreenArrest6({
    Key key,
    @required this.onSaved,
    @required this.onEdited,
    @required this.onDeleted,
  }) : super(key: key);
  @override
  _TabScreenArrest6State createState() => new _TabScreenArrest6State();
}
class _TabScreenArrest6State extends State<TabScreenArrest6> {

  TextEditingController _editSearch = new TextEditingController();
  final FocusNode myFocusNodeSearch = FocusNode();
  List<ItemsListArrest6Section> _itemsInit = [
    new ItemsListArrest6Section("ฐานความผิดมาตรา 191", "ขายสุราที่ผลิตขึ้นโดยฝ่าฝืนมาตรา 153 วรรคหนึ่ง",[
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
    new ItemsListArrest6Section("ฐานความผิดมาตรา 192", "ซื้อสุราที่ผลิตขึ้นโดยฝ่าฝืนมาตรา 153 วรรคหนึ่ง",[
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
    ], false),
    new ItemsListArrest6Section("ฐานความผิดมาตรา 203", "มีไว้ครอบครองซึ่งสินค้าไม่ได้เสียภาษี",[
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
    ], false),
    new ItemsListArrest6Section("ฐานความผิดมาตรา 204", "ขายสินค้าที่มิได้เสียภาษี",[
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

  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    print("tab 6 Save: "+widget.onSaved.toString());
    print("tab 6 Edit: "+widget.onEdited.toString());
    print("tab 6 Delete: "+widget.onDeleted.toString());
  }

  @override
  void dispose() {
    super.dispose();
    myFocusNodeSearch.dispose();
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TabScreenArrest6Search()),
    );
    print("isSelected : "+isSelected.toString());
    if(result.toString()!="back") {
      setState(() {
        isSelected=true;
        _itemsInit = result;

      });

    }
  }
  _navigateSelection(BuildContext context,String title,String detail,items) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TabScreenArrest6Section(Title: title,Detail: detail,ItemsSuspect: items)),
    );
    setState(() {
     // _itemsInit = result;
    });

  }

  Widget _buildContent() {
    TextStyle textLabelEditNonCheckStyle = TextStyle(fontSize: 16.0, color: Colors.red[100]);
    Color labelColor = Colors.grey[500];
    Color labelPreview = Color(0xff2e76bc);
    TextStyle textInputStyleTitle = TextStyle(
        fontSize: 16.0, color: Colors.black);
    TextStyle textInputStyleSub = TextStyle(fontSize: 14.0, color: labelColor);
    EdgeInsets paddingInputBox = EdgeInsets.only(top: 0.0, bottom: 0.0);
    EdgeInsets paddingLabel = EdgeInsets.only(top: 0.0);
    return new Container(
      padding: EdgeInsets.only(bottom: 12.0),
      child: ListView.builder(
        itemCount: _itemsInit.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              _navigateSelection(context,_itemsInit[index].SectionName,_itemsInit[index].SectionDetail,_itemsInit[index].ItemSuspect);
            },
            child: SingleChildScrollView(
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
                  child: Stack(
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
                                  child: Text(_itemsInit[index].SectionName,
                                    style: textInputStyleTitle,),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              isSelected?Column(
                                children: <Widget>[
                                  Center(
                                      child: InkWell(
                                        onTap: () {
                                          //_navigateEdit(context);
                                        },
                                        child: Container(
                                            child: Text("แก้ไข", style: textLabelEditNonCheckStyle,)
                                        ),
                                      )
                                  ),
                                  Center(
                                      child: InkWell(
                                        onTap: () {
                                          //_navigateEdit(context);
                                        },
                                        child: Container(
                                            child: Text("ลบ", style: textLabelEditNonCheckStyle,)
                                        ),
                                      )
                                  ),
                                ],
                              ):
                              Icon(Icons.arrow_forward_ios,color: Colors.grey[300],size: 18,),
                            ],
                          ),
                          Padding(
                            padding: paddingInputBox,
                            child: Text(
                              _itemsInit[index].SectionDetail,
                              style: textInputStyleSub,),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyleTitle = TextStyle(
        fontSize: 16.0, color: Colors.black);
    return new WillPopScope(
      onWillPop: () {
        //
      },
      child: Scaffold(
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
                          child: new Text('ILG60_B_01_00_08_00',
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
              Container(
                padding: EdgeInsets.only(left: 22.0,right: 22.0,bottom: 12.0),
                child: Text('ข้อกล่าวหาที่ใช้งานมากที่สุด',style: textStyleTitle,),
              ),
              Expanded(
                child: ConstrainedBox(
                  constraints: const BoxConstraints.expand(),
                  child: _buildContent(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}