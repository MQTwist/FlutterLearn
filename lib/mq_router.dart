import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/widgets/algorithm/primary/primary_group/agent_sale_page.dart';
import 'package:flutter_application_1/page/widgets/me/black_list_page.dart';
import 'package:flutter_application_1/page/widgets/me/fans_page.dart';
import 'package:flutter_application_1/page/widgets/me/focus_page.dart';
import 'package:flutter_application_1/page/widgets/ui/animation/animations/animation_widgets_test.dart';
import 'package:flutter_application_1/page/widgets/ui/animation/animations/tweens/rect_tween_page.dart';
import 'package:flutter_application_1/page/widgets/ui/animation/animations/tweens/tween_animation_page.dart';
import 'package:flutter_application_1/page/widgets/ui/animation/animations/tweens/tween_mix_page.dart';
import 'package:flutter_application_1/page/widgets/ui/animation/animations/tweens/tween_position_page.dart';
import 'package:flutter_application_1/page/widgets/ui/animation/animations/tweens/tween_scale_page.dart';
import 'package:flutter_application_1/page/widgets/ui/base_ui/Cake.dart';
import 'package:flutter_application_1/page/widgets/ui/base_ui/RandomNums.dart';
import 'package:flutter_application_1/page/widgets/ui/base_ui/data_and_model_page.dart';
import 'package:flutter_application_1/page/widgets/ui/base_ui/repaint_boundary_page.dart';
import 'package:flutter_application_1/page/widgets/ui/base_ui/swiper_page.dart';
import 'package:flutter_application_1/page/widgets/ui/base_ui/text_icon_button_page.dart';
import 'package:flutter_application_1/page/widgets/ui/base_ui/ui_layout/RowAndColumn.dart';
import 'package:flutter_application_1/page/widgets/ui/base_ui/ui_layout/UILayout.dart';
import 'package:flutter_application_1/page/widgets/ui/base_ui/ui_layout/column_page.dart';
import 'package:flutter_application_1/page/widgets/ui/base_ui/ui_layout/container_page.dart';
import 'package:flutter_application_1/page/widgets/ui/base_ui/ui_layout/expanded_page.dart';
import 'package:flutter_application_1/page/widgets/ui/base_ui/ui_layout/list_view_page.dart';
import 'package:flutter_application_1/page/widgets/ui/base_ui/ui_layout/stateless_page.dart';

class MqRouter {
  static Map<String, WidgetBuilder> routerMap = {
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
    'Row': (context) => const RowAndColumn(),
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
    'DataAndModelPage': (context) => const DataAndModelPage(),
    'AgentSalePage': (context) => const AgentSalePage(),
    'RepaintBoundaryPage': (context) => const RepaintBoundaryPage(),
  };
}
