#### 15/11/2023

Curso de Flutter: praticando e adaptando arquitetura limpa

@01-Responsabilidades e camada domínio

@@01
Apresentação

Você já ouviu falar de Clean Architecture (Arquitetura Limpa)? Já utilizou em um contexto Flutter?
Te desejo boas-vinda a mais um curso de arquitetura e Clean Code! Meu nome é Matheus e serei seu instrutor nesta jornada!

Audiodescrição: Matheus se autodescreve como um homem branco, de cabelos curtos e lisos na cor castanho escuro. Veste uma camiseta azul marinho com a logo da Alura em branco e está sentado sob uma cadeira gamer na cor preta. Ao fundo, uma parede iluminada sob tons de roxo e azul. À sua direita, uma estante com artigos decorativos.
Neste curso, vamos desenvolver um aplicativo Hyrule, que é um compêndio de informações do jogo Zelda Breath of the Wild. Mas qual é o resultado que vamos atingir? Teremos uma tela com várias categorias de itens, como monstros e criaturas. Ao clicar em uma dessas categorias, baixaremos entradas vindas de uma API. Para fazer essa conexão com a API, vamos utilizar a biblioteca dio.

Clicando em uma entrada, temos a possibilidade de adicionar essa entrada no nosso banco de dados. Para fazer essa conexão entre a tela e o banco de dados, vamos usar a biblioteca Floor. Essa biblioteca vai permitir que nós também façamos inserção e remoção de dados no banco de dados, além da visualização de todas as entradas em uma tela de favoritos. Podemos também deslizar uma entrada para excluí-la do banco de dados.

Para acompanhar neste curso, é importante que você já tenha conhecimentos prévios de Flutter, saiba construir layouts, entenda de persistência de dados e consiga fazer transições de telas, passando informações de uma para a outra, além de fazer requisições HTTP.

Com todo esse conhecimento pronto, podemos prosseguir e começar a desenvolver o aplicativo Hyrule. Vejo você no próximo vídeo!

@@02
Preparando o ambiente: baixando o app Hyrule

Olá, Dev!
Matheus por aqui!

Você está iniciando seu mergulho no curso sobre Flutter: Praticando arquitetura clean code!

Vamos fazer os preparativos para iniciar este curso?

1) Baixando o projeto
Para acompanhar o desenvolvimento deste curso, é importante que você tenha os arquivos necessários do projeto inicial.

2) Acessando o Figma do projeto
Para ter uma ideia do projeto final, acesse o Figma do Hyrule e confira as telas que vamos construir!

3) Do que preciso para rodar o projeto?
Ter uma IDE, que eu recomendo ser Visual Studio Code (por conta de alguns passos no desenvolvimento), instalada na sua máquina;
Ter a SDK do Flutter na versão 3.10.5.
4) O que vou aprender neste curso?
Vamos aprender sobre arquitetura no Flutter, utilizando como referência o Clean Architecture e Clean Dart (em português, arquitetura limpa)! Entenderemos como adaptar a arquitetura limpa em um projeto Flutter.

5) Como fazer este curso?
Durante sua jornada, você encontrará atividades práticas e teóricas para testar seus conhecimentos, material extra para se aprofundar nos seus estudos, e desafios para praticar suas habilidades.

Vamos conhecer algumas dicas para fazer bem este curso?

Levante a mão e participe! Tudo bem se não conseguir realizar alguma atividade, isso faz parte do processo. Procure o fórum ou nossa comunidade no Discord e aproveite para tirar dúvidas, para interagir com outras pessoas e ajudar um colega (ensinar é uma ótima forma de aprender);
Pratique! Faça, teste, replique as atividades do curso, pois assim ganhará confiança e fixará melhor o conteúdo;
Foque, mas descanse! Caso sinta-se cansado(a) ou não esteja entendendo algo, dê uma pausa, tome uma água, e depois assista novamente as videoaulas.
O importante é persistir até o fim! Preparado(a)? Podemos começar.

Bons estudos!

Um abraço,

Matheus Alberto

https://github.com/alura-cursos/3117-clean_architecture/archive/refs/heads/ProjetoInicial.zip

https://www.figma.com/file/LvA2b9QL2tdxLERamPddK1/Clean-Code?type=design&node-id=0%3A1&mode=design&t=o2T7drfV5M96x78J-1

https://code.visualstudio.com/download

https://docs.flutter.dev/get-started/install

@@03
Entendendo as camadas para organizar o projeto

Antes de começar, é importante que você já tenha baixado os arquivos do projeto disponibilizados na atividade anterior de preparação do ambiente.
Vale ressaltar que esse curso foi inteiramente planejado, pensado e inspirado pelo Clean Code (Código Limpo) e também pelo Clean Dart (Dart Limpo), que é um padrão de projeto desenvolvido pelo time do Fluterando. Todas as decisões que serão tomadas durante o desenvolvimento do projeto são adaptações minhas, como instrutor, inspiradas nessas ferramentas. Vale reforçar que o projeto não deve se adaptar à nossa arquitetura, nossa arquitetura é que precisa se adaptar ao nosso projeto.

Com esse esclarecimento resolvido, vamos ao desenvolvimento do projeto!

Nós vamos desenvolver um aplicativo chamado Hyrule, que será um estilo compendium do jogo Zelda Breath of the Wild. Este aplicativo servirá como uma ferramenta para as pessoas jogadoras terem acesso às informações de itens, monstros e outras características do jogo.

Analisando rapidamente o layout que temos no Figma, nós temos quatro telas para desenvolver, onde teremos uma categoria para escolher, as informações da categoria selecionada que será buscada de uma API, os detalhes e, finalmente, uma tela de itens salvos, onde as informações ficarão armazenadas dentro do dispositivo.

O aplicativo terá uma lista de requisitos que inclui uso da API do Hyrule Compendium, disponível também na descrição do projeto no GitHub. Nós vamos buscar as informações de acordo com a categoria selecionada pela pessoa usuária. Esta pessoa também deve ser capaz de visualizar todas as entradas daquela categoria, adicionar e remover uma entrada aos favoritos e, além disso, todas as informações precisam ser salvas localmente no dispositivo. Assim, teremos acesso à API e ao nosso banco de dados.

Tendo em vista todas essas informações, por onde vamos começar? Pensando no que o cliente solicita, nosso aplicativo é dividido em várias camadas. Vamos iniciar pelo núcleo, onde temos nosso domínio, modelos, entidades e regras de negócio.

É importante lembrar, falando de arquitetura, que o desenvolvimento móvel, de forma geral (Android, iOS, Flutter), já trabalha com arquitetura em camadas naturalmente. O Clean será apenas um padrão a mais que vamos adicionar a isso.

Vamos então definir nossas camadas através das pastas dentro do nosso projeto.

No Visual Studio Code, que é a IDE escolhida para desenvolver esse aplicativo, dentro da pasta lib, criaremos uma pasta chamada domain, onde ficarão nossos domínios. Dentro da pasta domain, criaremos outra pasta chamada models, pois poderemos ter mais de um modelo no futuro. Nela, criaremos nosso arquivo de entrada, entry.dart.

Este arquivo conterá a estrutura das informações do aplicativo, que inclui o nome, título do cartão, ID e uma sequência de informações que esse cartão precisa. Para saber como montar nossa entrada, podemos visualizar o resultado da API e usar isso como referência para definir nosso modelo.

