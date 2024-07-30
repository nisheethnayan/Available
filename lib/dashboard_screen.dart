import "package:available/global_variables.dart";
import "package:available/outlet_card.dart";
import "package:flutter/material.dart";

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<String> filters = const [
    "All",
    "Fast Food",
    "Full Course",
    "Cafe",
    "falana",
    "dhimkana"
  ];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Text(
                    'Available',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(fontWeight: FontWeight.w300),
                      prefixIcon: Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(32))),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.black),
                        borderRadius:
                            BorderRadius.horizontal(left: Radius.circular(16)),
                      )),
                )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 60,
                child: ListView.builder(
                  itemCount: filters.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final filter = filters[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter = filter;
                          });
                          selectedFilter = filter;
                        },
                        child: Chip(
                          backgroundColor: selectedFilter == filter
                              ? const Color.fromARGB(45, 173, 173, 173)
                              : const Color.fromARGB(255, 220, 220, 220),
                          label: Text(filter),
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: outlets.length,
                  itemBuilder: (context, index) {
                    final outlet = outlets[index];
                    return OutletCard(
                      name: outlet['name'] as String,
                      location: outlet['location'] as String,
                      image: outlet['image'] as String,
                      distance: outlet['distance'] as String,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
