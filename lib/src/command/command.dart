abstract class Command {

  // Comando a ejecutar
  Future<void> execute();

  Future<dynamic> getData();

}