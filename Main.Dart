import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
   runApp(MeuApp());
}

//Stl StalessWidget
class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     home:CadastroPage()
    );
  }
}


//Sft Stateful
class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  @override
  Widget build(BuildContext context) {

     String Nome = "";

     String Email = "";

     String Senha = "";

     String Confirmarsenha = "";

     String Telefone = "";

     String DataNasc = "";


    final usuarioController = TextEditingController();
    final emailControler = TextEditingController();
    final senhaController = TextEditingController();
    final ConfirmarsenhaController = TextEditingController();
    final telefoneController = TextEditingController();
    final dataController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro", style: TextStyle(fontSize: 45) ,),),
      body: SingleChildScrollView(
       padding: EdgeInsets.all(20),
        child: Column(
          children:[
            SizedBox(height: 10,),
            TextField(
              controller: usuarioController,
              decoration: InputDecoration(labelText: "Usuario",
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(0)))
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: emailControler,
              decoration: InputDecoration(labelText:"Email",
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(0)))
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: senhaController,
              decoration: InputDecoration(labelText:"Senha",
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(0)))
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: ConfirmarsenhaController,
              decoration: InputDecoration(labelText:"Confirmar senha",
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(0)))
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly,],
              keyboardType: TextInputType.phone,
              controller: telefoneController,
              decoration: InputDecoration(labelText:"Telefone",
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(0)))
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly,],
              keyboardType: TextInputType.phone,
              controller: dataController,
              decoration: InputDecoration(labelText:"Data De Nascimento",
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(0)))
              ),
            ),

            ElevatedButton(onPressed: null, child: Text("Cadastrar"))
          ] 
        ),
      ),
    );
  }
}