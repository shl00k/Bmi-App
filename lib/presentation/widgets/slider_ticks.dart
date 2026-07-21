import 'package:bmi_app/theme/color_tokens.dart';
import 'package:flutter/material.dart';

class SliderTicks extends StatefulWidget {
  const SliderTicks({
    super.key,
    this.tickSpacing = 16,
    this.isCustomDivision = true,
    required this.minimumValue,
    required this.maximumValue,
    required this.selectedValue,
    required this.majorTicksDivision,
    required this.midTicksDivision,
    required this.onChanged,
  });

  final double tickSpacing;
  final int minimumValue;
  final int maximumValue;
  final int selectedValue;
  final int majorTicksDivision;
  final int midTicksDivision;
  final ValueChanged<int> onChanged;
  final bool isCustomDivision;

  @override
  State<SliderTicks> createState() => _SliderTicksState();
}

class _SliderTicksState extends State<SliderTicks> {
  final controller = ScrollController();

  void _onScroll() {
    final value =
        widget.minimumValue + (controller.offset / widget.tickSpacing).round();

    widget.onChanged(value);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.jumpTo(
        (widget.selectedValue - widget.minimumValue) * widget.tickSpacing,
      );
    });
    controller.addListener(_onScroll);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Stack(
        alignment: .topCenter,
        children: [
          NotificationListener<ScrollEndNotification>(
            onNotification: (notification) {
              final tagetTick = (controller.offset / widget.tickSpacing)
                  .round();
              controller.animateTo(
                tagetTick * widget.tickSpacing,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
              return true;
            },
            child: LayoutBuilder(
              builder: (context, constraints) {
                final constraintPadding = constraints.maxWidth / 2;

                return ListView.builder(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.maximumValue - widget.minimumValue + 1,
                  padding: .symmetric(horizontal: constraintPadding),
                  itemBuilder: (context, index) {
                    final value = widget.minimumValue + index;
                    final isMajorTick = value % widget.majorTicksDivision == 0;
                    final isMidTick = value % widget.midTicksDivision == 0;

                    return SizedBox(
                      width: widget.tickSpacing,
                      child: Column(
                        mainAxisAlignment: .start,
                        crossAxisAlignment: .center,
                        children: [
                          SizedBox(
                            height: 28,
                            width: 16,
                            child: Center(
                              child: Container(
                                width: 2,
                                height: isMajorTick
                                    ? 24
                                    : isMidTick
                                    ? 12
                                    : 8,
                                decoration: BoxDecoration(
                                  color: ColorTokens.secondary50,
                                  borderRadius: .circular(1),
                                ),
                              ),
                            ),
                          ),
                          if (isMajorTick)
                            FittedBox(
                              child: Text(
                                widget.isCustomDivision
                                    ? (value / widget.majorTicksDivision)
                                          .toInt()
                                          .toString()
                                    : value.toString(),
                                style: Theme.of(context).textTheme.labelSmall!
                                    .copyWith(color: ColorTokens.secondary50),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            width: 4,
            height: 28,
            decoration: BoxDecoration(
              color: ColorTokens.primary50,
              borderRadius: .circular(2),
            ),
          ),
        ],
      ),
    );
  }
}
