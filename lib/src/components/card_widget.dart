// Device Card Widget (digunakan dalam daftar pilihan)
import 'package:flutter/material.dart';

class DeviceCard extends StatelessWidget {
  final String name;
  final String location;
  final int devices;
  final String duration;
  final int consumption;
  final double percentChange;
  final IconData iconData;
  final Color iconBgColor;

  const DeviceCard({
    Key? key,
    required this.name,
    required this.location,
    required this.devices,
    required this.duration,
    required this.consumption,
    required this.percentChange,
    required this.iconData,
    required this.iconBgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool positive = percentChange >= 0;

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(12),
            child: Icon(iconData, size: 30, color: Colors.white),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey[800])),
                  SizedBox(height: 4),
                  Text(location,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                  SizedBox(height: 4),
                  Text('$devices devices | $duration',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600])),
                ]),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('$consumption Kw/h',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey[800])),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    positive ? Icons.arrow_upward : Icons.arrow_downward,
                    size: 14,
                    color: positive ? Colors.green.shade400 : Colors.red.shade400,
                  ),
                  SizedBox(width: 4),
                  Text(
                    '${percentChange.abs().toStringAsFixed(1)}%',
                    style: TextStyle(
                        color:
                            positive ? Colors.green.shade400 : Colors.red.shade400,
                        fontWeight: FontWeight.w600),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
