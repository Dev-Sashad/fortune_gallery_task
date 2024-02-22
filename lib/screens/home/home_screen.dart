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
  ScrollController controller = ScrollController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.addListener(() {
        if (controller.position.extentAfter < 100) {
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
      floatingActionButton: FloatingActionButton(
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
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: eqW(20)),
          child: Column(
            children: [
              VerticalSpace(eqH(20)),
              const CustomText(
                "My Fortunes",
                color: AppColors.black,
                textType: TextType.headerText,
              ),
              VerticalSpace(eqH(30)),
              Builder(builder: (c) {
                if (vm.viewState.isLoading) {
                  return GridView.builder(
                      itemCount: 10,
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.sp,
                        crossAxisSpacing: 10.sp,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          const QuiltedGridTile(2, 1),
                          const QuiltedGridTile(1, 1),
                          const QuiltedGridTile(1, 1),
                          const QuiltedGridTile(1, 1),
                          const QuiltedGridTile(1, 1),
                        ],
                      ),
                      itemBuilder: (BuildContext context, int index) =>
                          LoaderWidget(
                            width: double.maxFinite,
                            height: eqH(200),
                          ));
                } else if (vm.viewState.isError) {
                  return SizedBox(
                    height: screenHeight * 0.5,
                    child: RefreshWidget(
                      onPressed: () =>
                          ref.read(homeVm.notifier).getAllFortune(),
                    ),
                  );
                } else {
                  if (vm.data!.isEmpty) {
                    return const NoHistoryWidget();
                  } else {
                    return GridView.builder(
                        itemCount: vm.data!.length,
                        gridDelegate: SliverQuiltedGridDelegate(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.sp,
                          crossAxisSpacing: 10.sp,
                          repeatPattern: QuiltedGridRepeatPattern.inverted,
                          pattern: [
                            const QuiltedGridTile(2, 1),
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
                            ));
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
