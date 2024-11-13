import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

// Definición de la clase Form3, que es un StatefulWidget.
class Form3 extends StatefulWidget {
  Form3({super.key, required this.title});

  final String title;

  @override
  State<Form3> createState() => _Form3State();
}

// Definición del estado de Form3.
class _Form3State extends State<Form3> {
  final _formKey = GlobalKey<FormBuilderState>();  // Clave para gestionar el estado del formulario
  bool switchValue = false;  // Variable para gestionar el estado del switch

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra de navegación superior
      appBar: appbar(),
      body: SingleChildScrollView(  // Permite desplazarse por la página si el contenido excede el tamaño de la pantalla
        child: Center(
          child: Container(
            width: 500,  // Establece el ancho del contenedor
            padding: const EdgeInsets.all(16.0),  // Añade un padding alrededor del contenedor
            child: FormBuilder(  // Widget que gestiona el formulario
              key: _formKey,  // Asocia la clave de formulario
              child: Column(  // Columna que organiza los elementos de entrada
                children: [
                  appChoiceChip(),  // Componente de selección de chips
                  const SizedBox(height: 20),  // Espaciado entre los elementos
                  appSwitch(),  // Interruptor (Switch)
                  const SizedBox(height: 20),
                  appInputText(),  // Campo de texto de entrada
                  const SizedBox(height: 20),
                  appdropdown(),  // Menú desplegable (Dropdown)
                  const SizedBox(height: 20),
                  appRadioGroup(),  // Grupo de botones de radio
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Función para construir la AppBar.
  AppBar appbar() {
    return AppBar(
      centerTitle: true,  // Centra el título en la AppBar
      title: const Text('Sarrià Salesians 24/25 - FORM 3'),  // Título de la aplicación
      backgroundColor: Colors.blueAccent,  // Color de fondo de la AppBar
    );
  }

  // Función para construir los chips de selección.
  FormBuilderChoiceChip appChoiceChip() {
    return FormBuilderChoiceChip(
      padding: const EdgeInsets.all(3.0),
      name: 'choice_chips',  // Nombre del campo en el formulario
      decoration: InputDecoration(
        labelText: 'Choice Chips',  // Etiqueta del campo
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),  // Borde redondeado
      ),
      alignment: WrapAlignment.center,  // Alineación de los chips
      spacing: 10.0,  // Espaciado entre los chips
      runSpacing: 10.0,  // Espaciado entre las filas de chips
      backgroundColor: const Color.fromARGB(255, 4, 68, 120),  // Color de fondo de los chips
      selectedColor: Colors.green,  // Color cuando el chip está seleccionado
      showCheckmark: false,  // No muestra un checkmark en el chip
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),  // Bordes redondeados
        side: const BorderSide(color: Colors.transparent),  // Sin borde visible
      ),
      options: const [
        // Definición de las opciones disponibles para los chips
        FormBuilderChipOption(
          value: 'Flutter',
          avatar: Icon(
            Icons.flutter_dash_rounded,  // Ícono de Flutter
            color: Color.fromRGBO(255, 255, 255, 0.95),
          ),
          child: Text(
            'Linux',
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.95),
            ),
          ),
        ),
        // Otras opciones de chips...
      ],
    );
  }

  // Función para construir el switch (interruptor).
  FormBuilderSwitch appSwitch() {
    return FormBuilderSwitch(
      title: const Text('Switch'),  // Título del interruptor
      name: 'app_switch',  // Nombre del campo
      decoration: InputDecoration(
        labelText: 'App Switch',  // Etiqueta del campo
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),  // Borde redondeado
      ),
      onChanged: (value) {
        setState(() {
          switchValue = value ?? false;  // Actualiza el valor del switch
        });
      },
    );
  }

  // Función para construir el campo de texto de entrada.
  FormBuilderTextField appInputText() {
    return FormBuilderTextField(
      name: 'app_input_txt',  // Nombre del campo
      maxLength: 15,  // Longitud máxima de caracteres
      decoration: InputDecoration(
        labelText: 'Input Text',  // Etiqueta del campo
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),  // Borde redondeado
        prefix: const Text(
          'A   ',  // Prefijo de texto
          style: TextStyle(
            decoration: TextDecoration.underline,  // Subraya el prefijo
          ),
        ),
      ),
    );
  }

  // Función para construir el menú desplegable (dropdown).
  FormBuilderDropdown appdropdown() {
    return FormBuilderDropdown(
      decoration: InputDecoration(
        labelText: 'Dropdown',  // Etiqueta del campo
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),  // Borde redondeado
      ),
      name: 'app_dropdown',  // Nombre del campo
      items: const [
        DropdownMenuItem(
          value: 'option1',  // Opción 1
          child: Text('OPTION 1'),
        ),
        // Otras opciones del dropdown...
      ],
      onChanged: (value) {
        // Handle dropdown value change (opcional)
      },
    );
  }

  // Función para construir el grupo de botones de radio.
  FormBuilderRadioGroup appRadioGroup() {
    return FormBuilderRadioGroup(
        name: 'app_radio_group',  // Nombre del campo
        orientation: OptionsOrientation.vertical,  // Orientación vertical de las opciones
        decoration: InputDecoration(
          labelText: 'Radio Group',  // Etiqueta del campo
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),  // Borde redondeado
        ),
        options: const [
          FormBuilderFieldOption(
            value: 'OPTION 1',  // Opción 1
          ),
          // Otras opciones del radio group...
        ]);
  }
}
