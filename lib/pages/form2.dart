import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

// Clase principal que define el formulario de múltiples pasos
class Form2 extends StatefulWidget {
  Form2({super.key, required this.title});

  final String title;

  @override
  State<Form2> createState() => _Form2State();
}

class _Form2State extends State<Form2> {
  final _formKey = GlobalKey<FormBuilderState>(); // Clave global para el formulario
  int _currentStep = 0; // Indica el paso actual del formulario

  // Método para avanzar al siguiente paso
  void _nextStep() {
    if (_currentStep < 2) {
      setState(() => _currentStep += 1); // Avanza al siguiente paso
    } else {
      // Guarda y valida el formulario antes de mostrar el diálogo de confirmación
      if (_formKey.currentState?.saveAndValidate() ?? false) {
        _showFormDataDialog(); // Muestra los datos del formulario si es válido
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Completa todos los campos antes de enviar')),
        );
      }
    }
  }

  // Método para retroceder al paso anterior
  void _previousStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep -= 1); // Retrocede al paso anterior
    }
  }

  // Método para mostrar un diálogo con los datos del formulario
  void _showFormDataDialog() {
    final formData = _formKey.currentState?.value;

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Row(
            children: [
              const Icon(
                Icons.check_circle_outline, // Ícono de confirmación
                color: Colors.green,
              ),
              const SizedBox(width: 8),
              const Text('Formulario Enviado'),
            ],
          ),
          content: Text(
            'Email: ' +
                (formData?['email_txtBox'] ?? 'No disponible') +
                '\nAddress: ' +
                (formData?['address_txtBox'] ?? 'No disponible') +
                '\nMobile: ' +
                (formData?['mobile_txtBox'] ?? 'No disponible'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  // Método que construye los iconos de cada paso
  Widget _buildIcon(int step, String label) {
    IconData iconData;
    switch (step) {
      case 0:
        iconData = Icons.person;
        break;
      case 1:
        iconData = Icons.edit;
        break;
      case 2:
        iconData = Icons.upload;
        break;
      default:
        iconData = Icons.circle;
    }

    return Column(
      children: [
        // Contenedor circular con el ícono
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: _currentStep >= step ? Colors.blue : Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
          child: Icon(
            _currentStep > step ? Icons.check : iconData, // Muestra el ícono de verificación si ya pasó el paso
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: _currentStep >= step ? Colors.blue : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  // Método para construir el contenido según el paso actual
  Widget _buildCurrentStepContent() {
    switch (_currentStep) {
      case 0:
        return const FormBuilder(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Personal",
                  style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "Press contact item or the continue button",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        );
      case 1:
        return const FormBuilder(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Contact",
                  style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "Press upload item or the continue button",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        );
      case 2:
        // Formulario de entrada de datos (Email, Dirección, Móvil)
        return Column(
          children: [
            SizedBox(
              width: 600,
              child: FormBuilderTextField(
                name: 'email_txtBox',
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email_rounded,
                    color: Color.fromARGB(180, 100, 149, 237),
                  ),
                  labelText: 'Email',
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(180, 100, 149, 237),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(150, 173, 216, 230),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(180, 100, 149, 237),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 600,
              child: FormBuilderTextField(
                name: 'address_txtBox',
                maxLines: 5,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.house_rounded,
                    color: Color.fromARGB(180, 100, 149, 237),
                  ),
                  labelText: 'Address',
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(180, 100, 149, 237),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(150, 173, 216, 230),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(180, 100, 149, 237),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 600,
              child: FormBuilderTextField(
                name: 'mobile_txtBox',
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.mobile_friendly_rounded,
                    color: Color.fromARGB(180, 100, 149, 237),
                  ),
                  labelText: 'Mobile Nº',
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(180, 100, 149, 237),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(150, 173, 216, 230),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(180, 100, 149, 237),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                ),
              ),
            ),
          ],
        );

      default:
        return Container(); // Retorna un contenedor vacío si el paso es desconocido
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Salesians Sarrià - FORM 2'),
        backgroundColor: Colors.blueAccent,
      ),
      body: FormBuilder(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Barra de navegación para los pasos del formulario
              Row(
                children: [
                  for (int i = 0; i < 3; i++) ...[
                    Expanded(
                      child: Center(
                        child: _buildIcon(
                            i,
                            i == 0
                                ? 'Personal'
                                : i == 1
                                    ? 'Edición'
                                    : 'Subir'),
                      ),
                    ),
                    if (i < 2)
                      Expanded(
                        child: Container(
                          height: 2,
                          color: _currentStep > i
                              ? Colors.blue
                              : Colors.grey,
                        ),
                      ),
                  ],
                ],
              ),
              const SizedBox(height: 20),
              _buildCurrentStepContent(), // Muestra el contenido del paso actual
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentStep > 0)
                    ElevatedButton(
                      onPressed: _previousStep,
                      child: const Text('Anterior'),
                    ),
                  ElevatedButton(
                    onPressed: _nextStep, // Botón para avanzar
                    child: Text(_currentStep == 2 ? 'Enviar' : 'Siguiente'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
