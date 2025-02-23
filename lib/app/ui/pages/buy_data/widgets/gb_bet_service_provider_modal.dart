import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nitrobills/app/controllers/bills/betting_controller.dart';
import 'package:nitrobills/app/data/models/bet_service_provider.dart';
import 'package:nitrobills/app/ui/utils/nb_colors.dart';
import 'package:nitrobills/app/ui/utils/nb_image.dart';
import 'package:nitrobills/app/ui/utils/nb_text.dart';

class GbBetServiceProviderModal extends StatelessWidget {
  const GbBetServiceProviderModal({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<BettingController>().initializeProvider(context);
    });
    return Material(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      color: NbColors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 19.h),
        child: GetBuilder<BettingController>(
          init: Get.find<BettingController>(),
          builder: (cntrl) {
            if (cntrl.status.value.isLoading) {
              return SizedBox(
                height: 200.h,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: NbColors.black,
                  ),
                ),
              );
            } else {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: _close,
                        child: SizedBox(
                          width: 24.r,
                          height: 24.r,
                          child: Center(
                              child: SvgPicture.asset(
                            NbSvg.close,
                            width: 14.r,
                          )),
                        ),
                      ),
                      Expanded(
                        child: NbText.sp16("Service Provider")
                            .w500
                            .black
                            .centerText,
                      ),
                      SizedBox(width: 24.r),
                    ],
                  ),
                  23.verticalSpace,
                  ...cntrl.providers.map(
                    (prov) => planListTile(prov),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget planListTile(BetServiceProvider provider) {
    return InkWell(
      onTap: () {
        _select(provider);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.asset(
                provider.image,
                width: 40.r,
                height: 40.r,
              ),
            ),
            13.horizontalSpace,
            NbText.sp16(provider.name).w500.black,
          ],
        ),
      ),
    );
  }

  void _select(BetServiceProvider provider) {
    Get.back(result: provider);
  }

  void _close() {
    Get.back();
  }
}
