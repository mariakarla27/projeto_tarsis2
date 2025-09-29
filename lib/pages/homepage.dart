import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projetotarsis/db/propriedades_dao.dart';
import '../domain/propriedades.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  late Future<List<Propriedade>> futurePropriedades;
  int selectedIndex = 0;


  void initState() {
    super.initState();
    futurePropriedades = PropriedadesDao().listarPropriedades();
  }


  //loadData() async {
  //propriedades = await PropriedadesDao().listarPropriedades();
  // setState(() {
  //print(propriedades[0]);
  //});
  //}


  getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.medical_services_rounded;
      case 1:
        return Icons.smoke_free;
      case 2:
        return Icons.verified_outlined;
      case 3:
        return CupertinoIcons.exclamationmark_circle;
      case 4:
        return Icons.arrow_circle_right;
      default:
        return Icons.info_outline;
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.deepPurpleAccent[100],
            appBar: AppBar(
              backgroundColor: Colors.indigo[900],
              title: Text(
                'Início',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.account_circle, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
            //  appBar: AppBar(backgroundColor: Colors.indigo[900]),
            bottomNavigationBar: Container(
              height: 70,
              color: Colors.indigo[900],
            ),
            body: ListView(physics: NeverScrollableScrollPhysics(), children: [
              GridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 8,
                    childAspectRatio: 3 / 2,
                  ),
                  children: [
                    Align(
                      child: Container(
                        alignment:
                        Alignment.center,
                        //PARA CENTRALIZAR O CONTEUDO
                        color: Colors.white,
                        width:
                        150,
                        // PARA AUMENTAR A LARGURA (ACONSELHO COLOCAR TODAS DO MESMO TAMANHO)
                        height:
                        60,
                        // PARA AUMENTAR O TAMANHO (ACONSELHO COLOCAR TODAS DO MESMO TAMANHO)
                        child: Text(
                          'QUIZ DA ROTINA',
                          style: TextStyle(
                            fontSize:
                            16,
                            // PARA DIMINUIR A FONTE E FICAR PARECIDA COM A FOTO
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      child: Container(
                        alignment: Alignment.center,
                        width: 150,
                        height: 60,
                        color: Colors.white,
                        child: Text(
                          'INFORMAÇÕES',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      child: Container(
                        padding: EdgeInsets.only(left: 6),
                        alignment: Alignment.center,
                        width: 150,
                        height: 60,
                        color: Colors.white,
                        child: Text(
                          'COLETÂNEA DE DADOS',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      child: Container(
                        alignment: Alignment.center,
                        width: 150,
                        height: 60,
                        color: Colors.white,
                        child: Text(
                          'SOBRE NÓS',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ]),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Últimas notícias: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              Container(
                height: 300,
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                color: Colors.white,
                child: FutureBuilder(
                  future: futurePropriedades,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Propriedade> listaPropriedades =
                          snapshot.requireData;
                      return buildListView(listaPropriedades);
                    }


                    return Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFF846EB4),
                        ));
                  },
                ),
              )
            ])));
  }


  buildListView(listaPropriedades) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listaPropriedades.length,
      itemBuilder: (context, i) {
        return CardPropriedade(
          //criar uma classe "card propriedades"


          listaPropriedades[i],
        );
      },
    );
  }


  buildNoticia(Propriedade p) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(getIconForIndex(p.iconType)),
            SizedBox(
              width: 5,
            ),
            Text(
              p.titulo,
              maxLines: 100,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        Text(
          p.texto,
          maxLines: 100,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }


  CardPropriedade(Propriedade propriedade) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(12),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Icon(
                getIconForIndex(propriedade.iconType),
                color: Colors.indigo[900],
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  propriedade.titulo,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),


          SizedBox(height: 6),


          // Texto/descrição
          Text(
            propriedade.texto,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }








}


