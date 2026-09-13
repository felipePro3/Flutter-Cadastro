import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CadastroPage(),
    );
  }
}

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final usuarioController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmarSenhaController = TextEditingController();
  final telefoneController = TextEditingController();
  final dataController = TextEditingController();

  void cadastrar() {
    String usuario = usuarioController.text;
    String email = emailController.text;
    String senha = senhaController.text;
    String confirmarSenha = confirmarSenhaController.text;
    String telefone = telefoneController.text;
    String dataNascimento = dataController.text;

    if (senha != confirmarSenha) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("As senhas não são iguais."),
        ),
      );

      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Usuário $usuario cadastrado com sucesso!"),
      ),
    );

    print("Usuário: $usuario");
    print("Email: $email");
    print("Senha: $senha");
    print("Telefone: $telefone");
    print("Data de nascimento: $dataNascimento");
  }

  @override
  void dispose() {
    usuarioController.dispose();
    emailController.dispose();
    senhaController.dispose();
    confirmarSenhaController.dispose();
    telefoneController.dispose();
    dataController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cadastro",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),

            TextField(
              controller: usuarioController,
              decoration: const InputDecoration(
                labelText: "Usuário",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Senha",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: confirmarSenhaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Confirmar senha",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: telefoneController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(
                labelText: "Telefone",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: dataController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(
                labelText: "Data de nascimento",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: cadastrar,
              child: const Text("Cadastrar"),
            ),
          ],
        ),
      ),
    );
  }
}