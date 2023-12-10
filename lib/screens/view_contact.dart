import 'package:flores_assignment6/models/contact.dart';
import 'package:flutter/material.dart';

class ViewContactScreen extends StatelessWidget {
  const ViewContactScreen({Key? key, required this.contacts}) : super(key: key);
  final List<Contact> contacts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Contact"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildReadOnlyTextField("First Name", contacts.first.firstName),
              _buildReadOnlyTextField("Last Name", contacts.first.lastName),
              _buildReadOnlyTextField(
                  "Phone Number", contacts.first.phoneNumber),
              _buildReadOnlyTextField("Address", contacts.first.address),
              _buildReadOnlyTextField("Email", contacts.first.email),
              const SizedBox(height: 16),
               
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReadOnlyTextField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          TextFormField(
            initialValue: value,
            readOnly: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(8.0),
            ),
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
