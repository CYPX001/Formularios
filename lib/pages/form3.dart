import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Form3 extends StatefulWidget {
  Form3({super.key, required this.title});

  final String title;

  @override
  State<Form3> createState() => _Form3State();
}

class _Form3State extends State<Form3> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 500,
            padding: const EdgeInsets.all(16.0),
            child: FormBuilder(
              child: Column(
                children: [
                  appChoiceChip(),
                  const SizedBox(height: 20),
                  appSwitch(),
                  const SizedBox(height: 20),
                  appInputText(),
                  const SizedBox(height: 20),
                  appdropdown(),
                  const SizedBox(height: 20),
                  appRadioGroup(),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.upload_rounded),
          backgroundColor: Colors.blueAccent,
          onPressed: () {}),
    );
  }

  AppBar appbar() {
    return AppBar(
      centerTitle: true,
      title: const Text('Sarrià Salesians 24/25'),
      backgroundColor: Colors.blueAccent,
    );
  }

  FormBuilderChoiceChip appChoiceChip() {
    return FormBuilderChoiceChip(
      padding: const EdgeInsets.all(3.0),
      name: 'choice_chips',
      decoration: InputDecoration(
        labelText: 'Choice Chips',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
      alignment: WrapAlignment.center,
      spacing: 10.0,
      runSpacing: 10.0,
      backgroundColor: const Color.fromARGB(255, 4, 68, 120),
      selectedColor: Colors.green,
      showCheckmark: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Colors.transparent),
      ),
      options: const [
        FormBuilderChipOption(
          value: 'Flutter',
          avatar: Icon(
            Icons.flutter_dash_rounded,
            color: Color.fromRGBO(255, 255, 255, 0.95),
          ),
          child: Text(
            'Linux',
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.95),
            ),
          ),
        ),
        FormBuilderChipOption(
          value: 'Android',
          avatar: Icon(
            Icons.android_rounded,
            color: Color.fromRGBO(255, 255, 255, 0.95),
          ),
          child: Text(
            'Android',
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.95),
            ),
          ),
        ),
        FormBuilderChipOption(
          value: 'ChromeOS',
          avatar: Icon(
            Icons.laptop_chromebook_rounded,
            color: Color.fromRGBO(255, 255, 255, 0.95),
          ),
          child: Text(
            'ChromeOS',
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.95),
            ),
          ),
        ),
        FormBuilderChipOption(
          value: 'iOS',
          avatar: Icon(
            Icons.apple_rounded,
            color: Color.fromRGBO(255, 255, 255, 0.95),
          ),
          child: Text(
            'iOS',
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.95),
            ),
          ),
        ),
        FormBuilderChipOption(
          value: 'Windows',
          avatar: Icon(
            Icons.window_rounded,
            color: Color.fromRGBO(255, 255, 255, 0.95),
          ),
          child: Text(
            'Windows',
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.95),
            ),
          ),
        ),
        FormBuilderChipOption(
          value: 'Linux',
          avatar: Icon(
            Icons.line_axis_rounded,
            color: Color.fromRGBO(255, 255, 255, 0.95),
          ),
          child: Text(
            'Linux',
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.95),
            ),
          ),
        ),
      ],
    );
  }

  FormBuilderSwitch appSwitch() {
    return FormBuilderSwitch(
      title: const Text('Switch'),
      name: 'app_switch',
      decoration: InputDecoration(
        labelText: 'App Switch',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onChanged: (value) {
        setState(() {
          switchValue = value ?? false;
        });
      },
    );
  }

  FormBuilderTextField appInputText() {
    return FormBuilderTextField(
      name: 'app_input_txt',
      maxLength: 15,
      decoration: InputDecoration(
        labelText: 'Input Text',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        prefix: const Text(
          'A   ',
          style: TextStyle(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  FormBuilderDropdown appdropdown() {
    return FormBuilderDropdown(
      decoration: InputDecoration(
        labelText: 'Dropdown',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
      name: 'app_dropdown',
      items: const [
        DropdownMenuItem(
          value: 'option1',
          child: Text('OPTION 1'),
        ),
        DropdownMenuItem(
          value: 'option2',
          child: Text('OPTION 2'),
        ),
        DropdownMenuItem(
          value: 'option3',
          child: Text('OPTION 3'),
        ),
        DropdownMenuItem(
          value: 'option4',
          child: Text('OPTION 4'),
        ),
      ],
      onChanged: (value) {
        // Handle dropdown value change
      },
    );
  }

  FormBuilderRadioGroup appRadioGroup() {
    return FormBuilderRadioGroup(
        name: 'app_radio_group',
        orientation: OptionsOrientation.vertical,
        decoration: InputDecoration(
          labelText: 'Radio Group',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
        options: const [
          FormBuilderFieldOption(
            value: 'OPTION 1',
          ),
          FormBuilderFieldOption(
            value: 'OPTION 2',
          ),
          FormBuilderFieldOption(
            value: 'OPTION 3',
          ),
          FormBuilderFieldOption(
            value: 'OPTION 4',
          )
        ]);
  }
}
