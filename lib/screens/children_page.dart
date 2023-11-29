import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../bloc/child_bloc.dart';
import '../bloc/child_event.dart';
import '../bloc/child_state.dart';
import '../models/child.dart';

class ChildrenPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  ChildrenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ChildBloc, ChildState>(
        builder: (context, state) {

          /// show no children text when the list is empty
          if (state.children.isEmpty) {
            return const Center(
              child: Text("No children. Please add"),
            );
          }

          return ListView.separated(
            itemCount: state.children.length,
            itemBuilder: (context, index) {
              var child = state.children[index];
              return ListTile(
                tileColor: Colors.black12,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                title: Text(
                  child.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(child.country),
                ),
                trailing: Text(
                  child.isNice ? 'Nice' : 'Naughty',
                  style: TextStyle(
                      color: child.isNice ? Colors.green : Colors.red),
                ),
                onTap: () {
                  ///toggle the status of the child to 'Nice' or 'Naughty'
                  BlocProvider.of<ChildBloc>(context)
                      .add(ToggleChildStatus(index));
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 10,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Add a Child'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                    ),
                    TextField(
                      controller: countryController,
                      decoration: const InputDecoration(labelText: 'Country'),
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      //validate name input
                      if (nameController.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Please input name");
                        return;
                      }

                      //validate country input
                      if (countryController.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Please input country");
                      }

                      ///add child to the list
                      BlocProvider.of<ChildBloc>(context).add(
                        AddChild(
                          Child(
                            name: nameController.text,
                            country: countryController.text,
                          ),
                        ),
                      );

                      ///clear the inputs
                      nameController.clear();
                      countryController.clear();
                      Navigator.of(context).pop();
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
