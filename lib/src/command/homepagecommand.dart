import 'package:proyect_topicos_mobile/src/command/command.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/homepage.dart';

class HomePageCommand implements Command{

  final Function _changeView; 

  HomePageCommand(this._changeView);

  @override
  Future<void> execute() async {
     _changeView(HomePage());
  }

  @override
  Future getData() {
    // TODO: implement getData
    throw UnimplementedError();
  }
}