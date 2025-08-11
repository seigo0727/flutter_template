import 'package:flutter/material.dart';
import '/../../../../core/constants/constants.dart';
import '/../../../../core/theme/theme.dart';
import '/../../../../core/utils/utils.dart';
import '/../../../../core/widgets/widgets.dart';
import '../../parameters/ui_parameters.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // データの読み込み状態を管理するフラグ
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // 3秒後に読み込みが完了したと仮定
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: _isLoading ? _buildShimmerList() : _buildContentList(),
      ),
      title: 'ホーム',
      showDrawer: UiParameters.showDrawer,
      showEndDrawer: UiParameters.showEndDrawer,
      currentIndex: 0,
    );
  }

  // --------------------------------------------------
  // Shimmer効果を表示するウィジェット
  // --------------------------------------------------
  Widget _buildShimmerList() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!, // Shimmerの基本色
      highlightColor: Colors.grey[100]!, // Shimmerのハイライト色
      child: ListView.builder(
        itemCount: 20, // 表示するアイテム数
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // プロフィール画像部分
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                ),
                SizedBox(width: 16),
                // タイトルとサブタイトル部分
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // タイトルを模した長方形
                      SizedBox(
                        height: 16,
                        width: double.infinity,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      // サブタイトルを模した長方形
                      SizedBox(
                        height: 12,
                        width: 200,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // --------------------------------------------------
  // 読み込み完了後に表示される実際のコンテンツ
  // --------------------------------------------------
  Widget _buildContentList() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text('${index + 1}'),
          ),
          title: Text('アイテム ${index + 1}'),
          subtitle: const Text('これは読み込み完了後のコンテンツです。'),
        );
      },
    );
  }}
