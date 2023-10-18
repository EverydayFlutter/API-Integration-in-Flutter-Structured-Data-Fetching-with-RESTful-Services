import 'package:api_integration/services/api_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('U.S. Federal Government Spending'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 70,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: FutureBuilder(
              future: apiService.fetchAgencies(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.results.length,
                    itemBuilder: (context, index) {
                      var agency = snapshot.data!.results[index];
                      return Card(
                        // Wrap each list item with a card
                        elevation: 5, // Slight shadow
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20), // Add some padding
                          leading: CircleAvatar(
                            // Circular avatar at the start
                            backgroundColor: Colors.blue,
                            child: Text(
                              agency.abbreviation!.substring(0, 2),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          title: Text(
                            agency.agencyName!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align to the left/start side
                            children: [
                              const SizedBox(height: 5), // Add a bit of space
                              Text('Budget: \$' +
                                  agency.budgetAuthorityAmount!
                                      .toStringAsFixed(2))
                            ],
                          ),
                          // Slight grey for every second item for better visibility
                          onTap: () {
                            // Implement tap functionality if needed
                          },
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
