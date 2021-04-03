import 'package:app_cadastro/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider;
import 'package:app_cadastro/provider/users.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['year'] = user.year;
    }
  }

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;

    _loadFormData(user);

    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de Usuário'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final isValid = _form.currentState.validate();
                if (isValid) {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text('Atenção'),
                      content:
                          Text('Tem certeza que deseja adicionar o usuário?'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Confirmar'),
                          onPressed: () {
                            _form.currentState.save();
                            Provider.of<Users>(context, listen: false).put(User(
                              id: _formData['id'],
                              name: _formData['name'],
                              year: _formData['year'],
                            ));
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text('Cancelar'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Form(
              key: _form,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    initialValue: _formData['name'],
                    decoration: InputDecoration(labelText: 'Nome'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nome obrigatorio';
                      }
                      if (value.trim().length < 3) {
                        return 'Nome muito pequeno. Minimo 3 letras';
                      }
                      return null;
                    },
                    onSaved: (value) => _formData['name'] = value,
                  ),
                  TextFormField(
                    initialValue: _formData['year'],
                    decoration: InputDecoration(labelText: 'Ano de Nascimento'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ano obrigatorio';
                      }
                      if (value.trim().length < 4 || value.trim().length > 4) {
                        return 'Ano invalido';
                      }
                      return null;
                    },
                    onSaved: (value) => _formData['year'] = value,
                  ),
                ],
              ),
            )));
  }
}
