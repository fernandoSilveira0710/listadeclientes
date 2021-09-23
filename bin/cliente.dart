import 'dart:developer';

class Usuario {
  String _nome;
  String _telefone;
  String _email;
  static List<Usuario> usuarios = [];

  String get nome => _nome;

  set nome(String nome) {
    _nome = nome;
  }

  String get email => _email;
  set email(String email) {
    _email = email;
  }

  String get telefone => _telefone;
  set telefone(String telefone) {
    _telefone = telefone;
  }

  Usuario(this._nome, this._email, this._telefone);

// CADASTRA USUARIOS EM UMA LISTA
  cadastrar(Usuario usuario) {
    log("CADASTRANDO Usuario $usuario");
    usuarios.add(usuario);
  }

//ALTERA USUARIOS EM UMA LISTA RECEBENDO O usuario
  alterar(Usuario usuario, int position) {
    usuarios[position] = usuario;
    log("ALTERANDO usuario $usuario");
  }

  //ALTERA USUARIOS EM UMA LISTA RECEBENDO O usuario
  excluir(Usuario usuario) {
    log("ALTERANDO usuario $usuario");
    usuarios.remove(usuario);
  }
}
