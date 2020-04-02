import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:jiarui_hotel/utils/date_format_base.dart';

// 刷新
class MyRefresh extends StatelessWidget {
  GlobalKey<EasyRefreshState> _easyRefreshKey =
  new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
  new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
  new GlobalKey<RefreshFooterState>();
  String now_time = formatDate(DateTime.now() ,[mm,'-',dd,' ',hh,':',nn]);

  var child;
  var onRefresh;
  var loadMore;
  MyRefresh({Key key, this.child, this.onRefresh, this.loadMore}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      key : _easyRefreshKey,
      behavior: ScrollOverBehavior(),
      refreshHeader: ClassicsHeader(
        key: _headerKey,
        refreshText: "下拉可以刷新",
        refreshReadyText: "释放立即刷新",
        refreshingText: "正在刷新" + "...",
        refreshedText: "刷新结束",
        moreInfo: "更新于" + now_time,
        bgColor: Colors.transparent,
        textColor: Colors.black87,
        moreInfoColor: Colors.black54,
        showMore: true,
      ),
      refreshFooter: ClassicsFooter(
        key: _footerKey,
        loadText: "上拉可以加载",
        loadReadyText: "释放立即加载",
        loadingText: "正在加载",
        loadedText: "全部加载完成",
        noMoreText: "全部加载完成",
        moreInfo: "更新于" + now_time,
        bgColor: Colors.transparent,
        textColor: Colors.black87,
        moreInfoColor: Colors.black54,
        showMore: true,
      ),
      child: child,
      onRefresh: onRefresh,
      loadMore: loadMore,
    );
  }
}

