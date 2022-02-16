import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user_tile.dart';
import 'package:flutter_crud/data/dummy_users.dart';
import '../models/user.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Map<String, User> users = {
      '1': User(
        id: '1',
        name: 'Maria',
        email: 'maria@gmail.com',
        avatarUrl:
        'https://cdn.dribbble.com/users/2531150/screenshots/7381472/media/be977f32a3f5abf4898f2c343ab7bfe0.jpg?compress=1&resize=1200x900&vertical=top',
      ),
      '2': User(
        id: '2',
        name: 'Flavia',
        email: 'flavia@gmail.com',
        avatarUrl:
        'https://cdn.dribbble.com/users/2531150/screenshots/7381483/media/498a13f429ddc746e6c072da892116ec.jpg?compress=1&resize=1200x900&vertical=top',
      ),
      '3': User(
        id: '3',
        name: 'Joao',
        email: 'joao@gmail.com',
        avatarUrl:
        'https://cdn.dribbble.com/users/1355613/screenshots/15252730/media/28f348daf9654c440f5dcf398d8e097a.jpg?compress=1&resize=1200x900&vertical=top',
      ),
    };



    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (ctx, i) => UserTile(users.values.elementAt(i)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
