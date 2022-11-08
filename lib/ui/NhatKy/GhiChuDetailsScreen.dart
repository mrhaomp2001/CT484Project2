import 'package:flutter/material.dart';
import '../../models/GhiChu.dart';

final Map<String, String> _ghiChuData = {
  'id': '',
  'title': '',
  'content': '',
};

class GhiChuDetailsScreen extends StatefulWidget {
  static const routeName = '/diaryDetails';
  final GhiChu ghiChu;
  const GhiChuDetailsScreen(this.ghiChu, {Key? key}) : super(key: key);

  @override
  State<GhiChuDetailsScreen> createState() => _GhiChuDetailsScreenState();
}

class _GhiChuDetailsScreenState extends State<GhiChuDetailsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Diary'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              _submit();
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 5,
            bottom: 5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: widget.ghiChu.title,
                      style: const TextStyle(
                        fontSize: 28,
                      ),
                      validator: (value) {},
                      onSaved: (value) {
                        _ghiChuData['title'] = value!;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: widget.ghiChu.content,
                      maxLines: 16,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      validator: (value) {},
                      onSaved: (value) {
                        _ghiChuData['content'] = value!;
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _ghiChuData['id'] = widget.ghiChu.id!;
    _formKey.currentState!.save();

    print(_ghiChuData);
  }
}
