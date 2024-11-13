import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Form1 extends StatelessWidget {
  Form1({super.key, required this.title}); // Constructor del formulario, recibe un título

  final String title;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Salesians Sarrià 24/25 - FORM 1"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView( // Permite el desplazamiento si el contenido es largo
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormBuilder( // Formulario utilizando el paquete flutter_form_builder
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título del formulario
                const Center(
                  child: Text(
                    "Driving Form",
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    "Form example",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),

                // Pregunta sobre la velocidad del vehículo con opciones de radio
                const Text(
                  "Please, provide the speed of the vehicle",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Select one of the given options:",
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(0.6)),
                ),
                const SizedBox(height: 10),
                FormBuilderRadioGroup( // Selector de radio buttons para velocidad
                  name: 'vehicle_speed_choice',
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  orientation: OptionsOrientation.vertical,
                  options: [
                    const FormBuilderFieldOption(
                        value: 'Above 40 Km/h', child: Text('Above 40 Km/h')),
                    const FormBuilderFieldOption(
                        value: 'Below 40 Km/h', child: Text('Below 40 Km/h')),
                    const FormBuilderFieldOption(
                        value: '0 Km/h', child: Text('0 Km/h')),
                  ],
                ),
                const SizedBox(height: 20),

                // Campo para ingresar observaciones con un TextField
                const Text(
                  "Enter remarks",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 600,
                  child: FormBuilderTextField( // Caja de texto para observaciones
                    name: 'remarks_txtbox',
                    decoration: InputDecoration(
                      labelText: 'Enter your remarks here',
                      fillColor: Colors.grey[200],
                      filled: true,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Pregunta sobre la velocidad máxima del vehículo con un dropdown
                const Text(
                  "Please, provide the max speed of the vehicle",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Select one of the given options:",
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(0.6)),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 600,
                  child: FormBuilderDropdown( // Selector de velocidad máxima con un dropdown
                    name: "max_speed",
                    decoration: const InputDecoration(
                      labelText: 'Select Maximum Speed',
                      border: OutlineInputBorder(),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: null, // Valor vacío para limpiar el campo
                        child: const Text("Select Maximum Speed"),
                      ),
                      DropdownMenuItem(
                        value: '200',
                        child: const Text("200 Km/h"),
                      ),
                      DropdownMenuItem(
                        value: '160',
                        child: const Text("160 Km/h"),
                      ),
                      DropdownMenuItem(
                        value: '120',
                        child: const Text("120 Km/h"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Pregunta sobre la velocidad del vehículo hace 1 hora con opciones de checkbox
                const Text(
                  "Please, provide the speed of the vehicle past 1 hour",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Select one or more of the given options:",
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(0.6)),
                ),
                const SizedBox(height: 10),
                FormBuilderCheckboxGroup( // Selector de múltiples opciones con checkboxes
                  name: "speed_selection",
                  orientation: OptionsOrientation.vertical,
                  options: [
                    FormBuilderFieldOption(
                        value: "20 Km/h", child: const Text("20 Km/h")),
                    FormBuilderFieldOption(
                        value: "30 Km/h", child: const Text("30 Km/h")),
                    FormBuilderFieldOption(
                        value: "40 Km/h", child: const Text("40 Km/h")),
                    FormBuilderFieldOption(
                        value: "50 Km/h", child: const Text("50 Km/h")),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
