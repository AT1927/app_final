import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> bikeRoutes = [
    'Route 1: Cumbre Volcan Galeras',
    'Route 2: Laguna Negra(Galeras)',
    'Route 3: Cumbre Volcan Azufral',
    'Route 4: Mocoa Putumayo',
    'Route 5: Paramo Morasurco',
    'Route 6: Circunvalar Galeras',
    'Route 7: Santa Isabel, La Cocha',
    'Route 8: Santa Teresita, La Cocha',
    'Route 9: Sibundoy Putumayo',
    'Route 10: Embalse Rio Bobo'
  ];

  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Bike Routes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: bikeRoutes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ListTile(
              leading: Icon(Icons.directions_bike),
              title: Text(bikeRoutes[index]),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Selected: ${bikeRoutes[index]}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}