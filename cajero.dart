import 'dart:io';

void LimpiaPantalla(){
  print('\x1B[2J\x1B[0;0H');
}

void SaltarLinea() {
  print('Presione Enter para continuar...');
  stdin.readLineSync();
}

class CuentaBancaria {
  String titular;
  int cuenta;
  double _saldo = 181.41;

  CuentaBancaria(this.titular, this.cuenta);

  void depositar(){
  LimpiaPantalla();
  print('Ingrese la cantidad a depositar');
  String? depositoInput = stdin.readLineSync();
  if (depositoInput == null || depositoInput.isEmpty){
    print('Cantidad invalida, ingrese una cantidad de dinero');
    SaltarLinea();
  } else {
    double? deposito = double.tryParse(depositoInput);
    if (deposito == null){
      print('Deposito invalido, por favor ingrese una cantidad de dinero valida');
      SaltarLinea();
    } else {
      _saldo = _saldo + deposito;
      print('El deposito fue exitoso\n Tu nuevo saldo es: $_saldo');
      SaltarLinea();
    }
  }
}

  void retirar(){
    LimpiaPantalla();
    print('Ingrese la cantidad a retirar');
    String? retiroInput = stdin.readLineSync();
    if (retiroInput == null || retiroInput.isEmpty){
      print('Retiro invalido, ingrese una cantidad valida por favor');
      SaltarLinea();
    } else {
      double? retiro = double.tryParse(retiroInput);
      if (retiro == null){
        print('Retiro invalido, ingrese una cantidad valida por favor');
        SaltarLinea();
      } else {
        if (retiro > _saldo){
          print('La cantidad a retirar es mayor al saldo actual, operacion invalida, por favor ingrese una cantidad valida');
          SaltarLinea();
        } else{
          _saldo = _saldo - retiro;
          print('El retiro ha sido exitoso! Su nuevo saldo es de: $_saldo');
          SaltarLinea();
        }
      }
    }
  }

  void consultarCuenta(){
    LimpiaPantalla();
    print('El titular de esta cuenta es $titular , el numero de cuenta es $cuenta , y su saldo es de $_saldo');
    SaltarLinea();
  }
}

void main(){
  CuentaBancaria cuenta = CuentaBancaria('Cesar', 230023);
  bool encendido = true;
  while (encendido == true){
  LimpiaPantalla();
  print('Bienvenido al cajero automatico\n Por favor selecciona una opcion: ');
  print('1:Depositar\n2:Retirar\n3:Consultar cuenta\n4:Salir');
  String? opcion = stdin.readLineSync();
  switch(opcion){
    case '1':
    cuenta.depositar();
    break;
    case '2':
    cuenta.retirar();
    break;
    case '3':
    cuenta.consultarCuenta();
    break;
    case '4':
    print('Vuelva pronto');
    encendido = false;
    break;
    default:
    print('Opcion no valida, por favor ingrese una de las opciones disponibles');
    continue;
  }
}}