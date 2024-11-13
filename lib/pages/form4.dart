import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart'; // Paquete para formularios en Flutter
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart'; // Paquete con campos adicionales para formularios

class Form4 extends StatelessWidget {
  Form4({super.key, required this.title}); // Constructor que toma el título

  final String title;

  // Lista estática de países para el autocompletado
  static const List<String> allCountries = [
    'Afghanistan', 'Albania', 'Algeria', 'American Samoa', 'Andorra', 'Angola',
    'Anguilla', 'Antarctica', 'Argentina', 'Armenia', 'Australia', 'Austria',
    'Azerbaijan', 'Bahamas', 'Bahrain', 'Bangladesh', 'Barbados', 'Belgium',
    'Belize', 'Benin', 'Bolivia', 'Bosnia and Herzegovina', 'Botswana', 'Brazil',
    'Brunei', 'Bulgaria', 'Burkina Faso', 'Burundi', 'Cambodia', 'Canada', 'Chile',
    'China', 'Colombia', 'Cuba', 'Cyprus', 'Czech Republic', 'Denmark', 'Ecuador',
    'Egypt', 'El Salvador', 'Estonia', 'Ethiopia', 'Finland', 'France', 'Germany',
    'Greece', 'Hungary', 'Iceland', 'India', 'Indonesia', 'Iran', 'Iraq', 'Ireland',
    'Israel', 'Italy', 'Jamaica', 'Japan', 'Jordan', 'Kazakhstan', 'Kenya', 'Mexico',
    'Nepal', 'Netherlands', 'New Zealand', 'Norway', 'Pakistan', 'Panama', 'Peru',
    'Poland', 'Portugal', 'Qatar', 'Romania', 'Russia', 'Saudi Arabia', 'Singapore',
    'South Africa', 'Spain', 'Sri Lanka', 'Sudan', 'Sweden', 'Switzerland', 'Turkey',
    'United Kingdom', 'United States', 'Uruguay', 'Venezuela', 'Vietnam', 'Yemen',
    'Zambia', 'Zimbabwe'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(), // Llama al método para crear el AppBar
      body: SingleChildScrollView( // Hace el formulario desplazable
        child: Center(
          child: Container(
            width: 500, // Ancho fijo para la forma
            padding: const EdgeInsets.all(16.0), // Espaciado alrededor del formulario
            child: FormBuilder(
              child: SingleChildScrollView( // Desplazamiento dentro del formulario
                child: Column(
                  children: [
                    appAutocomplete(), // Campo de autocompletado
                    const SizedBox(height: 20),
                    appDateTimePicker(), // Selector de fecha y hora
                    const SizedBox(height: 20),
                    appDateRangePicker(), // Selector de rango de fechas
                    const SizedBox(height: 20),
                    appTimePicker(), // Selector de solo hora
                    const SizedBox(height: 20),
                    appFilterChips(), // Filtros con chips
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // AppBar del formulario
  AppBar appBar() {
    return AppBar(
      centerTitle: true, // Centra el título
      title: const Text('Salesians Sarrià 24/25 - FORM 4'),
      backgroundColor: Colors.blueAccent, // Color de fondo del AppBar
    );
  }

  // Campo de autocompletado que sugiere países
  FormBuilderTypeAhead<String> appAutocomplete() {
    return FormBuilderTypeAhead<String>(
      decoration: InputDecoration(
        labelText: 'Autocomplete', // Etiqueta del campo
        hintText: 'Type a country name', // Texto de sugerencia
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), // Borde redondeado
      ),
      name: 'country', // Nombre del campo en FormBuilder
      itemBuilder: (context, country) {
        return ListTile(
          title: Text(country), // Muestra el país en la lista de sugerencias
        );
      },
      suggestionsCallback: (query) {
        if (query.isNotEmpty) {
          var lowercaseQuery = query.toLowerCase();
          return allCountries.where((country) {
            return country.toLowerCase().contains(lowercaseQuery);
          }).toList(growable: false)
            ..sort((a, b) => a
                .toLowerCase()
                .indexOf(lowercaseQuery)
                .compareTo(b.toLowerCase().indexOf(lowercaseQuery)));
        } else {
          return allCountries; // Devuelve todos los países si la consulta está vacía
        }
      },
    );
  }

  // Selector de fecha
  FormBuilderDateTimePicker appDateTimePicker() {
    return FormBuilderDateTimePicker(
      inputType: InputType.date, // Solo fecha
      decoration: InputDecoration(
        hintText: 'Date Picker', // Texto sugerido
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: const Icon(Icons.calendar_month_rounded), // Icono del calendario
      ),
      name: 'dateTime', // Nombre del campo en FormBuilder
    );
  }

  // Selector de rango de fechas
  FormBuilderDateRangePicker appDateRangePicker() {
    return FormBuilderDateRangePicker(
      decoration: InputDecoration(
        hintText: 'Date Range', // Texto sugerido
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: const Icon(Icons.close_rounded), // Icono para cerrar el rango
      ),
      name: 'dateRange', // Nombre del campo en FormBuilder
      firstDate: DateTime.now(), // Fecha inicial
      lastDate: DateTime(2025), // Fecha final
    );
  }

  // Selector de hora
  FormBuilderDateTimePicker appTimePicker() {
    return FormBuilderDateTimePicker(
      inputType: InputType.time, // Solo hora
      decoration: InputDecoration(
        hintText: 'Time Picker', // Texto sugerido
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: const Icon(Icons.access_time_rounded), // Icono del reloj
      ),
      name: 'time', // Nombre del campo en FormBuilder
    );
  }

  // Filtro con chips seleccionables
  FormBuilderFilterChip appFilterChips() {
    return FormBuilderFilterChip(
      name: 'filter_chips', // Nombre del campo en FormBuilder
      padding: const EdgeInsets.all(3.0),
      decoration: InputDecoration(
        labelText: 'Filter Chips', // Etiqueta
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      spacing: 10.0, // Espaciado entre los chips
      runSpacing: 10.0, // Espaciado entre filas
      backgroundColor: const Color.fromARGB(255, 4, 68, 120), // Color de fondo de los chips
      selectedColor: Colors.green, // Color de los chips seleccionados
      showCheckmark: false, // No mostrar marca de verificación
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Bordes redondeados
        side: const BorderSide(color: Colors.transparent),
      ),
      options: [
        FormBuilderChipOption(
          value: 'Flutter',
          child: Text(
            'Flutter',
            style: TextStyle(color: Colors.white), // Color del texto en el chip
          ),
        ),
        FormBuilderChipOption(
          value: 'Android',
          child: Text(
            'Android',
            style: TextStyle(color: Colors.white),
          ),
        ),
        FormBuilderChipOption(
          value: 'ChromeOS',
          child: Text(
            'ChromeOS',
            style: TextStyle(color: Colors.white),
          ),
        ),
        FormBuilderChipOption(
          value: 'iOS',
          child: Text(
            'iOS',
            style: TextStyle(color: Colors.white),
          ),
        ),
        FormBuilderChipOption(
          value: 'Windows',
          child: Text(
            'Windows',
            style: TextStyle(color: Colors.white),
          ),
        ),
        FormBuilderChipOption(
          value: 'Linux',
          child: Text(
            'Linux',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
