import 'package:flutter/material.dart';
import 'package:fortune_gallery/_lib.dart';

class AddFortuneScreen extends StatefulWidget {
  final FortuneModel? data;
  const AddFortuneScreen({super.key, this.data});

  @override
  State<AddFortuneScreen> createState() => _AddFortuneScreenState();
}

class _AddFortuneScreenState extends State<AddFortuneScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    if (widget.data != null) {
      _controller.text = widget.data!.message ?? "";
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      floatingActionButton: Consumer(builder: (context, ref, _) {
        return GestureDetector(
          onTap: () async {
            hideKeyboard(context);
            if (_controller.text.trim().isNotEmpty) {
              final result = widget.data != null
                  ? await ref.read(manageFortuenVm).updateFortune(
                      data: FortuneModel(
                          id: widget.data!.id,
                          message: _controller.text.trim(),
                          dateCreated: widget.data!.dateCreated))
                  : await ref.read(manageFortuenVm).addFortune(
                      data: FortuneModel(
                          message: _controller.text.trim(),
                          dateCreated: DateTime.now()));
              if (result) {
                Navigator.pop(context);
              }
            } else {
              showToast("Start typing...");
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 6.sp),
            margin: EdgeInsets.only(bottom: eqH(100), right: eqW(20)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.black),
            child: CustomText(
              "Done",
              fontSize: 14.sp,
              color: AppColors.white,
            ),
          ),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      child: CustomScrollWidget(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                cursorHeight: 30.sp,
                cursorColor: AppColors.darkGrey,
                scrollPadding: const EdgeInsets.all(20.0),
                autofocus: true,
                keyboardType: TextInputType.multiline,
                maxLines: 99999,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.black, fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: eqW(10)),
                    hintText: 'Start writing...',
                    hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.textGrey,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
