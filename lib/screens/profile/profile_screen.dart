import 'package:ecommerce/services/api_services.dart';
import 'package:ecommerce/services/shared_data.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.person),
                  ),
                  Container(
                      child: Column(
                    children: [
                      Text(
                          ApiServices().loginModel?.data?.username.toString() ??
                              'No Name'),
                      Text(SharedData.getEmail()),
                      Text(ApiServices().loginModel?.data?.phone.toString() ??
                          'No Phone'),
                    ],
                  )),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  await SharedData.setEmail("naskdfsdf");
                  setState(() {});
                },
                child: const Text("Set"),
              ),
            ],
          )),
    );
  }
}
