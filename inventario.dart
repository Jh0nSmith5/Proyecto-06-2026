import 'dart:io';

void main() {
  Map<int, List<dynamic>> inventario = {
    1: ['Producto A', 10.5, 100],
    2: ['Producto B', 20.0, 50],
    3: ['Producto C', 15.75, 75],
  };
  Map<int, String> menu = {
    1: 'Mostrar inventario',
    2: 'Agregar producto',
    3: 'Eliminar producto',
    4: 'Actualizar stock',
    5: 'Salir',
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
          print(
            'ID: ${entry.key}, Nombre: ${entry.value[0]}, Precio: ${entry.value[1]}, Cantidad: ${entry.value[2]}',
          );
        }
        print('Presione Enter para continuar...');
        stdin
            .readLineSync(); // Espera a que el usuario presione Enter antes de continuar
        break;
      case '2':
        print('\x1B[2J\x1B[0;0H');
        print('Ingresa el nombre del producto: ');
        String? nombre = stdin.readLineSync();
        if (nombre == null || nombre.isEmpty) {
          print('El nombre del producto deben ser palabras.');
          print('Presione Enter para continuar...');
          stdin.readLineSync();
          continue;
        }
        print('Ingresa el precio del producto: ');
        String? precioinput = stdin.readLineSync();
        if (precioinput == null || precioinput.isEmpty) {
          print('El precio deben ser numeros.');
          print('Presione Enter para continuar...');
          stdin.readLineSync();
          continue;
        }
        double? precio = double.tryParse(precioinput);
        print('Ingresa la cantidad de existencias del producto: ');
        String? cantidadinput = stdin.readLineSync();
        if (cantidadinput == null || cantidadinput.isEmpty) {
          print('La cantidad de existencias deben ser numeros.');
          print('Presione Enter para continuar...');
          stdin.readLineSync();
          continue;
        }
        int? cantidad = int.tryParse(cantidadinput);
        if (precio != null && cantidad != null) {
          int id = inventario.keys.last + 1;
          inventario[id] = [nombre, precio, cantidad];
        } else {
          print(
            'Datos invalidos, asegurese que el precio, cantidad y nombre sean validos.',
          );
          print('Presione Enter para continuar...');
          stdin.readLineSync();
          continue; // Salta a la siguiente iteración del bucle para que el usuario pueda intentar nuevamente
        }
        print('Producto agregado! :)');
        print('Presione Enter para continuar...');
        stdin.readLineSync();
        break;
      case '3':
        print('\x1B[2J\x1B[0;0H');
        print('Ingresa el ID del producto a eliminar: ');
        String? idEliminarInput = stdin.readLineSync();
        if (idEliminarInput == null || idEliminarInput.isEmpty) {
          print('El ID deben ser numeros.');
          print('Presione Enter para continuar...');
          stdin.readLineSync();
          continue;
        }
        int? idEliminar = int.tryParse(idEliminarInput);
        if (idEliminar == null) {
          print('ID inválido. Asegúrese de ingresar un número válido.');
          print('Presione Enter para continuar...');
          stdin.readLineSync();
          continue;
        } else {
          for (var entry in inventario.entries) {
            if (entry.key == idEliminar) {
              inventario.remove(entry.key);
              print('Producto eliminado! :)');
              print('Presione Enter para continuar...');
              stdin.readLineSync();
              break;
            }
          }
        }
        break;
      case '4':
        print('\x1B[2J\x1B[0;0H');
        print('Ingresa el ID del producto a actualizar: ');
        String? idActualizarInput = stdin.readLineSync();

        if (idActualizarInput == null || idActualizarInput.isEmpty) {
          print('El ID es inválido.');
          print('Presione Enter para continuar...');
          stdin.readLineSync();
          continue;
        }

        int? idActualizar = int.tryParse(idActualizarInput);

        if (idActualizar == null) {
          print('ID inválido, ingrese un número válido (ejemplo: 1, 2, 3).');
          print('Presione Enter para continuar...');
          stdin.readLineSync();
          continue;
        }

        bool encontrado = false;

        for (var entry in inventario.entries) {
          if (entry.key == idActualizar) {
            encontrado = true;

            print('Ingrese la nueva cantidad de existencias del producto:');
            String? cantidadActualizadaInput = stdin.readLineSync();

            if (cantidadActualizadaInput == null ||
                cantidadActualizadaInput.isEmpty) {
              print('Cantidad inválida, la cantidad está vacía.');
              print('Presione Enter para continuar...');
              stdin.readLineSync();
              break;
            }

            int? cantidadActualizada = int.tryParse(cantidadActualizadaInput);

            if (cantidadActualizada == null) {
              print(
                'Cantidad inválida, asegúrese de ingresar un número entero.',
              );
              print('Presione Enter para continuar...');
              stdin.readLineSync();
              break;
            }

            inventario[entry.key]![2] = cantidadActualizada;

            print('¡Stock actualizado! :)');
            print('Presione Enter para continuar...');
            stdin.readLineSync();

            break;
          }
        }

        if (!encontrado) {
          print(
            'Producto no encontrado, por favor verifica el ID e intenta nuevamente.',
          );
          print('Presione Enter para continuar...');
          stdin.readLineSync();
        }

        break;
      case '5':
        print('\x1B[2J\x1B[0;0H');
        print('Saliendo del sistema de inventario.');
        return;
      default:
        print('\x1B[2J\x1B[0;0H');
        print('Opción inválida. Por favor, seleccione una opción válida.');
        print('Presione Enter para continuar...');
        stdin
            .readLineSync(); // Espera a que el usuario presione Enter antes de continuar
    }
  }
}
