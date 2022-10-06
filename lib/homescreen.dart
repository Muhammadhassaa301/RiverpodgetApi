import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodapi/data_provider.dart';
import 'package:riverpodapi/models/user_model.dart';

class homeScreen extends ConsumerWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(userDataProvider);
    return Scaffold(
        appBar: AppBar(title: Text('Riverpods')),
        body: _data.when(
          data: (_data) {
            List<Getapi> userList = _data.map((e) => e).toList();
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: userList.length,
                          itemBuilder: (_, index) {
                            return Card(
                              color: Colors.grey,
                              elevation: 0,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: ListTile(
                                title: Text(
                                  userList[index].title.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  userList[index].id.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                                trailing: Text(
                                    userList[index].description.toString(),
                                    style: TextStyle(color: Colors.white)),
                              ),
                            );
                          }))
                ],
              ),
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: (() => Center(
                child: CircularProgressIndicator(),
              )),
        ));
  }
}
