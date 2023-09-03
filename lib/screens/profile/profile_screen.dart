import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String name;
  final String imageName;
  final String phone;
  final String email;
  final bool biometric;
  final String address;

  const Profile(
      {super.key,
      required this.name,
      required this.imageName,
      required this.phone,
      required this.email,
      required this.biometric,
      required this.address});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late String name = widget.name;
  late String imageName = widget.imageName;
  late String phone = widget.phone;
  late String email = widget.email;
  late bool biometric = widget.biometric;
  late String address = widget.address;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Profile',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 1,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: screenWidth * 0,
            horizontal: screenWidth * 0.12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: screenWidth * 0.2,
                backgroundImage: AssetImage(imageName),
              ),
              SizedBox(height: screenWidth * 0.05),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenWidth * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.phone),
                  const SizedBox(width: 8.0),
                  Text(phone),
                ],
              ),
              SizedBox(height: screenWidth * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.email),
                  const SizedBox(width: 8.0),
                  Text(email),
                ],
              ),
              SizedBox(height: screenWidth * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.fingerprint),
                  const SizedBox(width: 8.0),
                  Switch(
                    value: biometric,
                    onChanged: (value) {
                      setState(() {
                        biometric = !biometric;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: screenWidth * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.location_on),
                  const SizedBox(width: 8.0),
                  Text(
                    address,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
