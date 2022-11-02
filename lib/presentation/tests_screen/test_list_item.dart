import 'package:flutter/material.dart';
import 'package:hatching/domain/test_item/test_item.cg.dart';
import 'package:hatching/utils/fonts.dart';
import 'package:hatching/utils/resourses.dart';
import 'package:lottie/lottie.dart';

class SingleTestListItem extends StatelessWidget {
  final TestSingleItem item;
  final Function(TestSingleItem test) onTestPressed;

  const SingleTestListItem({
    super.key,
    required this.item,
    required this.onTestPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () => onTestPressed(item),
        child: Row(
          children: [
            _image(),
            _text(),
            _trailing(),
          ],
        ),
      ),
    );
  }

  Expanded _text() => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.name,
                style: AppFonts.textMedium(fontWeight: FontWeight.w700),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                item.description,
                style: AppFonts.textMedium(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      );

  Widget _image() => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          item.previewUrl,
          height: 60,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return SizedBox(
                height: 60,
                width: 60,
                child: Lottie.asset(AppAnimations.loading),
              );
            }
          },
        ),
      );

  Widget _trailing() => ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: const Material(
          color: Colors.black12,
          child: InkWell(
            child: Icon(
              Icons.chevron_right,
              color: Colors.black45,
            ),
          ),
        ),
      );
}
