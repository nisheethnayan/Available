import 'package:flutter/material.dart';

class OutletCard extends StatelessWidget {
  final String name;
  final String location;
  final String image;
  final String distance;
  const OutletCard({
    super.key,
    required this.name,
    required this.location,
    required this.image,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: SizedBox(
        height: 200,
        child: Card(
          color: const Color.fromRGBO(220, 220, 220, 1),
          shadowColor: const Color.fromRGBO(0, 0, 0, 1),
          elevation: 12,
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Location: $location',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        'Distance: $distance km',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ]),
                SizedBox(
                  height: 150,
                  child: Card(
                    shadowColor: const Color.fromRGBO(0, 0, 0, 1),
                    elevation: 12,
                    shape: const CircleBorder(side: BorderSide(width: 2)),
                    clipBehavior: Clip.antiAlias,
                    child: Image(
                      fit: BoxFit.fill,
                      image: AssetImage(image),
                      width: 150,
                      alignment: Alignment.centerRight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
