import 'package:flutter/material.dart';

import 'api_crud_const.dart';
import 'api_crud_service.dart';

class ApiCRUDAddEditUserPage extends StatefulWidget {
  Map? userMap;

  ApiCRUDAddEditUserPage({super.key, this.userMap});

  @override
  State<ApiCRUDAddEditUserPage> createState() => _ApiCRUDAddEditUserPageState();
}

class _ApiCRUDAddEditUserPageState extends State<ApiCRUDAddEditUserPage> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _cityController = TextEditingController();

  final GlobalKey<FormState> _validationKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.userMap != null) {
      _nameController.text = widget.userMap![NAME];
      _cityController.text = widget.userMap![CITY];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add/Edit User'),
      ),
      body: Form(
        key: _validationKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                style: TextStyle(fontSize: 25),
                decoration: InputDecoration(
                  labelText: 'Enter Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(fontSize: 25),
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: 'Enter City',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter City';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_validationKey.currentState!.validate()) {
                      Map<String, dynamic> _userMap = Map();
                      _userMap[NAME] = _nameController.text.toString();
                      _userMap[CITY] = _cityController.text.toString();
                      if (widget.userMap != null) {
                        await ApiCrudService()
                            .updateUser(map: _userMap, id: widget.userMap![ID]);
                      } else {
                        await ApiCrudService().addUser(map: _userMap);
                      }
                      if (context.mounted) Navigator.pop(context, []);
                    }
                  },
                  child: Text('SUBMIT')),
            ],
          ),
        ),
      ),
    );
  }
}
