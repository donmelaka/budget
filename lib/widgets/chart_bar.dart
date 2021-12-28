import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double amount;
  final String lable;
  final double percentage;

  const ChartBar(
      {Key? key,
      required this.amount,
      required this.lable,
      required this.percentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
              color: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: AlignmentDirectional.center,
            child: Column(
              children: [
                Container(
                  height: 20,
                  child: FittedBox(
                    child: Text('\$${amount.toStringAsFixed(0)}'),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  height: 60,
                  width: 10,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.0),
                            color: Colors.limeAccent,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      FractionallySizedBox(
                        heightFactor: percentage,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                CircleAvatar(
                  child: Text(lable),
                  radius: 12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
