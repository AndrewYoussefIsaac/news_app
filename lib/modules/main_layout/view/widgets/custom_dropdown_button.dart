import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/core/utilities/app_colors.dart';
import 'package:news_app/core/utilities/app_fonts.dart';
import 'package:news_app/core/utilities/app_images.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });
  final Map<Object, String> items;
  final Object selectedValue;
  final Function(Object?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        height: 56.h,
        decoration: BoxDecoration(
          border: BoxBorder.all( color: AppColors.white, width: 1.5.w ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Center(
          child: DropdownButton(
            value: selectedValue , // initial value
            isExpanded: true ,
            underline: SizedBox.shrink() ,
            icon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w  ),
              child: SvgPicture.asset( AppImages.dropdownArrow , width: 11.w , height: 11.h , ),
            ) ,
            dropdownColor: AppColors.black , //// color of dropdown list
            items: items.entries.map(
                (entry) => DropdownMenuItem<Object>(
                  value: entry.key ,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w  ),
                    child: Text(
                      entry.value ,
                      style: AppFonts.medium20.copyWith( color: AppColors.white ),
                    ),
                  ) ,
              ) ,
            ).toList() ,  
            onChanged: onChanged ,
          ),
        ),
      ),
    );
  }
}
