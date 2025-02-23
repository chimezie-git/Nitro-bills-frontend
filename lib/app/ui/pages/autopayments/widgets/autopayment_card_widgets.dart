import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nitrobills/app/ui/pages/autopayments/models/autopay.dart';
import 'package:nitrobills/app/ui/utils/nb_text.dart';

class AutopaymentCardWidget extends StatelessWidget {
  final void Function() onTap;
  final Autopay autopay;

  const AutopaymentCardWidget({
    super.key,
    required this.onTap,
    required this.autopay,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 163.h,
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: const Color(0xFFFAFAFA),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 64.r,
                    height: 64.r,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 8.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        image: DecorationImage(
                            image: AssetImage(autopay.serviceProvider.image))
                        // color: NbColors.primary,
                        ),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NbText.sp16(autopay.serviceType.name).w600.black,
                        const Spacer(),
                        NbText.sp16(autopay.name).w500.black,
                        const Spacer(),
                        NbText.sp14(autopay.number).w400.black,
                        const Spacer(flex: 2),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NbText.sp16("Last payment on 23-06-2023").w500.black,
                NbText.sp18("₦1200").w600.black,
              ],
            )
          ],
        ),
      ),
    );
  }
}
