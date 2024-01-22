import 'package:flores_assignment6/models/contact.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddContactScreen extends StatefulWidget {
  AddContactScreen({super.key, required this.contacts});

  List<Contact> contacts;

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final phoneRegExp = RegExp(r'^[0-9]{10}$');
  final emailRegExp =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  // Variables to track validation status
  bool isFirstNameValid = true;
  bool isLastNameValid = true;
  bool isPhoneNumberValid = true;
  bool isAddressValid = true;
  bool isEmailValid = true;

  void addContact() {
    // Reset validation status
    isFirstNameValid = firstNameController.text.isNotEmpty;
    isLastNameValid = lastNameController.text.isNotEmpty;
    isPhoneNumberValid = phoneRegExp.hasMatch(phoneNumberController.text);
    isAddressValid = addressController.text.isNotEmpty;
    isEmailValid = emailRegExp.hasMatch(emailController.text);

    if (isFirstNameValid &&
        isLastNameValid &&
        isPhoneNumberValid &&
        isAddressValid &&
        isEmailValid) {
      setState(() {
        widget.contacts.add(Contact(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          phoneNumber: '+63${phoneNumberController.text}',
          address: addressController.text,
          email: emailController.text,
        ));
        Navigator.pop(context, widget.contacts);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Contact"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              Text(
                'First Name',
                style: TextStyle(color: Colors.grey[500]),
              ),
              TextField(
                controller: firstNameController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              if (!isFirstNameValid)
                const Text(
                  'Please enter a valid first name.',
                  style: TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 10),
              Text(
                'Last Name',
                style: TextStyle(color: Colors.grey[500]),
              ),
              TextField(
                controller: lastNameController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              if (!isLastNameValid)
                const Text(
                  'Please enter a valid last name.',
                  style: TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 10),
              Text(
                'Phone Number',
                style: TextStyle(color: Colors.grey[500]),
              ),
              TextField(
                controller: phoneNumberController,
                decoration: const InputDecoration(
                  prefix: Text(
                    '+63',
                    style: TextStyle(fontSize: 13),
                  ),
                  border: OutlineInputBorder(),
                  labelText: '+63xxxxxxxxxx',
                ),
              ),
              if (!isPhoneNumberValid)
                const Text(
                  'Please enter a valid phone number.',
                  style: TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 10),
              Text(
                'Address',
                style: TextStyle(color: Colors.grey[500]),
              ),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              if (!isAddressValid)
                const Text(
                  'Please enter a valid address.',
                  style: TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 10),
              Text(
                'Email',
                style: TextStyle(color: Colors.grey[500]),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    labelText: 'e.g. judy@gmail.com',
                    border: OutlineInputBorder()),
              ),
              if (!isEmailValid)
                const Text(
                  'Please enter a valid email address.',
                  style: TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  addContact();
                },
                child: const Text("Add Contact"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
