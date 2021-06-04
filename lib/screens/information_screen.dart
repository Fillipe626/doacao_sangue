import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.list),
                ),
                Tab(
                  icon: Icon(Icons.pan_tool_rounded),
                ),
                Tab(
                  icon: Icon(Icons.question_answer_outlined),
                ),
                Tab(
                  icon: Icon(Icons.location_on),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(children: [
          SingleChildScrollView(//Aba dos requisitos para doar
              padding: EdgeInsets.all(10),
              child: RichText(
                text: TextSpan(
                    text:
                        'Doar sangue é uma atitude necessária, de solidariedade, cidadania e amor. \n\n',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            'Com uma única doação é possível salvar várias vidas. Ajude você também com esse gesto solidário. Procure a Fhemeron do seu município e doe vida. \n\n',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                          text:
                              'Para se tornar um doador de sangue, é necessário que a pessoa apresente as seguintes características:\n',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: '\n>Tenha entre 16 e 69 anos; '
                              '\n>Pese mais de 50 quilos;'
                              '\n>Não esteja grávida;'
                              '\n>Estar alimentado (evitar alimentação gordurosa nas 4 horas que antecedem a doação);'
                              '\n>Estar descansado (ter dormido pelo menos 6 horas nas últimas 24 horas);'
                              '\n>Estar em boas condições de saúde;'
                              '\n>Não seja Epilético;'
                              '\n>Tenha doado sangue há mais de 60 dias (homem) ou 90 dias (mulher);'
                              '\n>Tenha dormido pelo menos 6 horas nas últimas 24 horas;'
                              '\n>Apresentar documento original com foto recente, que permita a identificação do candidato, emitido por órgão oficial (Carteira de Identidade, Cartão de Identidade de Profissional Liberal, Carteira de Trabalho e Previdência Social).\n\n',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'Atenção: Serão realizados os seguintes exames de triagem no sangue doado:\n',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: '\n>AIDS;'
                              '\n>Sífilis;'
                              '\n>Hepatite;'
                              '\n>Doença de Chagas;'
                              '\n>HTLV I/II;'
                              '\n>Formas raras de Hemoglobina (anemias);'
                              '\n>Grupos Sangüíneos e Fator Rh.\n\n',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'Impedimentos temporários\n',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              '\n>Resfriado: aguardar 7 dias após desaparecimento dos sintomas;;'
                              '\n>Gravidez;'
                              '\n>90 dias após parto normal e 180 dias após cesariana;'
                              '\n>Amamentação (se o parto ocorreu há menos de 12 meses);'
                              '\n>Ingestão de bebida alcoólica nas 12 horas que antecedem a doação;'
                              '\n>Tatuagem / maquiagem definitiva nos últimos 12 meses;'
                              '\n>Situações nas quais há maior risco de adquirir doenças sexualmente transmissíveis: aguardar 12 meses;'
                              '\n>Qualquer procedimento endoscópico (endoscopia digestiva alta, colonoscopia, rinoscopia etc): aguardar 6 meses;'
                              '\n>Extração dentária (verificar uso de medicação) ou tratamento de canal (verificar medicação): por 7 dias;'
                              '\n>Cirurgia odontológica com anestesia geral: por 4 semanas;'
                              '\n>Acupuntura: se realizada com material descartável: 24 horas; se realizada com laser ou sementes: apto; se realizada com material sem condições de avaliação: aguardar 12 meses;'
                              '\n>Vacina contra gripe: por 48 horas;'
                              '\n>Vacina contra sarampo ou com a BCG: por 30 dias;'
                              '\n>Vacina contra rubéola: 14 dias;'
                              '\n>Herpes labial ou genital: apto após desaparecimento total das lesões;'
                              '\n>Herpes Zoster: apto após 6 meses da cura (vírus Varicella Zoster);'
                              '\n>Febre Amarela: quem tomou a vacina deve aguardar 04 semanas; quem contraiu a doença deve aguardar 6 meses após recuperação completa (clínica e laboratorial); e quem esteve em região onde há surto da doença deve aguardar 30 dias após o retorno.\n\n',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'Impedimentos temporários\n',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: '\n>Hepatite após os 11 anos de idade;*'
                              '\n>Evidência clínica ou laboratorial das seguintes doenças infecciosas transmissíveis pelo sangue: Hepatites B e C, AIDS (vírus HIV), doenças associadas aos vírus HTLV I e II e Doença de Chagas;;'
                              '\n>Uso de drogas ilícitas injetáveis;;'
                              '\n>Malária;\n\n',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              '\n>*Hepatite após o 11º aniversário: Recusa Definitiva; Hepatite B ou C após ou antes dos 10 anos: Recusa definitiva; Hepatite por Medicamento: apto após a cura e avaliado clinicamente; Hepatite viral (A): após os 11 anos de idade, se trouxer o exame do diagnóstico da doença, será avaliado pelo médico da triagem.*',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold)),
                    ]),
              )),
          SingleChildScrollView(//aba do procedimento
            padding: EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                text: 'Veja como é simples doar sangue: \n\n',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        '1° Passo: O processo de doação leva aproximadamente 1/2 hora. A doação em si dura apenas de 6 a 10 minutos.\n'
                        '2° Passo: Preencha a ficha do doador. Você ficará cadastrado em nosso banco. \n'
                        '3° Passo: Check-up médico. Um médico irá medir sua pressão e checar se você está apto a doar sangue. Não fique constrangido, '
                        'algumas perguntas que fazem parte da rotina, serão feitas. Suas respostas são extremamente importantes e confidenciais. \n'
                        '4° Passo: A doação propriamente dita. Um profissional de saúde irá realizar a assepsia em seu braço e usar uma agulha descartável. '
                        'Não há chance de contrair o vírus da AIDS ou nenhuma outra doença infecciosa doando sangue.\n'
                        '5° Passo: Após a doação você deverá descansar uns 10 minutos. Esse tempo é super importante e com isso você poderá fazer um lanche leve, fornecido gratuitamente.',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SingleChildScrollView( //ABA DE PERGUNTAS E RESPOSTAS
            padding: EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                text: 'Quem pode doar?\n\n',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        'Qualquer pessoa com idade entre 18 e 67 anos que pese mais de 50 quilos. Jovens de 16 ou 17 anos também estão aptos, desde que tenham o '
                        'consentimento dos pais ou dos responsáveis. Clique aqui para conhecer os requisitos.\n\n',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Quanto tempo demora?\n\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        'A coleta do sangue é bem rápida: leva de 8 a 12 minutos. Antes, o doador faz uma triagem e passa algumas informações de saúde para os funcionários do local.\n\n',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        'O procedimento oferece algum perigo?\n\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Não. A doação é totalmente segura e não apresenta nenhum risco. Os materiais utilizados, como a agulha e os cateteres, são descartáveis.\n\n',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Quanto sangue é retirado?\n\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        'São 450 mililitros. Esse volume pode salvar a vida de até quatro pessoas. \n\n',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Mas meu corpo não vai sentir falta desse sangue?\n\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Não. Nós possuímos cerca de 5 litros do líquido vermelho circulando pelos vasos. A retirada não prejudica em nada: o organismo repõe e alcança os níveis normais em até 72 horas.\n\n',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Existem algumas doenças que impedem a doação de sangue? \n\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Sim. Doenças infecciosas, como a gripe, e inflamatórias, como aquelas que atacam o intestino, '
                            'exigem que a doação seja postergada para outra data. Em caso de dúvida, converse com o profissional de saúde do hemocentro para saber se tudo está ok\n\n',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        'E o que eu preciso levar no dia da doação?\n\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Apenas um documento original com foto.\n\n',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Eu fiz uma cirurgia recentemente. Posso doar sangue?\n\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Você deve esperar 72 horas para doar sangue após uma extração dentária. Operações simples, como apendicite e retirada de varizes, pedem 3 meses. '
                            'Procedimentos mais complexos, como a remoção da tireoide ou de um rim, meio ano. '
                            'Caso você tenha passado por uma transfusão de sangue ou fez uma tatuagem, é importante aguardar por um ano.\n\n',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        'E depois de doar sangue? Devo seguir alguma recomendação médica?\n\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Sim. Evite esforços físicos, beba bastante água, não fume por duas horas e evite ingerir álcool pelo resto do dia. '
                            'Também é importante não praticar esportes radicais, como paraquedismo ou mergulho, ou dirigir veículos de grande porte.\n\n',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        'E se eu tiver uma tatuagem ou “body piercing”?\n\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Pessoas que fizeram uma tatuagem recentemente devem esperar pelo menos um ano antes de doar sangue. Não importa quantas tatuagens a pessoa tenha, apenas a data da mais recente. '
                            'Ter um “body piercing” não impede uma pessoa de doar sangue, desde que ele tenha sido feito em um estabelecimento licenciado. Fazer um “body pierce” em um estabelecimento não '
                            'licenciado impede com que a pessoa faça uma doação por um ano.\n\n',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Pessoas que tomam remédios podem doar sangue?\n\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Se você estiver sob medicação, consulte um médico ou pergunte à equipe do banco de sangue se você tiver dúvidas se pode doar ou não.\n',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),
            ),
          ),
          SingleChildScrollView(// aba dos locais dos hemocentros
            padding: EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                text: 'Fundação de Hematologia e Hemoterapia do Estado de Rondônia – Porto Velho  \n\n',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text:
                    'Rua Benedito de Souza Brito, s/nº, Setor Industrial\n'

                      'CEP 76.821-080. Porto Velho / Rondônia\n'

                      'Telefone (69)3216-2234\n\n',

                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                    'Unidade de Coleta e Transfusão de Ariquemes\n',

                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                    'Rua: Cassiterita, nº 3613 – Centro\n'

                        'Ariquemes – RO.  CEP 76872-874\n'

                        'Telefone: (69) 3535-2659\n\n',

                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                    'Unidade de Coleta e Transfusão de Ji-Paraná\n',

                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                    'Rua: Vilagran Cabrita, nº 1440 – Centro\n'

                        'Ji-Paraná – RO. CEP 76900-018\n'

                        'Telefone: (69) 3421-1615\n\n',

                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                    'Unidade de Coleta e Transfusão de Guajará-Mirim\n',

                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                    'Av. XV de Novembro,  nº 1299 – Centro\n'

                        'Guajará-Mirim – RO. CEP 76850-000\n'

                        'Telefone: (69) 3541-6073\n\n',

                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                    'Unidade de Coleta e Transfusão de Rolim de Moura\n',

                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                    'Av. Cuiabá Nº 5424, Bairro Planalto ao lado do Hospital Municipal.\n'

                        'Rolim de Moura – RO.  CEP 76940-000\n'

                        'Telefone: (69) 3442-1328\n\n',

                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                    'Unidade de Coleta e Transfusão de Cacoal\n',

                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                    'Av. Malaquita, s/nº – Bairro Josino Brito.\n'

                        'Cacoal – RO. CEP 76980-000\n'

                        'Telefone: (69) 3441-0823\n\n',

                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                    'Hemocentro Regional de Vilhena\n',

                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                    'Av. Jô Sato, nº 405 – Bairro Nova Vilhena.\n'

                        'Vilhena RO – CEP: 76980-000\n'

                        'Telefone: (69) 3322-2400\n',

                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
         ],
        ),
      ),
    );
  }
}
