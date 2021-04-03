import 'package:app_cadastro/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:app_cadastro/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:app_cadastro/routes/app_route.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);
  @override
  Widget build(BuildContext context) {
    final avatar = user.avatar == null || user.avatar.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatar));

    return Dismissible(
      background: Container(color: Colors.blue[100]),
      key: Key(user.id),
      onDismissed: (direction) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Excluir Usuario'),
            content: Text('Usuário excluido com sucesso!'),
            actions: <Widget>[
              FlatButton(
                child: Text('Fechar'),
                onPressed: () {
                  Provider.of<Users>(context, listen: false).remove(user);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );

        //users.remove(user)
      },
      child: ListTile(
        leading: avatar,
        title: Text(user.name),
        subtitle: Text(user.year),
        trailing: Container(
          width: 48,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.USER_FORM,
                    arguments: user,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
