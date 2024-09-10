import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget {
  final String time;
  final IconData icon;
  final String status;
  final String temperature;

  const HourlyForecastItem({
    super.key,
    required this.time,
    required this.icon,
    required this.status,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
        child: SizedBox(
          width: 60,
          child: Column(
            children: [
              Text(
                time,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Icon(icon, size: 32),
              const SizedBox(height: 7),
              Text(
                status,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(temperature)
            ],
          ),
        ),
      ),
    );
  }
}
