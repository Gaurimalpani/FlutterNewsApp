import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shimmer/shimmer.dart'; // Import the shimmer library

class crudScreen extends StatefulWidget {
  const crudScreen({super.key});

  @override
  State<crudScreen> createState() => _crudScreenState();
}

class _crudScreenState extends State<crudScreen> {
  // text fields' controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();

  final CollectionReference _recipes =
      FirebaseFirestore.instance.collection('recipes');

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Date of News'),
                ),
                TextField(
                  controller: _instructionsController,
                  decoration: const InputDecoration(labelText: 'Headline'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Create'),
                  onPressed: () async {
                    final String name = _nameController.text;
                    final String instructions = _instructionsController.text;
                    if (name.isNotEmpty && instructions.isNotEmpty) {
                      await _recipes.add({
                        "name": name,
                        "instructions": instructions,
                      });

                      _nameController.text = '';
                      _instructionsController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nameController.text = documentSnapshot['name'];
      _instructionsController.text = documentSnapshot['instructions'];
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Card(
              elevation: 0.6,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration:
                        const InputDecoration(labelText: 'Date of News '),
                  ),
                  TextField(
                    controller: _instructionsController,
                    decoration: const InputDecoration(labelText: 'Headline'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: const Text('Update'),
                    onPressed: () async {
                      final String name = _nameController.text;
                      final String instructions = _instructionsController.text;
                      if (name.isNotEmpty && instructions.isNotEmpty) {
                        await documentSnapshot!.reference.update({
                          "name": name,
                          "instructions": instructions,
                        });

                        _nameController.text = '';
                        _instructionsController.text = '';
                        Navigator.of(context).pop();
                      }
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<void> _delete(DocumentSnapshot documentSnapshot) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Delete"),
          content: const Text("Are you sure you want to delete this bookmark?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                await documentSnapshot.reference.delete();
                Navigator.pop(context);
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _recipes.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Display shimmer effect while loading data
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: ListView.builder(
                itemCount: 10, // Show 10 shimmering items
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Container(
                      width: double.infinity,
                      height: 20.0,
                      color: Colors.grey,
                    ),
                    subtitle: Container(
                      width: double.infinity,
                      height: 12.0,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            );
          }

          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                final documentSnapshot = snapshot.data!.docs[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  child: Card(
                    elevation: 1,
                    child: ListTile(
                      title: Text(
                        documentSnapshot['name'],
                        textScaleFactor: 1.1,
                      ),
                      subtitle: Text(
                        documentSnapshot['instructions'],
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      onTap: () => _update(documentSnapshot),
                      onLongPress: () => _delete(documentSnapshot),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(child: Text('No bookmarks found'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _create,
        child: const Icon(Icons.add),
      ),
    );
  }
}
