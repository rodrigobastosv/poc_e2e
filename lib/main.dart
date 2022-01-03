import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name',
                ),
                validator: (value) => value!.isEmpty ? 'Required Field' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                validator: (value) => value!.isEmpty ? 'Required Field' : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                validator: (value) => value!.isEmpty ? 'Required Field' : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                validator: (value) => value!.isEmpty ? 'Required Field' : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password Confirmation',
                ),
              ),
              const SizedBox(height: 24),
              Builder(builder: (ctx) {
                return ElevatedButton(
                  onPressed: () {
                    final form = _formKey.currentState!;
                    if (form.validate()) {
                      form.reset();
                      ScaffoldMessenger.of(ctx).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Form submitted!',
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text('Send Information'),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
