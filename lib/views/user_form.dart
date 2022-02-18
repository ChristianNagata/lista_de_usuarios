import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../provider/users.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};

  void _loadFormData(User user) {
    _formData['id'] = user.id;
    _formData['name'] = user.name;
    _formData['email'] = user.email;
    _formData['avatarUrl'] = user.avatarUrl;
  }

  @override
  Widget build(BuildContext context) {

    final route = ModalRoute.of(context);
    if (route!.settings.arguments != null) {
      final user = route.settings.arguments as User;
      _loadFormData(user);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['name'],
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Valor inválido';
                  }
                  if (value.trim().length <= 3) {
                    return 'No mínimo 3 caracteres';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: const InputDecoration(labelText: 'Email'),
                onSaved: (value) => _formData['email'] = value,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: const InputDecoration(labelText: 'Url do avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final isValid = _form.currentState!.validate();
          if (isValid) {
            _form.currentState!.save();
            Provider.of<Users>(context, listen: false).put(
              User(
                id: _formData['id'],
                name: _formData['name'],
                email: _formData['email'],
                avatarUrl: _formData['avatarUrl'],
              ),
            );
            Navigator.of(context).pop();
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
