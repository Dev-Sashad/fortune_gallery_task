import 'package:flutter/material.dart';
import 'package:fortune_gallery/_lib.dart';
import 'package:fortune_gallery/utils/extension.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeSreen extends ConsumerStatefulWidget {
  const HomeSreen({super.key});

  @override
  ConsumerState<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends ConsumerState<HomeSreen> with UIToolMixin {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController.addListener(() {
        if (_scrollController.position.extentAfter < 100) {
          ref.read(homeVm.notifier).getMoreFortune();
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(homeVm);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButton: Visibility(
        visible: vm.viewState.isIdle,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            navigationService.pushScreen(const AddFortuneScreen());
          },
          backgroundColor: AppColors.black,
          child: Icon(
            Icons.add,
            size: 30.sp,
            color: AppColors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: eqW(20)),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: eqH(10)),
                child: const CustomText(
                  "My Fortunes",
                  color: AppColors.black,
                  textType: TextType.largeText,
                ),
              ),
              Builder(builder: (c) {
                if (vm.viewState.isLoading) {
                  return Container(
                    margin: EdgeInsets.only(top: eqH(70)),
                    child: GridView.builder(
                        itemCount: 10,
                        gridDelegate: SliverQuiltedGridDelegate(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8.sp,
                          crossAxisSpacing: 8.sp,
                          repeatPattern: QuiltedGridRepeatPattern.same,
                          pattern: [
                            const QuiltedGridTile(1, 2),
                            const QuiltedGridTile(1, 1),
                            const QuiltedGridTile(1, 1),
                            const QuiltedGridTile(1, 1),
                            const QuiltedGridTile(1, 1),
                          ],
                        ),
                        itemBuilder: (BuildContext context, int index) =>
                            LoaderWidget(
                              width: double.maxFinite,
                              height: eqH(230),
                            )),
                  );
                } else if (vm.viewState.isError) {
                  return Center(
                    child: RefreshWidget(
                      onPressed: () =>
                          ref.read(homeVm.notifier).getAllFortune(),
                    ),
                  );
                } else {
                  if (vm.data!.isEmpty) {
                    return const Center(child: NoHistoryWidget());
                  } else {
                    return RefreshIndicator(
                      onRefresh: () async =>
                          ref.read(homeVm.notifier).refreshFortune(),
                      child: Container(
                        margin: EdgeInsets.only(top: eqH(70)),
                        child: GridView.builder(
                            itemCount: vm.data!.length,
                            controller: _scrollController,
                            gridDelegate: SliverQuiltedGridDelegate(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8.sp,
                              crossAxisSpacing: 8.sp,
                              repeatPattern: QuiltedGridRepeatPattern.same,
                              pattern: [
                                const QuiltedGridTile(1, 2),
                                const QuiltedGridTile(1, 1),
                                const QuiltedGridTile(1, 1),
                                const QuiltedGridTile(1, 1),
                                const QuiltedGridTile(1, 1),
                              ],
                            ),
                            itemBuilder: (BuildContext context, int i) =>
                                HomeTileWidget(
                                  data: vm.data![i],
                                  color: AppColors.randomColors[
                                      i % AppColors.randomColors.length],
                                  onLongPress: () => showCallToActionDialog(
                                    cont: context,
                                    title: "Hey!",
                                    message: "Would you like to delete this?",
                                    callback: () async {
                                      final v = await ref
                                          .read(manageFortuenVm)
                                          .deleteFortune(id: vm.data![i].id!);
                                      if (v) {
                                        showToast("deleted");
                                      }
                                    },
                                  ),
                                )),
                      ),
                    );
                  }
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
