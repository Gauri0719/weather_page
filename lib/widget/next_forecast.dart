import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NextForecast extends StatefulWidget {
  const NextForecast({
    super.key,
    required this.day,
    required this.maxTemp,
    required this.minTemp,
   required this.iconUrl
  });


  final String day;
  final String maxTemp;
  final String minTemp;
  final String iconUrl;

  @override
  State<NextForecast> createState() => _NextForecastState();
}

class _NextForecastState extends State<NextForecast> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Text(widget.day,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                )),
          ),
          Expanded(
            child: Row(
              children: [
                Image.network(
                  widget.iconUrl,
                  width: 30,
                  height: 30,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.location_off, color: Colors.white, size: 20);
                  },
                ),
                Spacer(),
                Text('${widget.maxTemp}  ',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    )),
                Text('  ${widget.minTemp}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}