Vamos abrir o resultado de uma API que contém categorias de monstros:

'data": [
    {
        "category": "monsters",
        "common_locations": [
            "Eldin Mountains",
            "Tabantha Frontier"
        ],
        "description": "A spirit of fire has taken the form of this giant dragon. Making its home in the Eldin region, it's said to have served the Spring of Power since ancient times. An old saying goes, \"The dragon ascends to the heavens as the sun begins to set,\" but nobody has witnessed this in the current age. The flames that coat its body make it dangerous to get near, but Dinraal bears no ill will toward people.",
        "dlc": false,
        "drops": null,
        "id": 153,
        "image": "https://botw-compendium.herokuapp.com/api/v3/compendium/entry/dinraal/image",
        "name": "dinraal"
COPIAR CÓDIGO
Note que ispomos de algumas informações como category (categoria), common_locations (localização comum), description (descrição), id (ID), image (imagem) e name (nome). Essas são as seis informações que precisamos.

Vamos começar de baixo para cima, ou seja, pelo ID, assim seguimos uma ordem de importância. Vamos alternar entre essa página e o editor de código, para que possamos usá-la como uma espécie de referência para escrever esse modelo de entrada.

No editor de código, definiremos uma classe Entry. Ela precisa ter um int, que será nosso id. Também precisamos de uma string para o nome, uma para a imagem e uma para a descrição.

class Entry {
    int id;
    String name;
    String image;
    String description;
}
COPIAR CÓDIGO
Temos também commonLocations. Mas há uma ressalva: temos uma lista de strings. Contudo, considerando que temos que salvar essas informações localmente no banco de dados, e sabendo que no banco de dados não podemos salvar um vetor ou uma lista, mas apenas strings, não conseguiremos lidar com isso diretamente.

Portanto, embora a gente declare commonLocations como string, posteriormente teremos que transformar isso em um objeto JSON e de JSON para uma lista novamente.

class Entry {
    int id;
    String name;
    String image;
    String description;
    String commonLocations
}
COPIAR CÓDIGO
Por último, temos a string de category (categoria).

class Entry {
    int id;
    String name;
    String image;
    String description;
    String commonLocations
    String category;
}
COPIAR CÓDIGO
Bem, concluímos a escrita da nossa entrada, mas ainda faltam algumas informações. Estamos recebendo erros porque falta adicionar nosso construtor e nossa estrutura de dados da classe. Mas podemos começar a usar ferramentas para facilitar nosso trabalho ao invés de fazer tudo manualmente.

À medida que desenvolvemos aplicativos maiores ou aumentamos a frequência de desenvolvimento, ganhamos familiaridade com a forma como o código é realmente escrito. É normal usarmos essas ferramentas, afinal não vale a pena fazer tudo manualmente toda vez se já temos maneiras de facilitar nosso trabalho.

A primeira ferramenta que vamos implementar é um plugin do Visual Studio Code, que vai gerar para nós a nossa estrutura de dados. O nome do plugin que vamos instalar é "Data Class Generator", criado pelo hzgood, que será capaz de gerar todas as informações da estrutura de dados no Dart. Vamos pesquisá-lo na aba de extensões vou instalá-lo.

Após instalado, podemos fechar a aba e reiniciar o Visual Studio Code. O atalho "Command + Shift + P" reinicia o VS Code no MAC; já no Windows é possível reiniciar a IDE com o comando "Ctrl + Shift + P". Feito isso, digitamos reload e selecionamos a opção "Developer: Reload Window" para recarregar a janela do VS Code. Com isso temos acesso ao novo plugin que acabamos de instalar.

Note que o editor está emitindo vários erros na nossa entrada. Se colocarmos o cursor em cima de id e pressionarmos "Command + ponto" ou "Ctrl + ponto", temos acesso às opções de que gerar a classe de dados, o construtor, a serialização JSON e várias outras. Queremos nosso construtor, então clicaremos em "Generate constructor".

Ao clicar, o construtor é gerado:

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Entry {
    int id;
    String name;
    String image;
    String description;
    String commonLocations;
    String category;
    Entry({
        required this.id,
        required this.name,
        required this.image,
        required this.description,
        required this.commonLocations,
        required this.category,
    });
}
COPIAR CÓDIGO
Agora, posicionamos o cursor sobre Entry, usamos o atalho "Command + ponto" ou "Ctrl + ponto" e clicamos na opção "Generate JSON serialization" para gerar a serialização JSON:

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Entry {
    int id;
    String name;
    String image;
    String description;
    String commonLocations;
    String category;
    Entry({
        required this.id,
        required this.name,
        required this.image,
        required this.description,
        required this.commonLocations,
        required this.category,
    });
    
    Map<String, dynamic> toMap() { 
        return <String, dynamic>{
            'id': id,
            'name': name,
            'image': image,
            'description': description,
            'commonLocations': commonLocations,
            'category': category,
        };
    }
    
    factory Entry.fromMap(Map<String, dynamic> map) {
        return Entry(
                id: map['id'] as int, 
                name: map['name'] as String,
                image: map['image'] as String,
                description: map['description'] as String,
                commonLocations: map['commonLocations'] as String,
                category: map['category'] as String,
        );
    }

    String toJson() => json.encode(toMap());
    
    factory Entry.fromJson(String source) => Entry.fromMap (json.decode(source) as Map<String, dynamic>);
}
COPIAR CÓDIGO
Todo o código já foi gerado. Portanto, agora temos a função toMap(), da nossa entrada, fromMap() e também toJson(), encode() e fromJson(), com todas as informações que precisamos.

Ainda falta um detalhe: o commonLocations que teremos que converter de uma string para uma lista e salvar no banco de dados para então transformá-lo em uma string novamente. Faremos isso no próximo vídeo!

@@04
Faça como eu fiz: construindo a model e instalando o plugin data class generator

Neste momento, estamos construindo a model Entry, que é referente às entradas, ou seja, itens do aplicativo que as pessoas poderão consultar:
Imagem que mostra o exemplo de uma entrada do projeto Hyrule. No canto direito, há o nome de uma criatura e sua descrição. Ao lado direito, uma imagem dessa criatura. Por fim, na parte inferior da entrada, há tags que indicam o local onde a criatura pode ser encontrada

A partir da análise do design no Figma, vemos que a model Entry precisa das seguintes informações:

int id;
String name;
String image;
String description;
String commonLocations;
String category.
Por se tratar de uma classe que vai interagir com banco de dados e APIs, ela necessita de algumas informações que ainda estão faltando (e serão importantes para as funcionalidades da nossa aplicação), como o construtor e também as funções relacionadas ao banco de dados e requisições HTTP:

toMap;
fromMap;
toJson;
fromJson.
Existe um momento que escrever essas funções manualmente é importante para entender o seu funcionamento, mas depois que já pegamos esses conceitos, podemos utilizar ferramentas para agilizar o processo de desenvolvimento.

É com essa ideia que utilizamos o plugin Dart Data Class Generator no Visual Studio Code para gerar essas funções para nós. Fornecemos as informações necessárias (que são as propriedades da model Entry acima) e depois pedimos para a ferramenta gerar o restante do código.

Assim, é sua vez de seguir os passos feitos em vídeo:

Acesse a página de instalação do plugin;
Faça a instalação e reinicie o Visual Studio Code;
Ative a paleta de comandos da IDE e gere os seguintes códigos:
Constructor (construtor);
JSON serialization.
Vamos lá?

https://marketplace.visualstudio.com/items?itemName=hzgood.dart-data-class-generator

Muito importante checar o código gerado. Existe sempre a possibilidade de alguma coisa ser gerada errada ou incompleta. Ferramentas existem para facilitar nosso trabalho, mas às vezes elas podem falhar.
Agora você tem toda a estrutura do modelo pronta para o próximo passo!

@@05
Convertendo objetos e listas

Um detalhe muito importante a ser lembrado é que escrevemos commonLocations, dentro da nossa entrada, utilizando Camel Case. Ou seja, as palavras são delimitadas por letras maiúsculas. Assim, "commons" começa com a letra minúscula e "Locations" com a letra maiúscula.
Contudo, se observarmos a API, veremos que a chave de mesmo nome está escrita como Snake Case. O que significa que a palavra é separada por um underscore (sublinhado): common_locations.

'data": [
    {
        "category": "monsters",
        "common_locations": [
            "Eldin Mountains",
            "Tabantha Frontier"
        ],
COPIAR CÓDIGO
Então, quando formos buscar essa informação na API, teremos um problema, afinal, nós usamos o padrão Dart de escrever como Camel Case. Portanto, temos um ajuste a ser feito ao extrair as informações da API.

Voltando ao VS Code, abaixo da linha 41, criaremos uma função que irá converter nossa string em uma lista de strings. Esta função será chamada commonLocationsConverter() e irá retornar um jsonDecode(), pois queremos transformar os dados originados do JSON, que serão armazenados no banco de dados, em uma lista de strings que possa ser usada posteriormente em outras partes da API.

Nossa source será nossa própria commonLocations dentro da entrada. A partir disso, precisamos converter isso para uma lista usando .as List. Como será uma lista e será um JSON, teoricamente, temos que dar seu tipo como dynamic.

factory Entry.fromMap(Map<String, dynamic> map) {
    return Entry(
        id: map['id'] as int, 
        name: map['name'] as String,
        image: map['image'] as String,
        description: map['description'] as String,
        commonLocations: map['commonLocations'] as String,
        category: map['category'] as String,
        );
    }
        
List<String> commonLocationsConverter() {
    return (jsonDecode(commonLocations) as List<dynamic>)
}
COPIAR CÓDIGO
Depois disso, precisamos mapear, pois agora que é uma lista, temos que pegar cada um desses itens, convertê-los em uma string e depois retornar. Então, será e as String. No final de tudo isso, faremos um toList().

List<String> commonLocationsConverter() {
    return (jsonDecode(commonLocations) as List<dynamic>).map((e) => e as String).toLidt();
}
COPIAR CÓDIGO
Essa função está convertendo o JSON recebido do banco de dados em uma lista de string para que possamos usar em outras partes do projeto.

Agora, para corrigir commonLocations, precisamos transformar esse o map para outra coisa.

Na linha 38, temos map['commonLocations']. Esse map[], com essa chave, é a partir de onde a busca na API acontece. Mas temos que alterar isso, pois precisamos usar a chave correta. Além disso, ao recebermos a informação da API, também precisamos convertê-la para algo que o banco consiga salvar, que será o objeto JSON.

Faremos um jsonEncode(). O objeto que receberemos será o map[], passando a chave. Só que a chave agora, ao invés de ser 'commonLocations', em Camel Case, será 'common_locations', em Snake Case.

factory Entry.fromMap(Map<String, dynamic> map) {
        return Entry(
                id: map['id'] as int, 
                name: map['name'] as String,
                image: map['image'] as String,
                description: map['description'] as String,
                commonLocations: jsonEncode(map['common_locations']),
                category: map['category'] as String,
        );
    }
COPIAR CÓDIGO
Aqui, temos um detalhe interessante a ser realizado, que é validar se receberemos uma localização ou não. Ao analisar a API, esse commonLocations pode vir vazio e não queremos que um erro ocorra ou que nossa aplicação quebre por falta de informação.

Por isso, adicionaremos duas interrogações (??) para um valor padrão a ser retornado. Isso faz parte do recurso que nos permite validar se algo pode vir nulo ou não. Retornaremos uma string contendo o texto "Sem localização". Assim, se não tivermos esse parâmetro dentro da API, receberemos a mensagem "Sem localização" e nossa aplicação não quebrará.

factory Entry.fromMap(Map<String, dynamic> map) {
        return Entry(
                id: map['id'] as int, 
                name: map['name'] as String,
                image: map['image'] as String,
                description: map['description'] as String,
                commonLocations: jsonEncode(map['common_locations'] ?? ['Sem localização']),
                category: map['category'] as String,
        );
    }
COPIAR CÓDIGO
Com isso, basicamente terminamos toda a nossa entrada e podemos prosseguir para a nossa regra de negócios!


@@06
Criando objetos de domínio na arquitetura limpa

Você está desenvolvendo um aplicativo para uma clínica médica utilizando Flutter e arquitetura limpa. Considere as seguintes informações:
O app deve ser capaz de listar todos os pacientes e fornecer seus dados;
Você está atualmente trabalhando na camada de domínio do aplicativo;
Sua tarefa é representar cada paciente com suas devidas características (nome, sobrenome, idade, endereço, entre outras).
Dado esse cenário, como você representaria uma model (ou classe) de paciente na camada de domínio do seu aplicativo?

void main() {
  runApp(MedicalApp());
}
class MedicalApp extends StatelessWidget {
 // ...
}
 
Alternativa correta
class Pacient {
  String name;
  String surname;
    String age;
    String address;

  Future<List<Pacient>> getAllPacients() async {...}
}
 
Alternativa correta
class Pacient {
  String name;
  String surname;
    String age;
    String address;
}
 
Isto está correto. Na arquitetura limpa, os objetos de domínio devem ser simples e conter apenas os dados necessários. Neste caso, o nome, sobrenome, idade e endereço do paciente.
Alternativa correta
class Pacient extends StatelessWidget {
  // ...
}
 
Alternativa correta
class Pacient {
    String name;
  String surname;
    String age;
    String address;

  Pacient({this.name, this.surname, this.age, this.address});
}
 
Isto está correto. Na arquitetura limpa, os objetos de domínio devem ser imutáveis, ou seja, uma vez criado, seu estado não deve ser alterado.

@@07
Construindo as regras de negócios na camada domínio

Finalizamos a construção do nosso modelo. O próximo passo será, ainda na camada de domínio, criar a nossa regra de negócios.
Para isso, vamos separar em outra pasta, que seria outra sub-camada, dentro de domain, mas não dentro de models, chamada business. Lembrando que a denominação dessas camadas e pastas que estamos utilizando é de minha autoria, como pessoa instrutora. Cada equipe ou cada pessoa desenvolvedora trabalha de um jeito diferente e pode nomear essas pastas de maneira diversa. É importante entender que o que está sendo feito aqui não é uma regra. Trata-se apenas de uma sugestão, até porque me baseei no Clean Dart e no Clean Code.

Dentro de business, teremos dois arquivos. Um vai cuidar da regra de negócios da API, da nossa comunicação com a API. O outro arquivo vai conter a regra de negócios com a comunicação do banco de dados.

Vamos criar estes dois arquivos, começando pelo api_workflow.dart, que significa fluxo de trabalho. O segundo se chamará dao_workflow.dart, que será a representação do nosso banco de dados.

Dentro da API, vamos criar a classe que vai conter as funções da nossa regra de negócios. Lembrando da nossa lista de tarefas, ela será exatamente o arquivo que vai conter a função que fará uma requisição para a API. Essa classe será abstrata, terá uma função que fará uma requisição para a API, e nos retornará uma Future.

abstract class ApiWorkflow {
    Future
}
COPIAR CÓDIGO
Essa Future será uma lista de entradas <List<Entry>>. Por isso foi interessante termos feito o modelo anteriormente.

O nome da função vai ser getEntriesByCategory() e precisará receber uma informação muito importante. Então, passamos required.

A informação primordial é uma string que é exatamente a categoria que teremos que trabalhar.

abstract class ApiWorkflow {
    Future<List<Entry>> getEntriesByCategory({required String category});
}
COPIAR CÓDIGO
Vamos adicionar, também, a importação do nosso Entry.

import 'package: hyrule/domain/models/entry.dart';

abstract class ApiWorkflow {
    Future<List<Entry>> getEntriesByCategory({required String category});
}
COPIAR CÓDIGO
Criamos a nossa classe ApiWorkflow. Ela possui a função que será implementada em outro lugar, que vai obter as informações por categoria.

Mas você deve estar se perguntando: Nós não faríamos uma requisição para a API, trataríamos os dados, retornaríamos alguma coisa e salvaríamos no banco? A resposta é não! Os nossos sistemas apenas criam as interfaces que serão implementadas futuramente na nossa aplicação. Então, quando realmente precisarmos pegar essas entradas, em outras camadas, chamaremos essa função. E essa função será realmente implementada na hora que precisarmos fazer a conexão com a API.

Mas não precisamos fazer isso agora? O motivo é que a ideia do Clean é que a regra de negócios não sofra influência de bibliotecas ou até mesmo da própria API, porque a ideia é o fluxo. A pessoa desenvolvedora deve ser capaz de fazer uma requisição para uma API e devolver alguma informação, independente de qual API, endpoint, ou biblioteca está usando.

Esta é uma das ideias do Clean, então estamos apenas transcrevendo aquelas nossas regras de negócios, que serão obrigatórias durante a sua implementação futura. Assim, não estamos nos preocupando se usaremos a do Hyrule ou até mesmo outra API, porque a ideia de pegar as entradas por categoria já foi criada. Com isso, podemos agora criar o nosso workflow do banco de dados.

Para o nosso arquivo dao_workflow, temos as funcionalidades de listar, adicionar e remover. Faremos, então, uma classe abstrata que terá uma função Future e devolverá uma lista de entradas, getSavedEntries(), que são as entradas salvas, nossos favoritos.

abstract class DaoWorkflow {
    Future<List<Entry>> getSavedEntries();
}
COPIAR CÓDIGO
Teremos outra Future que, na verdade, vai retornar nada, pois vamos adicionar e remover agora.

abstract class DaoWorkflow {
    Future<List<Entry>> getSavedEntries();
    
    Future<void> saveEntry({required Entry entry});
    
    Future<void> deleteEntry({required Entry entry});
}
COPIAR CÓDIGO
Temos o nosso ApiWorkflow e o nosso DaoWorkflow. Portanto, basicamente, nós transcrevemos nossa lista de requisitos.

Agora podemos começar a evoluir um pouco mais as camadas, saindo do núcleo e expandindo para outras mais externas!

@@08
Regra de negócios

Na camada de domínio é onde nós criamos as entidades e também definimos as regras de negócios. No momento, elas não serão implementadas porque ainda não temos as funcionalidades externas com o banco de dados e a comunicação com a API, mas como elas são as funcionalidades básicas da aplicação, precisam existir em algum lugar.
Escolha a alternativa que define corretamente a seguinte lista de requisitos:

Adicionar um cliente;
Remover um cliente;
Mostrar todos os clientes;
Buscar por um cliente.

class ClientWorkflow {
    Future<void> addClient({required Client client});
    Future<void> removeClient({required Client client});
    Future<List<Client>> getAllClients();
    Future<Client> getClient({required Client client});
}
 
Alternativa correta
abstract class ClientWorkflow {
    final ClientDao clientDao = ClientDao();
    
    Future<void> addClient({required Client client}) async {
        clientDao.add(client);
    };
    Future<void> removeClient({required Client client}) async {
        clientDao.remove(client);
    };
    Future<List<Client>> getAllClients() async {
        return clientDao.getAll();
    };
    Future<Client> getClient({required Client client}) async {
        return clientDao.getClient(client);
    };
}
 
Alternativa correta
class ClientWorkflow {
    final ClientDao clientDao = ClientDao();
    
    Future<void> addClient({required Client client}) async {
        clientDao.add(client);
    };
    Future<void> removeClient({required Client client}) async {
        clientDao.remove(client);
    };
    Future<List<Client>> getAllClients() async {
        return clientDao.getAll();
    };
    Future<Client> getClient({required Client client}) async {
        return clientDao.getClient(client);
    };
}
 
Alternativa correta
abstract class ClientWorkflow {
    Future<void> addClient();
    Future<void> removeClient();
    Future<List<dynamic>> getAllClients();
    Future<dynamic> getClient();
}
 
Considerando que a classe de domínio tem entidades e regras de negócios, não deveríamos usar tipos dinâmicos para definir retornos.
Alternativa correta
abstract class ClientWorkflow {
    Future<void> addClient({required Client client});
    Future<void> removeClient({required Client client});
    Future<List<Client>> getAllClients();
    Future<Client> getClient({required Client client});
}
 
Correto! Na arquitetura limpa, os requisitos são transformados em funções de uma interface que serão implementadas depois na aplicação.

@@09
Para saber mais: entendendo a camada de domínio

Ao construir uma casa, o primeiro passo seria chamar um engenheiro para desenhar a planta da casa, pois seria pouco inteligente construí-la sem planejamento. Essa planta mostra os cômodos e como os pedreiros devem trabalhar na obra.
A camada de domínio, em arquitetura limpa (Clean Architecture), é uma espécie de planta da casa que estipula como essa casa será construída.
O objetivo dessa camada é centralizar as regras de negócios em um local independente de qualquer detalhe de implementação, como interfaces de usuário, frameworks ou bancos de dados. Essa camada é responsável por representar o núcleo da aplicação, onde as regras de negócios são definidas e aplicadas.

Imagem que representa as camadas da arquitetura limpa ou clean code. Há várias esferas que envolvem uma a outra. A esfera do centro está na cor amarela e dentro dela pode-se ler a palavra “domínio”

A camada de domínio, geralmente, consiste em três componentes principais:

Entidades: As entidades são objetos que encapsulam os conceitos de negócios essenciais; são geralmente classes que chamamos de models e representam informações do projeto (como no caso da model Entry do nosso projeto). Elas não devem conter lógica relacionada à infraestrutura ou à apresentação visual das telas. A tendência é que essas entidades sejam imutáveis. Um exemplo poderia ser uma entidade que representa um "Usuário" em um sistema de gerenciamento de contas:
class User {
  final int id;
  final String name;
  final String email;

  User(this.id, this.name, this.email);
}
COPIAR CÓDIGO
Casos de uso (use cases): Os casos de uso representam as operações de negócios que a aplicação pode executar. Eles orquestram a lógica de negócios usando as entidades e validam as regras de negócios. Por exemplo, um caso de uso poderia ser "Criar um Novo Usuário":
class CreateUserUseCase {
  final UserRepository _userRepository;

  CreateUserUseCase(this._userRepository);

  Future<void> execute(User user) async {
    // Lógica de negócios para criar um novo usuário
    await _userRepository.createUser(user);
  }
}
COPIAR CÓDIGO
Repositórios: Os repositórios são interfaces que definem como os casos de uso podem interagir com os dados, como buscar ou salvar entidades. Aqui está um exemplo de um repositório para lidar com operações de usuário:
abstract class UserRepository {
  Future<void> createUser(User user);
  Future<User?> getUserById(int userId);
  // Outros métodos relacionados a usuários
}
COPIAR CÓDIGO
A ideia central da camada de domínio é manter a independência das regras de negócios do restante da aplicação. Além disso, isso facilita a realização de testes de unidade, pois você pode testar as regras de negócios sem a necessidade de interfaces de usuário ou bancos de dados reais.

Lembre-se de que a arquitetura Limpa é uma abordagem que pode ser implementada de várias maneiras em diferentes linguagens de programação. Os exemplos acima são em Dart, mas os conceitos podem ser aplicados a qualquer linguagem de programação.

https://caelum-online-public.s3.amazonaws.com/3117-flutte-+arquitetura-clean-code/imagem3.png

@@10
Faça como eu fiz: construindo a camada de domínio

Nesta aula, você aprendeu como criar a camada de domínio do aplicativo Hyrule. É importante que você faça as seguintes implementações:
Crie a entidade/model Entry com os dados da API (caso ainda não a tenha criado);
Separe as regras de negócios em duas classes abstratas (API e dao);
Cada requisito deve ser uma função dentro de cada classe.
Para um melhor entendimento do projeto, você pode utilizar a lista a seguir contendo as regras de negócios da aplicação:

O aplicativo deve receber informações da seguinte api https://gadhagod.github.io/Hyrule-Compendium-API/#/compendium-api de acordo com a categoria escolhida;
A pessoa deve ser capaz de favoritar entradas;
Essas entradas devem ficar salvas localmente no dispositivo (ou seja, em um banco de dados);
A pessoa deve ser capaz de adicionar e remover entradas da lista de favoritos;
A pessoa deve ser capaz visualizar todas as entradas.
Bons estudos!

https://gadhagod.github.io/Hyrule-Compendium-API/#/compendium-api

Caso queira mais detalhes de como implementar, você pode seguir o passo a passo:
Criando a entidade Entry:
Crie a pasta domain e em seguida a pasta models;
Crie a classe "Entry" com as seguintes propriedades:
"id" (int);
"name" (String);
"image" (String);
"description" (String);
"commonLocations" (String);
"category" (String).
Utilizando o plugin Dart Data Class Generator do Visual Studio Code, gere os seguintes trechos de código do modelo:
constructor;
JSON serialization.
Crie a função commonLocationsConverter() que transforma um objeto JSON em uma lista;
Dentro da função fromMap, converta um map em um objeto JSON;
Ainda no fromMap, altere a propriedade do map de map[’commonLocations’] para map[’common_locations’] ?? [’Sem localização’];
Criando as regras de negócios da API:
Dentro da pasta domain, crie a pasta chamada business;
Crie o arquivo api_workflow.dart;
Crie uma classe abstrata chamada ApiWorkflow.
A classe ApiWorkflow deve ter um método assíncrono chamado getEntriesByCategory que retorna uma lista de objetos do tipo Entry.
O método getEntriesByCategory deve receber um parâmetro obrigatório do tipo String chamado category.
Criando as regras de negócios do banco de dados:
Dentro de business, crie o arquivo dao_workflow.dart;
Crie uma classe abstrata chamada DaoWorkflow.
A classe DaoWorkflow deve ter um método assíncrono chamado getSavedEntries que retorna uma lista de objetos do tipo Entry.
A classe DaoWorkflow deve ter um método assíncrono chamado saveEntry que não retorna nenhum valor.
O método saveEntry deve receber um parâmetro obrigatório do tipo Entry chamado entry.
A classe DaoWorkflow deve ter um método assíncrono chamado deleteEntry que não retorna nenhum valor.
O método deleteEntry deve receber um parâmetro obrigatório do tipo Entry chamado entry.
Caso queira conferir o código feito em curso, acesse o link do repositório no GitHub.

https://github.com/alura-cursos/3117-clean_architecture/archive/refs/heads/Aula1.zip

@@11
O que aprendemos?

Nessa aula, você aprendeu como:
Definir a camada de domínio da aplicação;
Criar a entidade/modelo que servirá como base de informações e funcionalidades de visualizar, salvar e deletar entradas;
Descrever as regras de negócios da API e banco de dados.
Parabéns por ter concluído a primeira aula!

Nos vemos na próxima aula do curso!

#### 16/11/2023

@02-Dados, bibliotecas e acoplamento

@@01
Projeto da aula anterior

Você pode revisar o seu código e acompanhar o passo a passo do desenvolvimento do nosso projeto e, se preferir, pode baixar o projeto da aula anterior.
Bons estudos!

https://github.com/alura-cursos/3117-clean_architecture/archive/refs/heads/Aula1.zip

@@02
Preparando o ambiente: instalando a biblioteca floor no projeto

Neste curso, queremos salvar as entradas favoritadas pelo usuário no próprio dispositivo. Para fazer isso, usaremos uma biblioteca chamada floor.
Passo 1: instalando a biblioteca floor
Para instalar a biblioteca floor, basta executar o seguinte comando no terminal do projeto:

flutter pub add floor 
COPIAR CÓDIGO
Passo 2: instalando as bibliotecas complementares
Também, precisamos de outras bibliotecas, então vamos instalar a sqflite, a floor_generator e a build_runner. Dessa maneira, siga as instruções abaixo:

1 - Instale a bilbioteca sqflite:

flutter pub add sqflite
COPIAR CÓDIGO
2 - Instale as bibliotecas floor_generator e build_runner como dependência de desenvolvedor, pois serão usadas apenas durante o desenvolvimento:

dart pub add --dev floor_generator build_runner 
COPIAR CÓDIGO
Ao final, o seu arquivo pubspec.yaml deve estar assim:

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  floor: ^1.4.2
  sqflite: ^2.3.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0
  floor_generator: ^1.4.2
  build_runner: ^2.4.6
COPIAR CÓDIGO
Até aqui, tudo tranquilo? Se sentir dificuldade, mande sua dúvida no fórum ou no discord!

@@03
A camada de dados e acoplamentos

Sairemos da camada de domínio, o núcleo, e expandiremos para a camada de dados, onde de fato guardamos as informações no banco de dados.
Instalando o Floor
Para isso, podemos utilizar a ferramenta Floor. Esta biblioteca será instalada em nosso projeto para nos ajudar nas operações de Select, Delete e Insert.

Existem algumas maneiras de instalar a biblioteca. Poderíamos usar o Flutter PubEdge e adicionar a biblioteca por lá ou, como eu recomendo para acompanhamento deste curso, adicioná-la diretamente no próprio PubSpec.

Arquivo pubspec.yaml no repositório do GitHub
No arquivo pubspec.yaml, vamos seguir para as dependências e adicionar as seguintes linhas. Vamos inserir estas dependências depois de cupertino_icons, na linha 37, para configurar o Floor.

Para o Floor, devemos chamar floor: ^1.4.2. Outra dependência que precisamos instalar é o sqflite, que será na versão 2.3.0.

pubspec.yaml
# código omitido

cupertino_icons: ^1.0.2
floor: ^1.4.2
sqflite: ^2.3.0

# código omitido
COPIAR CÓDIGO
Essas são dependências comuns (Dependencies), não devemos confundi-las com as DevDependencies. Além disso, haverá a adição de algumas informações na parte das dependências.

Em seguida, descemos até o DevDependencies e, na linha 50, adicionemos o floor_generator na mesma versão do Floor, que é a versão 1.4.2; e o build_runner na versão 2.4.6.

pubspec.yaml
# código omitido

flutter_lints: ^2.0.0
floor_generator: ^1.4.2
build_runner: ^2.4.6

# código omitido
COPIAR CÓDIGO
Salvamos o arquivo pubspec.yaml e, teoricamente, ele executará um Flutter PubGet. Minha IDE já fez o Flutter PubGet para poder buscar as extensões e bibliotecas.

No entanto, caso seja necessário fazer isso manualmente, vá ao seu terminal e digite flutter pub get.

flutter pub get
COPIAR CÓDIGO
Dessa forma, ele resolverá as dependências adicionadas no pubspec.yaml.

Até o momento, conseguimos instalar o Floor, mas qual era a necessidade de instalá-lo?

Precisamos apenas realizar as operações de Select, Delete e Insert. Essas são as três funcionalidades que precisamos para esse momento, a fim de salvar as informações no banco de dados.

É muito importante que, ao escolhermos uma biblioteca para usar no projeto, não optemos por um recurso que realiza inúmeras tarefas diferentes. O ideal é que cada biblioteca que adicionamos ao nosso projeto cumpra uma função muito específica.

Por que uma função específica é importante?

Se encontrarmos uma biblioteca que, além de gerenciar o banco de dados, desenha na tela, faz requisições e até nos prepara um café, aparentemente ela resolve todos os nossos problemas.

No entanto, caso essa biblioteca apresente problemas em alguma atualização e acabe causando falhas em nossa aplicação, teremos que reescrever todo o código.

Acoplamento
Portanto, a orientação do Clean Code é sobre o baixo acoplamento.

As bibliotecas devem estar o mínimo acopladas possível em nosso aplicativo.
O banco de dados que estamos utilizando, o Floor, servirá para executar as três funções: Insert, Delete e Select. Se precisarmos substituí-lo por outro banco de dados no futuro, não será um problema. Conseguiremos fazer isso de maneira fácil.

Claro que há suas particularidades, como tudo em programação depende.

Não conseguimos criar um projeto 100% desacoplado. É praticamente impossível, pois a própria linguagem Dart já é um acoplamento do nosso projeto. Isso ocorre porque a estrutura que usamos para escrever as classes, as chamadas e declarações de função podem ser diferentes se usarmos Python, Java, JavaScript, por exemplo.

Logo, já temos um acoplamento. É impossível criar algo 100% desacoplado.

Conclusão
Sempre haverá algum tipo de acoplamento, mas o importante é que, se for acoplar, acople na menor quantidade de coisas possíveis. Portanto, agora temos o Floor e poderemos, finalmente, utilizá-lo.

Vamos iniciar a criação do nosso banco de dados no próximo vídeo!

https://github.com/alura-cursos/3117-clean_architecture/blob/Aula2/pubspec.yaml

@@04
Para saber mais: aprofundando a camada de dados

 Imagem que mostra quatro esferas, uma dentro da outra, que representam as camadas da arquitetura limpa. A camada mais interior, na cor cinza, é a domínio. Em destaque, na segunda esfera, há a camada de dados na cor azul
A segunda camada que vamos implementar é chamada camada de dados!

Se a camada domínio era o núcleo que guarda as entidades e demais informações imutáveis do projeto, na camada de dados teremos o código relacionado às bibliotecas que lidam com dados de uma forma geral (incluindo o banco de dados).

@@05
Para saber mais: acoplamento e desacoplamento de bibliotecas

Se todos os módulos de um projeto estiverem muito interligados, ou seja, se as partes do nosso código dependem muito umas das outras, uma pequena alteração no código pode causar grandes problemas e erros no aplicativo. Aqui entram os conceitos de acoplamento e desacoplamento.
Acoplamento e desacoplamento: O que é?
Acoplamento e desacoplamento são conceitos em programação de software que se referem à medida em que nossa aplicação depende de um componente (ou biblioteca, em nosso caso), tanto em termos de entrada e saída de dados, quanto a sua estrutura.

Acoplamento é, essencialmente, o grau com qual uma biblioteca (ou módulo/componente/classe) depende de outras partes do código. Neste caso, temos um alto grau de dependência.

Já o desacoplamento é o oposto e se refere a isolar suas funcionalidades/módulos/classes de forma que elas sejam autônomas, minimizando as dependências. Em nosso projeto, estamos criando camadas específicas e autônomas, ou seja, estamos aplicando desacoplamento ao projeto Hyrule.

Para evitar erros no código e facilitar seu conserto, vamos deixar a biblioteca floor o mais independente possível das demais camadas.
Por que isso é importante?
O objetivo de trabalharmos com um código desacoplado é torná-lo mais fácil de manter, expandir e entender.

Com um código altamente acoplado, uma pequena alteração em uma parte do código pode causar efeitos colaterais inesperados em outros lugares, tornando muito difícil identificar e corrigir erros. Além disso, é muito mais difícil reutilizar partes do código se ele estiver altamente interconectado.

É praticamente impossível de criar um projeto 100% desacoplado. A própria linguagem de programação é um tipo de acoplamento, já que cada biblioteca/módulo precisa ser escrita na linguagem correspondente.
Exemplos práticos
Vamos pegar um exemplo prático: imagine um projeto onde temos uma biblioteca que consegue desenhar telas, lidar com banco de dados, faz requisição para API e estamos utilizando todas essas funcionalidades! Se a biblioteca parar de funcionar por algum motivo, grande parte da aplicação vai parar de funcionar também. Isso é um ótimo exemplo de acoplamento.

Em vez de utilizar uma biblioteca que “faz tudo”, o mais indicado é utilizar uma biblioteca para cada funcionalidade. Neste exemplo, utilizaríamos várias bibliotecas distintas:

Uma para desenhar telas;
Uma para fazer requisições para APIs;
Outra apenas para lidar com banco de dados.
Neste caso em cada biblioteca tem uma funcionalidade específica, o código fica mais desacoplado e menos dependente. Se uma biblioteca para de funcionar, temos um problema menor, pois as demais continuam funcionando.

Um código com desacoplamento seria o ideal. Porém, no mundo real, as coisas são mais complexas. As tecnologias mudam, nossas necessidades podem mudar e tudo pode variar. O importante é conseguir se adaptar de acordo com as dificuldades que encontramos.

Conclusão
Ao entender os conceitos de acoplamento e desacoplamento, você terá mais noção de como escrever um código claro, melhor de consertar e menos sujeito a erros. É tudo uma questão de quão interconectado seu código está - e encontrar o equilíbrio faz diferença.

@@06
Criando database com floor

Como vamos utilizar a biblioteca Floor? Primeiro, limpamos as abas que não estamos mais utilizando no editor de código. Além disso, como não vamos usar o emulador por agora, expandimos a tela inteira.
Criaremos a próxima camada de dados, chamada data.

Do lado esquerdo, na pasta lib, criamos na raiz do projeto uma outra pasta chamada data. Para isso, selecionamos com o botão direito do mouse em "lib" e escolhemos a opção "New Folder".

Dentro da pasta data, uma nova pasta chamada dao, que é onde vão ficar nossos Data Access Objects (DAOs) (em português, "Objeto de Acesso a Dados"). Dentro dele, criaremos o arquivo database.dat.

lib
data
dao
database.dart
Um detalhe importante é que a estrutura do Floor é característica da própria biblioteca. Portanto, se utilizarmos outra biblioteca de banco de dados, a implementação pode ser um pouco diferente.

A forma que aplicaremos será para o floor na versão mencionada do vídeo anterior.

Arquivo database.dart no repositório do GitHub
Logo no início do arquivo database.dart, importamos alguns pacotes. O primeiro import necessário é o dart:async. O segundo import é referente ao package:floor/floor.dart. Em seguida, fazemos o import do sqflite, utilizando o nome sqflite.dart.

database.dart
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
COPIAR CÓDIGO
Utilizaremos um arquivo gerado pelo build_runner para usar dentro do database.dart. Para importar esse arquivo gerado dentro do arquivo atual, usamos a diretiva part.

Assim, o part será database.g.dart. Esse arquivo será gerado automaticamente após executarmos o build_runner.

database.dart
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';
COPIAR CÓDIGO
Por enquanto, uma mensagem de erro pode aparecer. Observem que abaixo de 'database.g.dart' temos um sublinhado na cor vermelha, mas assim que o build_runner for executado, o erro desaparecerá.

Usamos a anotação @Database() para indicar que criaremos um banco de dados (database). Algumas informações devem ser passadas para dentro dessa anotação. Primeiro, a versão do nosso banco de dados (version), que será 1.

Também precisamos informar quais são as tabelas (entities) que teremos dentro do banco de dados. No caso, teremos apenas uma entidade que será o vetor ([]), sabendo que o vetor que desejamos passar é o Entry: [Entry].

database.dart
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [Entry])
COPIAR CÓDIGO
Agora, podemos começar a escrever nossa classe abstrata AppDatabase que deve estender do FloorDatabase : abstract class AppDatabase extends FloorDatabase {}.

Neste momento, Entry apresenta um problema pois ainda não foi importado. Observem que há um sublinhado na cor vermelha abaixo. Selecionamos o ícone de lâmpada e escolhemos a opção "import library '../../domain/models/entry.dart'".

database.dart
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:hyrule/data/dao/entry_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../domain/models/entry.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Entry])
abstract class AppDatabase extends FloorDatabase {

}
COPIAR CÓDIGO
Assim, importamos o Entry de domínio, models.entry.dart.

