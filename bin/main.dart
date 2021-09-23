import 'dart:developer';
import 'dart:io';
import 'cliente.dart';

void main(List<String> arguments) {
  menuPrincipal(true);
}

void menuPrincipal(bool condicao) {
  print("\x1B[2J\x1B[0;0H");
  //RECUPERA LISTA DE USUARIO
  List<Usuario>? usuarios = Usuario.usuarios;
  if (condicao) {
    if (usuarios.isNotEmpty) {
      print("#USUARIOS: ${usuarios.length}  #");
    }
    print("+++++++ SEJA BEM VINDO AO PORTAL DE USUARIOS ++++++++");
    print("DIGITE O NUMERO CORRESPONDENTE A OPERAÇÃO");
    print(
        " 1 - EXIBIR USUARIOS \n 2 - CADASTRAR \n 3 - SAIR \n DIGITE ABAIXO \n");
    String? dados = stdin.readLineSync();
    print("VOCE DIGITOU: $dados");

    opcaoSelecionadaInicio(dados, usuarios);
  } else {
    encerrarPrograma();
  }
}

//VERIFICA SE LISTA NÃO ESTA VAZIA
String verificarLista(List<Usuario> usuarios) {
  if (usuarios.isNotEmpty) {
    return "\n 3 - ALTERAR \n 4 - EXCLUIR ";
  }
  return "";
}

//EXIBE A LISTA DE USUARIOS
void exibirListaUsuarios(List<Usuario> usuarios) {
  if (usuarios.isNotEmpty) {
    print("***** TOTAL DE UsuarioS :  ${usuarios.length} *****");
    for (var i = 0; i < usuarios.length; i++) {
      log("ENTROU NO IF(exibirListaUsuarios) E DEPOIS FOR");
      print("$i - ${usuarios[i].nome}");
    }
    print("####################################");
    print(" 1- EXIBIR DETALHES DOS USUARIOS \n 2- VOLTAR AO MENU PRINCIPAL");
    print("DIGITE A OPERAÇÃO");
    String? saida = stdin.readLineSync();
    if (saida == "1") {
      print("DIGITE O NUMERO DO USUARIO QUE DESEJA VISUALIZAR");
      String? saida = stdin.readLineSync();
      exibirUsuario(usuarios[int.parse(saida!)], int.parse(saida));
    } else {
      menuPrincipal(true);
    }
  } else {
    log("ENTROU NO ELSE(exibirListaUsuarios)");
    print("### VOCE NÃO POSSUI USUARIOS CADASTRADOS ###");
    print("### DESEJA CADASTRAR NOVO USUARIO ###");
    print("### 1- SIM ###  2-NÃO ###");
    String? saida = stdin.readLineSync();
    if (saida == "1") {
      cadastrarUsuario(usuarios);
    } else {
      menuPrincipal(true);
    }
  }
}

//EXIBE O USUARIO
void exibirUsuario(Usuario usuario, int position) {
  log("ENTROU NO IF(exibirListaUsuarios) E DEPOIS FOR");
  print("________________________________________");
  print("### DADOS DO USUARIO ###");
  print("### NOME: ${usuario.nome}");
  print("### EMAIL: ${usuario.email}");
  print("### TELEFONE: ${usuario.telefone}");
  print("________________________________________");
  print(
      " 1- ALTERAR USUARIO \n 2- EXCLUIR USUARIO \n 3- VOLTAR AO MENU PRINCIPAL");
  print("DIGITE O NUMERO CORRESPONDENTE A OPERAÇÃO");
  String? saida = stdin.readLineSync();
  opcaoSelecionadaDadosCliente(saida, usuario, position);
// CONTINUAR APARTIR DAQUI
}

// DIRECIONA AS OPÇÕES SELECIONADAS PELO USUARIO
void opcaoSelecionadaInicio(String? dados, List<Usuario> usuarios) {
  print("\x1B[2J\x1B[0;0H");
  switch (dados) {
    case "1":
      exibirListaUsuarios(usuarios);
      break;
    case "2":
      cadastrarUsuario(usuarios);
      break;
    case "3":
      encerrarPrograma();
      break;
  }
}

// DIRECIONA AS OPÇÕES SELECIONADAS PELO USUARIO
void opcaoSelecionadaDadosCliente(
    String? dados, Usuario usuario, int position) {
  print("\x1B[2J\x1B[0;0H");
  switch (dados) {
    case "1":
      alterarUsuario(usuario, position);
      break;
    case "2":
      deletarUsuario(usuario);
      break;
    case "3":
      menuPrincipal(true);
      break;
  }
}

//DELETA USUARIO
void deletarUsuario(Usuario usuario) {
  usuario.excluir(usuario);
  exibeMensagem("CLIENTE DELETADO COM SUCESSO!");
}

//ALTERA USUARIO
void alterarUsuario(Usuario usuario, int position) {
  print("DIGITE O NOME: nome atual => ${usuario.nome}");
  String? nome = stdin.readLineSync();
  print("\x1B[2J\x1B[0;0H");
  print("DIGITE O EMAIL: email atual => ${usuario.email}");
  String? email = stdin.readLineSync();
  print("\x1B[2J\x1B[0;0H");
  print("DIGITE O TELEFONE: telefone atual => ${usuario.telefone}");
  String? telefone = stdin.readLineSync();
  print("\x1B[2J\x1B[0;0H");

  if (nome!.isNotEmpty) {
    usuario.nome = nome;
  }
  if (email!.isNotEmpty) {
    usuario.email = email;
  }
  if (telefone!.isNotEmpty) {
    usuario.telefone = telefone;
  }

  usuario.alterar(usuario, position);
  exibeMensagem("CLIENTE ALTERADO COM SUCESSO!");
}

//DEFINE O A OPÇÃO DO USUARIO
void escolhaUsuario(bool caso) {
  if (caso) {
  } else {}
}

//CADASTRA UM NOVO USUARIO
void cadastrarUsuario(List<Usuario> usuarios) {
  print("\x1B[2J\x1B[0;0H");
  print("+++++++ SEJA BEM VINDO AO CADASTRO ++++++++");
  print("DIGITE O NOME");
  String? nome = stdin.readLineSync();
  print("\x1B[2J\x1B[0;0H");
  print("DIGITE O EMAIL");
  String? email = stdin.readLineSync();
  print("\x1B[2J\x1B[0;0H");
  print("DIGITE O TELEFONE");
  String? telefone = stdin.readLineSync();
  print("\x1B[2J\x1B[0;0H");

  Usuario usuario = Usuario(nome!, email!, telefone!);
  usuario.cadastrar(usuario);
  exibeMensagem("CADASTRO REALIZADO COM SUCESSO!");
}

//CHAMADO TODA VEZ QUE REALIZA UMA OPERAÇÃO
void exibeMensagem(String mensagem) {
  print("#############################################");
  print("### $mensagem ###");
  print("#############################################");
  print("DIGITE QUALQUER TECLA PARA CONTINUAR...");
  stdin.readLineSync();
  menuPrincipal(true);
}

// ENCERRA A APLICAÇÃO
void encerrarPrograma() {
  print("#############################################");
  print("### OBRIGADO POR USAR OS PRODUTOS FSDEV :) ###");
  print("#############################################");
  exit(0);
}
