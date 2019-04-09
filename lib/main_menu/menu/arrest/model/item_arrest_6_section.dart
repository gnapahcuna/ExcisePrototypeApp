import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_5.dart';
import 'package:prototype_app_pang/main_menu/menu/arrest/model/item_arrest_6_suspect.dart';

class ItemsListArrest6Section {
  String SectionName;
  String SectionDetail;
  List<ItemsListArrest6Suspect> ItemSuspect;
  List<ItemsListArrest5> ItemDatail;
  bool isCheck;

  ItemsListArrest6Section(this.SectionName,this.SectionDetail,this.ItemSuspect,this.ItemDatail,this.isCheck);
}