A classe entry foi anotada no database, porém o Floor ainda não reconhece essa classe como uma entidade. No arquivo entry.dart, precisamos adicionar as anotações necessárias para que o Floor identifique a classe como uma entidade.

Arquivo entry.dart no repositório do GitHub
Este processo demonstra o acoplamento que mencionei anteriormente. Mesmo que queiramos evitar acoplamentos, neste caso ele acabou ocorrendo com entry e o floor. Às notações que vamos acrescentar não vão modificar a classe de maneira extrema, mas é importante ressaltar que estamos criando acoplamentos.

Acima da linha que define a classe entry vamos adicionar a anotação @entity. Agora o floor já fez o import para nós. Acima do nosso int id, adicionamos a anotação @primaryKey.

entry.dart
import 'dart:convert';

import 'package:floor/floor.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
@entity
class Entry {
  @primaryKey
  int id;
  String name;

/// código omitido
COPIAR CÓDIGO
Podemos salvar os dois arquivos que alteramos.

Conclusão
Para concluir, precisamos informar onde vamos implementar as funções insert, delete e select do banco de dados.

Veremos isto posteriormente!

@@07
Criando o dao com floor

Até agora, apenas criamos o banco de dados. Ainda precisamos criar as requisições, realizar operações de inserção, remoção e seleção. Essas funcionalidades ficarão em um arquivo separado, ainda dentro do diretório DAO.
Criando as requisições
Dentro de dao, criaremos um novo arquivo chamado entry_dao.dart, pois serão funções que atuam exclusivamente na tabela de entrada. Para tal, selecionamos o botão direito do mouse em dao e escolhemos a opção "New Folder".

Arquivo entry_dao.dart no repositório do GitHub
Começaremos importando o floor. Agora usaremos a anotação @dao, que indicará que estamos criando um DAO. Teremos uma classe abstrata chamada EntryDao.

entry_dao.dart
import 'package:floor/floor.dart';

@dao
abstract class EntryDao {

}
COPIAR CÓDIGO
Começamos a adicionar nossas funções. Vamos começar com a nossa consulta (select), que será uma consulta query, @Query(). Dentro desta consulta, vamos passar como seria realizada em um banco de dados real.

Portanto, faremos uma consulta para selecionar todos os registros, na verdade. Será um asterisco (*), seguido de "FROM ENTRY," que é o nome da tabela.

Dessa forma, estamos recuperando todos os registros que estão dentro da tabela de entrada (entry). Essa função será do tipo Future, retornando uma lista de objetos do tipo "entry," que é o tipo correspondente ao nosso domínio ou módulo. O nome da função será getAllEntries.

entry_dao.dart
import 'package:floor/floor.dart';

import '../../domain/models/entry.dart';

@dao
abstract class EntryDao {
  @Query('SELECT * FROM ENTRY')
  Future<List<Entry>> getAllEntries();
COPIAR CÓDIGO
A próxima funcionalidade será a de inserção (insert). Aqui, há um detalhe: se tentarmos inserir uma entrada com o mesmo ID para evitar duplicidade, podemos adicionar uma propriedade chamada onConflict dentro deste insert. Dessa forma, podemos especificar a estratégia onConflictStrategy do SQFLite.

Essa estratégia verificará se há algum conflito e, em caso afirmativo, realizaremos uma substituição (replace), transformando assim esse insert em uma atualização, caso haja uma entrada com o mesmo ID.

Esta também será uma função que retornará um Future, mas não retornará nada de fato, portanto, terá um retorno do tipo void. A função se chamará addEntry e receberá um objeto do tipo entry.

entry_dao.dart
import 'package:floor/floor.dart';

import '../../domain/models/entry.dart';

@dao
abstract class EntryDao {
  @Query('SELECT * FROM ENTRY')
  Future<List<Entry>> getAllEntries();
    
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addEntry(Entry entry);

}
COPIAR CÓDIGO
A próxima função será para remoção (delete), então usaremos @delete. Essa função também retornará um Future e seu retorno será void. Ela se chamará removeEntry. Novamente, precisaremos passar como parâmetro qual entrada será removida, portanto, usaremos Entry entry.

entry_dao.dart
import 'package:floor/floor.dart';

import '../../domain/models/entry.dart';

@dao
abstract class EntryDao {
  @Query('SELECT * FROM ENTRY')
  Future<List<Entry>> getAllEntries();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addEntry(Entry entry);

