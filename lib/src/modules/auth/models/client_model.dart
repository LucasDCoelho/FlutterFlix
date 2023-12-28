import 'package:mobx/mobx.dart';

part "client_model.g.dart";

class Client = ClientBase with _$Client;

abstract class ClientBase with Store{
  @observable
  String email = "";
  @action
  setEmail(String value) => email = value;

  @observable
  String password = "";
  @action
  setPassword(String value) => password = value;

  @observable
  String name = "";
  @action
  setName(String value) => name = value;


}
