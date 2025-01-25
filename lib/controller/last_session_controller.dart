import 'package:insta_dam/main.dart';
import 'package:insta_dam/screens/loading_screen.dart';
import 'package:insta_dam/services/sql_service.dart';

Future<void> lastSessionController(route) async {
  SqlService().saveSesionPath(route);
  SqlService.selectSessionPath();
  LoadingScreen().getRoute();
}