  @delete
  Future<void> removeEntry(Entry entry);
}
COPIAR CÓDIGO
Com isso, temos nosso DAO pronto, com as funções que serão responsáveis por adicionar, remover ou selecionar registros no banco de dados. Agora, precisamos integrá-lo ao nosso database.

Integrando o DAO ao database
Dentro do nosso database (database.dart), precisamos chamar esse DAO. Portanto, faremos a importação dele, utilizando EntryDao e get entryDao, como se o retorno fosse exatamente a variável que já retornará uma instância de EntryDao.

database.dart
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:hyrule/data/dao/entry_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../domain/models/entry.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Entry])
abstract class AppDatabase extends FloorDatabase {
  EntryDao get entryDao;
}
COPIAR CÓDIGO
Após salvar o arquivo, ainda estamos com erros porque falta esse arquivo.

Verificando no terminal
Para verificar se tudo está correto, abrimos o terminal. No terminal, executamos o BuildRunner, com o comando:

flutter pub run build_runner build
COPIAR CÓDIGO
Agora, ele está construindo todos os pacotes do BuildRunner e gerando os arquivos.

Em seguida, verificamos se o nosso arquivo database.g aparece dentro do diretório dao. Se estiver presente e sem erros, tudo está funcionando perfeitamente.

Assim, temos nosso arquivo gerado, tudo importado e sem erros no nosso banco de dados. Ótimo trabalho!

