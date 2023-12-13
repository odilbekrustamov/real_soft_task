
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Data.dart';

class DecodedPage extends StatefulWidget {
  const DecodedPage({super.key});

  @override
  State<DecodedPage> createState() => _DecodedPageState();
}

class _DecodedPageState extends State<DecodedPage>  {
  TextEditingController _encodedController = TextEditingController();
  String username = "";
  String name = "";
  String uuid = "";

  void _decoded() {
    String jwt = _encodedController.text;

    AutoGenerate autoGenerate = decodeJwt(jwt);

    print('Decoded JWT:');
    print('Audience: ${autoGenerate.aud}');
    print('Subject: ${autoGenerate.sub}');
    print('User Info Name: ${autoGenerate.userInfo.name}');
    print('User Info Name: ${autoGenerate.userInfo.organization[0].name}');
    setState(() {
      name = autoGenerate.userInfo.organization[0].name;
      uuid = autoGenerate.userInfo.organization[0].uuid;
      username = autoGenerate.userInfo.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Decoded page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: _encodedController,
              decoration:
              InputDecoration(labelText: 'Enter encoded text'),
            ),
            SizedBox(width: 20,),
            ElevatedButton(
              onPressed: _decoded,
              child: Text('Encoded to decoded'),
            ),
            SizedBox(width: 20,),
            Text(
              "user name - ${username}"
            ),
            SizedBox(width: 20,),
            Text(
                "name - ${name}"
            ),
            SizedBox(width: 20,),
            Text(
                "uuid - ${uuid}"
            ),
          ],
        ),
      ),
    );
  }
}
