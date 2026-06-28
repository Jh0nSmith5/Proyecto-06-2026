import 'dart:io';

void main() {
    Map<int, List<dynamic>> inventario = {
        1: ['Producto A', 10.5, 100],
        2: ['Producto B', 20.0, 50],
        3: ['Producto C', 15.75, 75],
    };
    Map<int, String> menu = {
        1: 'Mostrar inventario',
        2: 'Salir',
    };

    while (true) {
        print('\x1B[2J\x1B[0;0H');
        print('Bienvenido al sistema de inventario.');
        print('Seleccione una opción:');
        for (var entry in menu.entries) {
            print('${entry.key}. ${entry.value}');
        }
        String? opcion = stdin.readLineSync();

        switch (opcion) {
            case '1':
                print('\x1B[2J\x1B[0;0H');
                print('Inventario:');
                for (var entry in inventario.entries) {
                    print('ID: ${entry.key}, Nombre: ${entry.value[0]}, Precio: ${entry.value[1]}, Cantidad: ${entry.value[2]}');
                }
                print('Presione Enter para continuar...');
                stdin.readLineSync(); // Espera a que el usuario presione Enter antes de continuar
                break;
            case '2':
                print('\x1B[2J\x1B[0;0H');
                print('Saliendo del sistema de inventario.');
                return;
            default:
                print('\x1B[2J\x1B[0;0H');
                print('Opción inválida. Por favor, seleccione una opción válida.');
                print('Presione Enter para continuar...');
                stdin.readLineSync(); // Espera a que el usuario presione Enter antes de continuar
        }
    }
}