Até mais!

@@08
Problemas de alto acoplamento

Bug detectado!
Um aplicativo de gestão de pessoas parou de funcionar.

Ao analisá-lo, você identificou que ele utiliza uma biblioteca para gerenciar todas as interações com os usuários: criação de modelos, requisições para API, armazenamento no banco de dados etc!

Então, a biblioteca quebrou devido a um problema de segurança, o que fez o aplicativo não funcionar mais.

Como essa situação ilustra os problemas de alto acoplamento na arquitetura de software?

A situação não está relacionada ao acoplamento, pois a falha veio da biblioteca, não da aplicação.
 
O uso dependente do seu software em uma biblioteca específica é uma forma de acoplamento. A falha da biblioteca ilustra claramente como o acoplamento pode levar a problemas significativos.
Alternativa correta
O problema da situação é o uso inadequado da biblioteca, não o acoplamento.
 
Embora o uso inadequado de bibliotecas possa levar a problemas, neste contexto, o problema é claramente o alto grau de acoplamento. Se a sua aplicação depende tanto de uma única biblioteca que falha total quando a biblioteca falha, isso é alto acoplamento.
Alternativa correta
A aplicação está fortemente acoplada à biblioteca, o que significa que terá que ser quase totalmente reescrita para funcionar sem ela.
 
