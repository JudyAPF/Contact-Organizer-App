import 'package:flores_assignment6/models/contact.dart';
import 'package:flores_assignment6/screens/add_contact_screen.dart';
import 'package:flores_assignment6/screens/view_contact.dart';
import 'package:flutter/material.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  List<Contact> contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Organizer"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              // Navigate to the add contact screen
              var result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddContactScreen(contacts: contacts),
                ),
              );

              // Check if the result is not null and update the contacts
              if (result != null) {
                setState(() {
                  contacts = result;
                });
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(
                  contacts[index].firstName[0] + contacts[index].lastName[0]),
            ),
            title: Text(
                "${contacts[index].firstName} ${contacts[index].lastName}"),
            subtitle: Text(contacts[index].phoneNumber),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewContactScreen(contacts: contacts),
                ),
              );
            },
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                // Show delete confirmation dialog
                _showDeleteDialog(index);
              },
            ),
          );
        },
      ),
    );
  }

  void _showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Contact"),
          content: const Text("Are you sure you want to delete this contact?"),
          actions: [
            TextButton(
              onPressed: () {
                // Dismiss the dialog
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Delete the contact and update the list
                setState(() {
                  contacts.removeAt(index);
                });
                // Dismiss the dialog
                Navigator.of(context).pop();
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
