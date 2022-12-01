import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/Page/tabbar_controller.dart';
import 'package:flutter_application_1/Page/widgets/UI/Cake.dart';
import 'package:flutter_application_1/Page/widgets/UI/RandomNums.dart';
import 'package:flutter_application_1/Page/widgets/UI/swiper_page.dart';
import 'package:flutter_application_1/Page/widgets/UI/text_icon_button_page.dart';
import 'package:flutter_application_1/Page/widgets/UI/ui_layout/RowAndColumn.dart';
import 'package:flutter_application_1/Page/widgets/UI/ui_layout/UILayout.dart';
import 'package:flutter_application_1/Page/widgets/UI/ui_layout/column_page.dart';
import 'package:flutter_application_1/Page/widgets/UI/ui_layout/container_page.dart';
import 'package:flutter_application_1/Page/widgets/UI/ui_layout/expanded_page.dart';
import 'package:flutter_application_1/Page/widgets/UI/ui_layout/list_view_page.dart';
import 'package:flutter_application_1/Page/widgets/UI/ui_layout/stateless_page.dart';
import 'package:flutter_application_1/Page/widgets/animation/animations/animation_widgets_test.dart';
import 'package:flutter_application_1/Page/widgets/animation/animations/tweens/rect_tween_page.dart';
import 'package:flutter_application_1/Page/widgets/animation/animations/tweens/tween_mix_page.dart';
import 'package:flutter_application_1/Page/widgets/animation/animations/tweens/tween_position_page.dart';
import 'package:flutter_application_1/Page/widgets/animation/animations/tweens/tween_animation_page.dart';
import 'package:flutter_application_1/Page/widgets/animation/animations/tweens/tween_scale_page.dart';
import 'package:flutter_application_1/Page/widgets/me/black_list_page.dart';
import 'package:flutter_application_1/Page/widgets/me/fans_page.dart';
import 'package:flutter_application_1/Page/widgets/me/focus_page.dart';

void main() {
  //打开视觉调试开关
  debugPaintSizeEnabled = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mq app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
      ),
      home: const TabbarController(),
      routes: <String, WidgetBuilder>{
        'LikeNum': (context) => const RandomNums(),
        'UI/H': (context) => const UILayout(),
        'Cake': (context) => const Cake(),
        'R&C': (context) => const RowAndColumn(),
        'Fans': (context) => const FansPage(),
        'Focus': (context) => const FocusPage(),
        'BlackList': (context) => const BlackListPage(),
        'Stateless': (context) => const StatelessPage(
              backgroudColor: Colors.yellow,
              content: '我的StatelessWidget',
            ),
        'Column': (context) => const ColumnPage(),
        'Expanded': (context) => const ExpandedPage(),
        'Container': (context) => const ContainerPage(),
        'Tweens': (context) => const TweenAnimationPage(),
        'TweenPosition': (context) => const TweenPositionPage(),
        'TweenScale': (context) => const TweenScalePage(),
        'TweenMix': (context) => const TweenMixPage(),
        'TweenRect': (context) => const RectTweenPage(),
        'animTest': (context) => const AnimatedWidgetsTest(),
        'swiper': (context) => const SwiperPage(),
        'TextIconButton': (context) => const TextIconButtonPage(),
        'ListView': (context) => const ListViewPage(),
      },
    );
  }
}