Esse é um exemplo clássico dos problemas com o alto acoplamento. Se uma única falha ou mudança em uma biblioteca ou ferramenta interrompe o funcionamento completo do seu software, você tem um alto grau de acoplamento.
Alternativa correta
Problemas de segurança não são relacionados ao acoplamento.

@@09
Faça como eu fiz: utilizando bibliotecas

Nesta aula, você aprendeu sobre a importância de evitar alto acoplamento mas também que é quase impossível uma aplicação não ter acoplamento algum. Então, instalamos algumas bibliotecas necessárias:
floor (versão ^1.4.2);
sqflite (versão ^2.3.0);
floor_generator (versão ^1.4.2);
build_runner (versão ^2.4.6).
Caso você não as tenha instalado, pode fazer isso agora.
Com as bibliotecas instaladas, siga os passos a seguir:

Utilize a biblioteca floor e sqflite para o nosso banco de dados;
Crie o arquivo database.dart;
Construa o entry_dao.dart para as operações de listar, inserir, atualizar e remover uma entrada.
Bons estudos!

Caso queira mais detalhes sobre como implementar essa parte da camada de dados da aplicação, aqui vai um passo a passo:
1 - No arquivo pubspec.yaml, adiciona as seguintes bibliotecas:

a) floor (versão ^1.4.2);
b) sqflite (versão ^2.3.0);
c) floor_generator (versão ^1.4.2);
d) build_runner (versão ^2.4.6).
    dependencies:
      flutter:
        sdk: flutter
      cupertino_icons: ^1.0.2
      floor: ^1.4.2
      sqflite: ^2.3.0
    
    dev_dependencies:
      flutter_test:
      flutter_lints: ^2.0.0
      floor_generator: ^1.4.2
      build_runner: ^2.4.6
