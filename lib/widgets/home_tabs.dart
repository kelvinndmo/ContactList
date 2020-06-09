import 'dart:io';

import 'package:contactlist/models/contact.dart';
import 'package:contactlist/providers/contace.dart';
import 'package:contactlist/screens/add_contact.dart';
import 'package:contactlist/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.people),
                  text: "Contact List",
                ),
                Tab(
                  icon: Icon(Icons.person_add),
                  text: "Invite",
                ),
                Tab(
                  icon: Icon(Icons.search),
                  text: "Search",
                )
              ],
            ),
            title: Text("Contacts List"),
          ),
          body: TabBarView(
            children: [
              Scaffold(
                body: Consumer<Contacts>(
                    child: Center(
                      child: FlatButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.person_add),
                        label: Text("Add Contact"),
                        color: Theme.of(context).accentColor,
                        textColor: Colors.white,
                      ),
                    ),
                    builder: (ctx, contacts, child) =>
                        contacts.contacts.length <= 0
                            ? child
                            : ListView.builder(
                                itemCount: contacts.contacts.length,
                                itemBuilder: (ctx, index) => ListTile(
                                    subtitle: Text(
                                        '${contacts.contacts[index].phone_number}'),
                                    title: Text(
                                        '${contacts.contacts[index].first_name} ${contacts.contacts[index].last_name}'),
                                    trailing: Icon(Icons.more_vert),
                                    leading: CircleAvatar(
                                      backgroundImage: FileImage(
                                        contacts.contacts[index].image,
                                      ),
                                    )),
                              )),
              ),
              AddContact(),
              Icon(Icons.directions_bike),
            ],
          )),
    );
  }
}
