import 'package:mobx/mobx.dart';

part "client_model.g.dart";

class Client = ClientBase with _$Client;

abstract class ClientBase with Store{
  @observable
  String email = "";
  @action
  changeEmail(String value) => email = value;

  @observable
  String password = "";
  @action
  changePassword(String value) => password = value;

  @observable
  String name = "";
  @action
  changename(String value) => name = value;


}