COPIAR CÓDIGO
2 - Na pasta lib:

a) Crie uma pasta chamada data;
b) E dentro de data, crie outra pasta chamada dao;
c) Dentro de dao crie um arquivo chamado database.dart, e utilizando o floor, crie um database:
        import 'dart:async';
        import 'package:floor/floor.dart';
        import 'package:sqflite/sqflite.dart' as sqflite;
        
        import '../../domain/models/entry.dart';
        
        part 'database.g.dart';
        
        @Database(version: 1, entities: [Entry])
        abstract class AppDatabase extends FloorDatabase {
        
        }
COPIAR CÓDIGO
3 - Agora, na entidade Entry, que está na pasta lib/domain/models/entry.dart:

a) Adicione a label de entity e primaryKey:
        import 'dart:convert';
        
        import 'package:floor/floor.dart';
        
        @entity
        class Entry { 
          @primaryKey
          int id;
          String name;
          String image;
          String description;
          String commonLocations;
          String category;
            //...
        }
COPIAR CÓDIGO
4 - Crie a classe dao que vai realizar as operações de listar, inserir, atualizar e remover uma entrada, tudo isso utilizando o floor:

    import 'package:floor/floor.dart';
    
    import '../../domain/models/entry.dart';
    
    @dao
    abstract class EntryDao {
        //método para buscar entradas
      @Query('SELECT * FROM ENTRY')
      Future<List<Entry>> getAllEntries();
    
        //método para adicionar ou atualizar entradas
      @Insert(onConflict: OnConflictStrategy.replace)
      Future<void> addEntry(Entry entry);
    
        //método para deletar entradas
      @delete
      Future<void> removeEntry(Entry entry);
    }
COPIAR CÓDIGO
5 - Novamente, em database.dart agora precisamos inserir o EntryDao que acabamos de criar:

    /...
    
    @Database(version: 1, entities: [Entry])
    abstract class AppDatabase extends FloorDatabase {
        //EntryDao
        EntryDao get entryDao;
    }
COPIAR CÓDIGO
Dessa maneira, criamos uma parte da camada de dados da aplicação, responsável pelo banco de dados!

Caso queira conferir o código feito em curso, acesse o link do repositório no GitHub.

https://github.com/alura-cursos/3117-clean_architecture/archive/refs/heads/Aula2.zip

@@10
O que aprendemos?

Nessa aula, você aprendeu a:
Criar parte da camada de dados da aplicação:
Como listar, adicionar, atualizar e remover dados;
Como criar um database com as bibliotecas floor e sqflite;
Saber quando e como acoplar a aplicação para evitar grandes problemas em um aplicativo Flutter.
Parabéns por ter concluído a segunda aula!

Nos vemos na próxima aula do curso!