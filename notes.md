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

#### 17/11/2023

@03-Camada utils e API

@@01
Projeto da aula anterior

Você pode revisar o seu código e acompanhar o passo a passo do desenvolvimento do nosso projeto e, se preferir, pode baixar o projeto da aula anterior.

https://github.com/alura-cursos/3117-clean_architecture/archive/refs/heads/Aula2.zip

@@02
Lidando com a biblioteca DIO e a nossa API

Nosso próximo passo será fazer a requisição para a API do Hyrule, onde vamos pegar as entradas por categoria. Para realizar essa requisição, utilizaremos a biblioteca do DIO.
Lidando com a biblioteca DIO e a nossa API
Da mesma forma que fizemos com o floor, precisamos adicionar alguns pacotes dentro do pubspec.yaml. Portanto, vamos abrir o arquivo e adicionar os dois pacotes que precisamos em dependencies.

O primeiro pacote será o http, que deve ser na versão 1.1.0. O outro pacote é o dio, na versão 5.3.2.

pubspec.yaml:
dependencies:
  flutter:
    sdk: flutter


  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.2
  floor: ^1.4.2
  sqflite: ^2.3.0
  http: ^1.1.0
  dio: ^5.3.2
COPIAR CÓDIGO
Após salvar o arquivo pubspec.yaml, a IDE deverá fazer o pub get. Caso isso não ocorra, podemos abrir o terminal e rodar flutter pub get.

flutter pub get
COPIAR CÓDIGO
Isso irá resolver as dependências. Se tudo ocorrer corretamente, os pacotes serão instalados. Agora, podemos fazer o que fizemos com o floor.

Criando a classe DataApi
Vamos criar uma nova pasta dentro da pasta "data", chamada "API", onde ficarão nossas requisições para a API. Assim como o DAO tem as requisições para obter a informação do banco de dados, salvar e deletar, dentro da pasta "API" teremos a conexão do DIO com a API para obter as informações.

Dentro da pasta "API", criaremos um novo arquivo chamado data_api.dart, onde podemos iniciar a escrita da classe.

No escopo da classe DataApi, vamos criar a primeira instância de dio, então teremos final Dio dio = Dio(). Feito isso, precisamos importar o Dio do pacote dio.

data_api.dart:
import 'package:dio/dio.dart';

class DataApi {
  final Dio dio = Dio();
}
COPIAR CÓDIGO
Essa classe terá que retornar uma lista de entradas, então já podemos declará-la no começo, usando List<Entry> entries = [] e aproveitando para importar Entry.

import 'package:dio/dio.dart';
import 'package:hyrule/domain/models/entry.dart';

class DataApi {
  final Dio dio = Dio();
  List<Entry> entries = [];
}
COPIAR CÓDIGO
Criando a função getEntriesByCategory()
Agora, precisamos criar uma função que irá preencher entries com algum valor. Essa função, por fazer uma requisição assíncrona para a API, deve ser um Future que retornará uma lista de entradas.

Vamos chamar essa função de getEntriesByCategory(). Precisamos receber uma string que será a categoria, então entre parênteses e entre chaves, passamos required String category. Sendo uma função assíncrona, temos que indicar que isso ao final da linha.

// código omitido

class DataApi {
  final Dio dio = Dio();
  List<Entry> entries = [];
  
  Future<List<Entry>> getEntriesByCategory({required String category}) async {
  
  }
}
COPIAR CÓDIGO
Fazendo a requisição
Agora, podemos fazer a nossa requisição. Criaremos uma variável final response que receberá await dio.get().

O método get() receberá a URL de onde vamos fazer a busca da API pela categoria. Copiaremos ela da documentação, sem a palavra "monsters" ao final, que é a categoria que queremos pegar.

Após inserir a URL entre aspas duplas, podemos adicionar a variável que recebemos por meio de concatenação.

// código omitido

Future<List<Entry>> getEntriesByCategory({required String category}) async {
  final response = await dio.get("https://botw-compendium.herokuapp.com/api/v3/compendium/category/" + category);
}
COPIAR CÓDIGO
Criando uma lista
Dessa forma, temos a response. Agora, precisamos criar uma lista a partir dessa resposta e retorná-la para a nossa função.

Para preencher entries, temos que criar a lista. Portanto, vamos passar entries na linha 10 recebendo List<Entry>.from(), para criar a lista de entradas a partir de response.data, que passaremos entre parênteses.

Future<List<Entry>> getEntriesByCategory({required String category}) async {
  final response = await dio.get("https://botw-compendium.herokuapp.com/api/v3/compendium/category/" + category);
  entries = List<Entry>.from(response.data)
}
COPIAR CÓDIGO
Se voltarmos rapidamente para o navegador, onde fizemos a requisição de "monsters", podemos verificar que a primeira entrada que recebemos, o primeiro parâmetro do objeto JSON, é o data.

Portanto, é a partir de data que precisamos extrair as informações. Concluído isto, temos uma lista de objetos pronta.

De volta ao editor de código, vamos inserir o parâmetro data entre os colchetes de response.data[].

A partir dessa resposta, faremos uma transformação utilizando map(), que receberá um elemento. Esse elemento será cada item da lista de objetos (e). Em seguida, vamos usar Entry.fromMap(), que receberá e, ou seja, o elemento do objeto JSON que recebemos da API.

Future<List<Entry>> getEntriesByCategory({required String category}) async {
  final response = await dio.get("https://botw-compendium.herokuapp.com/api/v3/compendium/category/" + category);
  entries = List<Entry>.from(response.data["data"].map((e) => Entry.fromMap(e)));
}
COPIAR CÓDIGO
Interessante observar que já geramos o fromMap() quando utilizamos o plugin do Visual Studio Code para nos auxiliar na geração do código. Isso nos adiantou um bom tempo, no momento em que iniciamos nosso trabalho.
Com isso, temos nossa lista montada. Agora basta retornar para a função ficar completa. Portanto, finalizaremos com return entries.

import 'package:dio/dio.dart';
import 'package:hyrule/domain/models/entry.dart';

class DataApi {
  final Dio dio = Dio();
  List<Entry> entries = [];

  Future<List<Entry>> getEntriesByCategory({required String category}) async {
    final response = await dio.get("https://botw-compendium.herokuapp.com/api/v3/compendium/category/" + category);
    entries = List<Entry>.from(response.data["data"].map((e) => Entry.fromMap(e)));
    return entries;
  }
}
COPIAR CÓDIGO
Conclusão
Criamos nossa chamada para a API usando DIO! Note que, utilizando o DIO, em poucas linhas, conseguimos fazer uma requisição, transformá-la em JSON, armazená-la em uma lista e devolvê-la. Isso elimina a necessidade de vários outros passos que teríamos se usássemos apenas HTTP.

@@03
O que não muda é constante

Dentro da função dio.get(), nós inserimos a URL da API para buscar por categoria. O detalhe é que esse projeto no qual trabalhamos não tem muitas requisições, então não é um projeto muito complexo.
Trata-se de um projeto um pouco mais simples, porém, isso não significa que não deveríamos organizá-lo conforme as funcionalidades do Clean.

O que não muda é constante
A URL é usada na função getEntriesByCategory(), mas ela não vai mudar. Inclusive, até o próprio Dart já nos sugere que essa variável poderia ser uma constante, que poderia ser colocada em algum outro lugar.

Tudo que não será modificado no projeto, será constante e pode ficar em outra camada. Esta é uma camada que o Clean chama de Utils.

Utils é onde ficarão todas as ferramentas que podemos reutilizar em todo o projeto e também onde podemos concentrar informações, por exemplo, constantes que não serão alteradas.

Suponha que fizemos inúmeras requisições diferentes para a API. São URLs diferentes, mas todas elas pertencem à mesma API. Podemos criar um arquivo que vai conter uma lista de todas as URLs que usaremos para essa API.

Posteriormente, ao invés de continuar escrevendo manualmente ou alterar alguma dessas URLs, nós simplesmente vamos para esse arquivo e alteramos a URL que queremos mudar.

Assim, fica algo um pouco mais organizado e conforme o projeto cresce — lembrando que um aspecto da arquitetura é escalabilidade —, ele se torna mais organizado e mais fácil de receber manutenção.

Criando a constante url
Para esse passo, vamos substituir a URL de uma string para colocá-la dentro de uma variável. É uma camada separada que ficará na raiz da pasta "lib", dentro de uma nova pasta "utils".

Dentro de "utils", criaremos outra pasta chamada "consts". Isso porque em "utils", também podemos colocar informações de temas.

Temas são coisas que não vão mudar nunca, como as cores da aplicação e a tipografia, por exemplo. Elas também podem ficar dentro de "utils", pois serão ferramentas de estilização para nós.
Agora, dentro de "consts", criaremos um novo arquivo chamado api.dart. Será um arquivo simples, onde criaremos uma constante String a qual chamaremos de url. Ela receberá a string que copiamos da API. Então, vamos recortar a URL de data_api.dart e colar em api.dart.

api.dart:
const String url = "https://botw-compendium.herokuapp.com/api/v3/compendium/category/";
COPIAR CÓDIGO
Feito isso, temos nossa string e podemos salvar o arquivo api.dart. Agora, no arquivo data_api.dart, só precisamos importar a URL.

data_api.dart:
import 'package:dio/dio.dart';
import 'package:hyrule/domain/models/entry.dart';
import 'package:hyrule/utils/consts/api.dart';

class DataApi {
  final Dio dio = Dio();
  List<Entry> entries = [];

  Future<List<Entry>> getEntriesByCategory({required String category}) async {
    final response = await dio.get(url + category);
    entries = List<Entry>.from(response.data["data"].map((e) => Entry.fromMap(e)));
    return entries;
  }
}
COPIAR CÓDIGO
Atenção: precisamos tomar cuidado, pois ao escrever a URL, como ficou um pouco genérica, podemos nos confundir com o nome do import.
Assim fica mais interessante e a requisição se torna mais limpa, porque agora não precisamos saber qual é a URL. Sabemos que ela vem de algum lugar, e esse lugar é das constantes do nosso Utils. À medida que adicionarmos mais coisas ao nosso projeto, vamos adicionar mais coisas ao Utils.

Conclusão
Com isso, terminamos a nossa camada de dados, de informações.

Você deve estar se perguntando: fizemos as requisições da API e do banco de dados, mas onde vamos usar o API Workflow ou DAO Workflow? Agora começamos a transitar por outra camada, onde realmente importamos e implementamos a nossa regra de negócios.

Nos encontramos no próximo vídeo!

@@04
Para saber mais: aprofundando na camada utils

 
Nesta aula, você conheceu uma nova camada: a utils (em português, “utilitários”). Responsável por armazenar nossas bibliotecas, é uma camada realmente útil para inserirmos partes do código que tendem a não mudar.

O que são utilitários (utils)?
Os utilitários, também conhecidos como utils, são classes ou funções que contêm métodos auxiliares e lógica reutilizável para realizar tarefas específicas em um aplicativo Flutter. Essas tarefas podem variar desde funções de formatação de datas até métodos para efetuar chamadas de API, validação de entrada de dados e muito mais. A ideia principal é encapsular funcionalidades que podem ser reutilizadas em várias partes do código.

Para que servem os utilitários (utils)?
Os utilitários servem para várias finalidades dentro de um projeto Flutter:

1) Reutilização de Código
Os utilitários encapsulam funcionalidades comuns, permitindo que você as utilize em diferentes partes do aplicativo. Isso evita a duplicação de código e promove a coesão, deixando o código mais limpo e simples de trabalhar e arrumar.

2) Abstração de Lógica Complexa
Funcionalidades complexas podem ser abstraídas na camda utils, tornando o código do aplicativo principal mais simples e legível. Isso facilita a compreensão da lógica de negócios e a manutenção futura.

3) Testabilidade
Com a camada utils, você pode isolar e testar unidades de código independentes, o que é essencial para garantir a qualidade do software por meio de testes unitários e de integração.

Exemplos práticos
No projeto Hyrule, colocamos bibliotecas dentro da camada utils. Veja outros exemplos e casos de uso comuns para a camada utils no Flutter:

1. Formatação de Data e Hora
Utilitários podem conter métodos para formatar datas e horas de acordo com diferentes padrões. Isso é útil para exibir datas de forma amigável ao usuário ou para formatar datas antes de enviá-las para um servidor.

Exemplo:

dartCopy code
class DateUtils {
  static String formatToShortDate(DateTime date) {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }
}
COPIAR CÓDIGO
2. Validação de Entrada de Dados
Você pode criar utilitários para validar entradas de dados, como endereços de e-mail, senhas, números de telefone, etc. Isso ajuda a manter a consistência e a segurança dos dados do aplicativo.

Exemplo:

dartCopy code
class ValidationUtils {
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }
}
COPIAR CÓDIGO
3. Chamadas de API
Utilitários podem conter métodos para realizar chamadas de API de forma assíncrona, tratando erros e retornando dados formatados.

Exemplo:

dartCopy code
class ApiUtils {
  static Future<Map<String, dynamic>> fetchData(String apiUrl) async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Falha na chamada da API');
    }
  }
}
COPIAR CÓDIGO
4. Internacionalização
Utilitários podem ajudar na internacionalização do aplicativo, oferecendo métodos para obter strings traduzidas de acordo com o idioma definido pelo usuário.

Exemplo:

dartCopy code
class LocalizationUtils {
  static String translate(String key, String locale) {
    // Lógica para buscar a tradução da chave no arquivo de recursos apropriado
  }
}
COPIAR CÓDIGO
Lembre-se de que a estrutura da camada utils pode variar de acordo com as necessidades do projeto, mas a ideia fundamental é manter o código limpo, reutilizável e fácil de manter.

Fez sentido?

@@05
Lidando com constantes em projetos otimizados

Você está trabalhando em um projeto de um aplicativo de biblioteca utilizando a Clean Architecture com Flutter.
O projeto consiste em aplicar o conhecimento adquirido em aula para construir uma aplicação eficiente que armazena informações de todos os tipos de livros obtidos de uma API. O passo inicial envolve definir a constante de URL.

Dada essa situação, como você faria isso da maneira correta?

Você escreve a URL diretamente no momento em que faz a requisição à API.
http.get('https://www.googleapis.com/books/v1/volumes');
 
Alternativa correta
Você deixa a URL como uma variável global não definida.
String url;
 
Alternativa correta
Você define a URL como uma variável de String.
String url = 'https://www.googleapis.com/books/v1/volumes';
 
Definir a URL como uma variável de String não torna ela constante, o que pode levar a mudanças indesejadas ao longo do projeto.
Alternativa correta
Você define a URL como um literal de string.
const String url = 'https://www.googleapis.com/books/v1/volumes';
 
Definir a URL como um literal de string é a prática recomendada, pois permite que a URL seja usada de maneira consistente em todo o código, facilitando a manutenção e prevenindo mudanças indesejadas.
Alternativa correta
Você define a URL dentro de uma função.
getUrl() {
  const url = 'https://www.googleapis.com/books/v1/volumes';
  return url;
}

@@06
O que mais é útil?

Depois de montar a constante da URL, você reparou que existem mais coisas no projeto que não serão alterados: a tipografia. Você decidiu implantar uma fonte especial para os nomes dos livros.
Como você definiria a constante de estilização de tipografia no seu código Flutter?

Textstyle UserFont = const (fontFamily: 'UserFont', fontSize: 24.0);
 
Esta alternativa é inválida porque o nome da classe TextStyle não está correto. Além disso, a palavra-chave const está posicionada de maneira inadequada.
Alternativa correta
UserFont = const TextStyle(fontFamily: 'UserFont', fontSize: 24.0);
 
Alternativa correta
const UserFont = TextStyle('UserFont', 24.0);
 
Este exemplo é inválido porque a classe TextStyle espera que os parâmetros sejam nomeados, como fontFamily e fontSize. Apenas passar os valores não é suficiente.
Alternativa correta
UserFont = TextStyle('UserFont', 24.0);
 
Alternativa correta
const UserFont = TextStyle(fontFamily: 'UserFont', fontSize: 24.0);
 
Esta é a maneira correta de definir a constante de estilização no Flutter. Você criou uma constante chamada UserFont e utilizou o TextStyle, passando o nome da fonte e o tamanho desejado.

@@07
Faça como eu fiz: DIO e a camada utils

Nesta aula vimos como utilizar a biblioteca DIO e também uma nova camada, a de utils.
Faça as seguintes implementações em seu projeto:

Adicione a biblioteca DIO em seu projeto;
Crie uma classe para lidar com as informações da API;
Dentro dessa classe, faça a requisição para a API do compendium (https://botw-compendium.herokuapp.com/api/v3/compendium/category/);
Crie a camada utils para deixar as informações constantes da aplicação.
Vamos lá?

https://botw-compendium.herokuapp.com/api/v3/compendium/category/

Você pode conferir o gitHub ou ver o passo a passo a seguir:
Instalando DIO:
Adicione as dependências http e dio na seção dependencies com suas respectivas versões:
http: ^1.1.0
dio: ^5.3.2
Criando nossa constante:
Crie uma nova camada chamada utils e dentro dela crie a pasta consts;
Crie um arquivo chamado api.dart;
Dentro declare uma variável do tipo String constante que contém a url da API.
Fazendo a requisição:
Crie uma classe chamada DataApi;
Crie uma instância de DIO;
Crie uma lista do tipo Entry inicializando com uma lista vazia;
Crie o método getEntriesByCategory que retorna uma lista de objetos Entry e recebe um parâmetro category do tipo String;
Dentro do método, faça uma requisição utilizando o dio e a constante api que criamos dentro de consts;
Após a requisição, converta a resposta em uma lista de objetos Entry e atribua a lista entries;
Retorne a lista entries no final do método.
Pronto, terminamos uma parte da camada de dados!

https://github.com/alura-cursos/3117-clean_architecture/archive/refs/heads/Aula3.zip

@@08
O que aprendemos?

Nessa aula, você aprendeu como:
Instalar a biblioteca DIO;
Utilizar a biblioteca dentro do projeto;
Aplicar a camada utils, entendendo sua utilidade para um projeto.
Parabéns por ter concluído mais uma aula. Bons estudos!

@04-Controller e workflow

@@01
Projeto da aula anterior

Você pode revisar o seu código e acompanhar o passo a passo do desenvolvimento do nosso projeto e, se preferir, pode baixar o projeto da aula anterior.
Bons estudos!

@@02
Entendendo e aplicando a camada controller

Já temos nossas funções para adicionar e remover uma entrada do banco de dados, mostrar as entradas do banco de dados, e também fizemos as requisições para a API.
No entanto, ainda não implementamos nosso workflow (fluxo de trabalho), que seria nossa regra de negócios, as nossas interfaces. Esses são os lugares onde realmente faremos a lógica da aplicação. Como faremos a ponte de comunicação entre as telas e nossa regra de negócios?

Entendendo e aplicando a camada controller
Podemos usar como referência outro padrão de arquitetura: o MVC (Model-View-Controller). Se você já trabalhou com MVC, deve ter pensado em controllers (controladores). Para quem ainda não conhece, no MVC, temos a view e a parte do back-end, onde temos nossos modelos e tudo mais.

Para comunicar entre essa parte do back-end e a view (ou o front-end), o MVC utiliza os controladores. É nos controladores onde fica realmente a implementação da regra de negócios. A view, ou front-end, apenas chama as funções do controlador, e dentro do controlador será chamado o banco de dados e assim por diante.

A partir da ideia do controller, podemos implementar esse conceito, ou seja, essa nova camada dentro do nosso projeto.

Dentro de "lib", criaremos uma nova pasta, que será uma nova camada chamada "controllers". Em "controllers", teremos dois arquivos:

O primeiro será o controller do banco de dados, que podemos chamar de dao_controller.dart;
O outro arquivo será o da API, que abordaremos mais para frente.
Criando a classe DaoController
Dentro de dao_controller.dart, vamos criar a classe DaoController. Como ela precisa implementar nossa regra de negócios, vamos utilizar implements DaoWorkflow.

dao_controller.dart:
import 'package:hyrule/domain/business/dao_workflow.dart';

class DaoController implements DaoWorkflow {

}
COPIAR CÓDIGO
Criando um banco de dados
Nesse momento, observe que temos um alerta, pedindo a implementação das funções da interface que criamos. Primeiramente, precisamos criar um banco de dados.

Criamos as funções usando o floor, que tem sua maneira de gerar um banco de dados. Mas precisamos chamar essa função e dizer "crie esse banco de dados", pois ele ainda não foi criado. A função está pronta e só precisamos chamá-la.

No escopo da classe DaoController, vamos chamar a função para criar o banco de dados. Ela será uma Future que vai retornar EntryDao e vamos chamá-la de createDatabase(). Essa será uma função assíncrona.

Nessa etapa, precisamos importar EntryDao.
import 'package:hyrule/domain/business/dao_workflow.dart';
import '../data/dao/entry_dao.dart';

class DaoController implements DaoWorkflow {
  Future<EntryDao> createDatabase() async {
  
  }
}
COPIAR CÓDIGO
A função createDatabase() precisa de algumas funcionalidades do floor. A sintaxe que implementaremos agora é muito específica do floor.

A depender da biblioteca de gerenciamento de banco de dados que você colocou, essa implementação pode ser diferente.

O que escreveremos pode ser muito específico para o floor, mas a ideia de criar o banco de dados é algo que continuará a ser necessário, independentemente da biblioteca posterior. É importante prestar atenção no fluxo do que será desenvolvido.

No escopo da função createDatabase(), criaremos um final database que receberá await $FloorAppDatabase.databaseBuilder().

Entre os parênteses de databaseBuilder(), definiremos o nome do banco de dados como app_database.db. Ao final, chamaremos o método build() para de fato gerar e criar o banco de dados.

// código omitido

class DaoController implements DaoWorkflow {
  Future<EntryDao> createDatabase() async {
    final database = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
  }
}
COPIAR CÓDIGO
Após isso, precisamos criar também um final EntryDao, pois é o tipo de retorno que daremos para essa função. O EntryDao de nome entryDao receberá database.entryDao, que foi gerado pelo databaseBuilder().

Para finalizar, adicionamos return entryDao.

import 'package:hyrule/domain/business/dao_workflow.dart';
import '../data/dao/entry_dao.dart';

class DaoController implements DaoWorkflow {
  Future<EntryDao> createDatabase() async {
    final database = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
    final EntryDao entryDao = database.entryDao;
    return entryDao;
  }
}
COPIAR CÓDIGO
Importando as funções
Finalizamos nossa função createDatabase(). Agora podemos atender ao pedido da classe DaoController e importar as funções.

Para isso, clicamos sobre DaoController, pressionamos "Command + ." (Ctrl + ." para Windows), selecionamos a opção "Create 3 missing overrides" e pressionamos "Enter" para gerar as três funções da interface.

import 'package:hyrule/data/dao/database.dart';
import 'package:hyrule/domain/business/dao_workflow.dart';
import 'package:hyrule/domain/models/entry.dart';

import '../data/dao/entry_dao.dart';

class DaoController implements DaoWorkflow {
  Future<EntryDao> createDatabase() async {
    final database = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
    final EntryDao entryDao = database.entryDao;
    return entryDao;
  }

  @override
  Future<void> deleteEntry({required Entry entry}) {
    // TODO: implement deleteEntry
    throw UnimplementedError();
  }

  @override
  Future<List<Entry>> getSavedEntries() {
    // TODO: implement getSavedEntries
    throw UnimplementedError();
  }

  @override
  Future<void> saveEntry({required Entry entry}) async {
    // TODO: implement saveEntry
    throw UnimplementedError();
  }
}
COPIAR CÓDIGO
Conclusão
A única tarefa que precisamos executar é a implementação dessas funções. Faremos isso mais tarde, ao integrar o EntryDao, chamando as funções de adicionar, remover e pegar todas as entradas do nosso banco de dados!

@@03
Implementando a regra de negócios

Com a nossa interface implementada, precisamos agora realmente colocar a nossa versão, a nossa implementação, nas funções que propusemos no workflow, isto é, na nossa regra de negócios.
Essa é uma característica bastante interessante do Clean, porque agora que temos a implementação na interface, não importa como vamos implementar ou usar o banco de dados, ou qual banco vamos usar.

O que importa é que precisamos agora realmente inserir a opção de excluir uma entrada, buscar todas as entradas e salvar uma nova entrada.

Implementando a regra de negócios
Estamos usando o nosso banco de dados, o floor, e já temos um database. Portanto, precisamos apenas pegar esse database, inseri-lo no DAO, e chamar as funções do DAO em cada uma dessas funções.

Trabalhando na função deleteEntry()
Começaremos pela deleteEntry(). Como precisamos criar o database primeiro, todas as funções que temos na interface precisam ser assíncronas. Então, vamos adicionar async ao final da função deleteEntry().

dao_controller.dart:
@override
Future<void> deleteEntry({required Entry entry}) async {

}
COPIAR CÓDIGO
Agora vamos criar o nosso database. Para isso, no escopo da função, digitaremos final EntryDao, lembrando que a função createDatabase() retorna um EntryDao. Chamaremos de entryDao e ele receberá await createDatabase().

Agora, com o DAO criado, chamamos entryDao.removeEntry(), para deletar a entrada. Recebemos entry dentro da função e, assim, removemos a entrada.

@override
Future<void> deleteEntry({required Entry entry}) async {
  final EntryDao entryDao = await createDatabase();
  entryDao.removeEntry(entry);
}
COPIAR CÓDIGO
Outra questão do Clean é a nomenclatura. A forma como escrevemos as funções e as propriedades que serão implementadas preza pela facilidade.
Nem precisamos escrever a palavra "entry" no código; o próprio recurso de autocompletar do editor de código percebeu, não porque sabia exatamente o que queríamos fazer, mas porque o nome da função recebeu uma entrada, e a nossa função deleteEntry() precisa também de uma entrada.

A consistência de nomes facilita muito e faz parte de toda a arquitetura. Uma nomenclatura clara e condizente com o que fazemos facilita muito a nossa tarefa como pessoas desenvolvedoras e este é um ótimo exemplo disso.

Trabalhando na função getSavedEntries()
A próxima função será a getSavedEntries(), que também deve ser uma função assíncrona. Para criar o database, digitamos a mesma linha usada na função anterior, ou seja, final EntryDao entryDao = await createDatabase().

Uma vez criado o database, precisamos retornar a lista. Para isso, usamos a função getAllEntries(), que retorna para nós uma lista de entradas.

@override
Future<List<Entry>> getSavedEntries() async {
  final EntryDao entryDao = await createDatabase();
  return entryDao.getAllEntries();
}
COPIAR CÓDIGO
Trabalhando na função saveEntry()
Encerraremos com a função assíncrona saveEntry(), para salvar uma entrada. A primeira linha no escopo da função será a mesma que a das funções anteriores, sem segredo. Para finalizar, chamamos entryDao seguido do método addEntry(), que recebe entry.

@override
Future<void> saveEntry({required Entry entry}) async {
  final EntryDao entryDao = await createDatabase();
  entryDao.addEntry(entry);
}
COPIAR CÓDIGO
Com isso, finalizamos o nosso controller!

@@04
Construindo o API controller

Agora, podemos criar o controller da nossa API!
Construindo o API controller
Assim como fizemos com o DaoController, vamos criar um novo arquivo dentro de "controllers", chamado api_controller.dart.

Criando a classe ApiController
Exatamente da mesma forma que fizemos com o DaoController, vamos criar uma classe ApiController que precisa implementar o API Workflow, ou seja, implements ApiWorkflow.

api_controller.dart:
import 'package:hyrule/domain/business/api_workflow.dart';

class ApiController implements ApiWorkflow {

}
COPIAR CÓDIGO
Novamente, a IDE reclama que precisa das funções. Porém, antes precisamos chamar a instância de DataApi. Assim, teremos que final DataApi dataApi é igual a DataApi().

// código omitido

class ApiController implements ApiWorkflow {
  final DataApi dataApi = DataApi();
}
COPIAR CÓDIGO
Implementando a função
Feito isso, podemos de fato implementar a função. Para isso, clicamos sobre a classe ApiController e pressionamos "Ctrl + ." ou "Command + ." para selecionar a opção "Create 1 missing override".

import 'package:hyrule/data/api/data_api.dart';
import 'package:hyrule/domain/business/api_workflow.dart';
import 'package:hyrule/domain/models/entry.dart';

class ApiController implements ApiWorkflow {
  final DataApi dataApi = DataApi();

  @override
  Future<List<Entry>> getEntriesByCategory({required String category}) {
    // TODO: implement getEntriesByCategory
    throw UnimplementedError();
  }
}
COPIAR CÓDIGO
Assim, a nossa função está criada. Agora só precisamos implementá-la do nosso jeito. O objetivo é retornar uma lista de entradas. Então, teremos o return de dataApi.getEntriesByCategory(), que recebe a categoria dentro do nome da função.

// código omitido

class ApiController implements ApiWorkflow {
  final DataApi dataApi = DataApi();

  @override
  Future<List<Entry>> getEntriesByCategory({required String category}) {
    return dataApi.getEntriesByCategory(category: category);
  }
}
COPIAR CÓDIGO
Novamente, a consistência da nomenclatura nos auxilia nesse caso.
Temos a implementação da função de pegar as entradas por categoria.

Conclusão
Foi bem simples e breve essa parte do API controller. Porém, é interessante que agora, com esses controles prontos, podemos realmente fazer a conexão com a interface.

Nosso próximo passo será a próxima camada que vamos desenvolver: a camada de apresentação (presenter). A partir dela, conforme for necessário durante a construção da interface, faremos chamadas para esses controladores.

Se precisarmos acessar o DAO controller, porque precisamos de algo no banco de dados, chamamos DaoController. Se precisarmos pegar algo da API ou fazer uma requisição para a API, chamamos ApiController.

Além disso, se fôssemos implementar mais funcionalidades, ou seja, quando a nossa lista de requisitos fosse maior ou comportasse mais itens, ou se a nossa aplicação tivesse mais ações a serem realizadas, adicionaríamos no workflow. O workflow, por consequência, iria adicionar nesses controllers.

Dessa forma, dentro dos controllers, faríamos a implementação do que deveria realmente acontecer ao final. Como ele vai devolver o que a requisição ou o que a lista de requisitos pede?

Nosso próximo passo é trabalhar com a camada presenter. Nos encontramos na próxima aula!

@@05
Implementação de controller na arquitetura limpa

Surgiu um desafio: implementar o banco de dados com a biblioteca floor.
Você já sabia sobre banco de dados e as funções de salvar, deletar e mostrar as informações dos usuários. O que precisa, agora, é de uma forma de fazer a comunicação entre o banco de dados e a interface visual.

Então, você se lembra do modelo MVC (Model-View-Controller) e decide implementar controllers para resolver o problema. Nesse sentido, cria a pasta controllers e o arquivo dao_controller.dart.

Pergunta: Qual código você escreveria para implementar esta funcionalidade?

class UserController {
  final UserDao userDao;

  UserController(this.userDao);

  Future<void> deleteUser({required User user}) async {
    userDao.removeUser(user);
  }

  Future<List<User>> getSavedUsers() async {
    return userDao.getAllUsers();
  }

  Future<void> saveUser({required User user}) async {
    userDao.addUser(user);
  }
}
 
Alternativa correta
class UserController {
  saveUser(User user) {
     print("Salvar: $user");
  }

  deleteUser(User user) {
     print("Deletar:  $user");
  }

  getSavedUsers() {
    print("Obter todos os usuários");
  }
}
 
Alternativa correta
class UserController implements DaoWorkflow {
  Future<UserDao> createDatabase() async {
    final database = await $FloorAppDatabase.databaseBuilder("users_database.db").build();
    final UserDao userDao = database.userDao;
    return userDao;
  }

  @override
  Future<void> deleteUser({required User user}) async {
    final UserDao userDao = await createDatabase();
    userDao.removeUser(user);
  }

  @override
  Future<List<User>> getSavedUsers() async {
    final UserDao userDao = await createDatabase();
    return userDao.getAllUsers();
  }

  @override
  Future<void> saveUser({required User user}) async {
    final UserDao userDao = await createDatabase();
    userDao.addUser(user);
  }
}
 
Este código segue as diretivas de arquitetura limpa, implementando um controller entre a UI e a camada de dados da aplicação. A camada controller apenas controla as operações do DAO e a liga com a camada de telas.
Alternativa correta
class UserController {
  addUser(User user){
    UserDao.addUser(user);
  }
}

@@06
Faça como eu fiz: implemente a camada controller

Nesta aula, vimos como implementar uma camada entre a UI e a camada de dados: o controller.
Faça as seguintes implementações:

Crie um DaoController que implementa a classe DaoWorkflow;
Implemente os métodos de DaoController (apagar, salvar e listar entradas);
Crie um ApiController que implementa a classe ApiWorkflow;
Implemente os métodos de ApiController (listar entradas da API).
Bons estudos!

Caso queira um passo a passo mais detalhado, deixo aqui:
Em lib, crie uma pasta chamada controller:
a) Crie um arquivo chamado dao_controller.dart que implementa a classe DaoWorkflow;
i) Crie um método que vai implementar o banco de dados com floor;
ii) Crie as funções obrigatórias (deleteEntry, getSavedEntries e saveEntry);
iii) Em cada uma dessas funções, chame o EntryDao para realizar a devida ação no banco de dados.
b) Crie um arquivo chamado ApiController que implementa a classe ApiWorkflow:
i) Crie uma instância de DataApi na classe;
ii) mplemente o método obrigatório (getEntriesByCategory);
iii) Nesse método, retorne o resultado da função getEntriesByCategory que a classe DataApi implementa.
Pronto! Criamos a camada controller da aplicação.

Caso queira conferir o código feito em curso, acesse o link do repositório no GitHub.

https://github.com/alura-cursos/3117-clean_architecture/archive/refs/heads/Aula4.zip

@@07
Para saber mais: aprofundando a camada controller

Como vimos, a camada controller funciona como uma mediadora que liga a camada de dados (que tem o banco de dados e API) com a camada responsável por mostrar esses dados na tela de forma visual para as pessoas usuárias.
Em nosso projeto, por exemplo, chegam as informações de uma entrada da API; a camada controller “passa” essa informação para a camada responsável pela parte visual que, por sua vez, exibe a entrada na tela.

Imagem que mostra uma representação das camadas da arquitetura limpa. Em destaque, está uma esfera na cor azul onde se lê a palavra “controller”. As demais camadas representadas são utils, dados e domínio

Se quiser entender mais sobre essa camada, recomendamos o curso sobre arquitetura MVC, de onde vem a ideia de controller.
O que são Controllers?
Os Controllers são uma das camadas da arquitetura Clean Code no Flutter, responsáveis por gerenciar a lógica de negócios da aplicação. Como já vimos, eles atuam como intermediários entre a camada de apresentação (UI) e a camada de dados garantindo que a aplicação seja mais simples de testar.

Para que servem a camada controller?
Os benefícios da camada controller são os mesmos que já vimos anteriormente:

Separação de preocupações: Ela isola a lógica de negócios da interface do usuário e dos detalhes de implementação, facilitando a manutenção e a evolução do código.
Testabilidade: a camada facilita a escrita de testes unitários e de integração, permitindo verificar se a lógica de negócios está funcionando corretamente e sem depender da interface do usuário.
Reutilização de código: Ao manter a lógica de negócios em uma camada específica, é mais fácil reutilizar essa lógica em diferentes partes da aplicação ou em futuros projetos.
Exemplos e outros casos de uso
1) Autenticação de Usuário
Imagine uma aplicação Flutter que requer autenticação de usuário. A lógica de autenticação, como verificar credenciais, gerenciar tokens de autenticação e redirecionar o usuário após o login, pode ser encapsulada em um controller de Autenticação. Isso permite que a lógica de autenticação seja reutilizada em várias partes da aplicação, como telas de login, registro e recuperação de senha.

2) Gerenciamento de Tarefas
Em um aplicativo de gerenciamento de tarefas, você pode ter um controller de tarefas que lida com a criação, exclusão e atualização de tarefas. Esse controller pode ser usado por diferentes componentes de UI, como uma lista de tarefas, um formulário de adição de tarefas e uma página de detalhes de tarefas. A lógica de negócios relacionada às tarefas é isolada e facilmente testável.

3) Integração com APIs
Esse é o caso do aplicativo Hyrule! Em alguns casos, quando uma aplicação precisa se comunicar com APIs externas, como serviços web, um controller de API pode ser usado para encapsular toda a lógica de chamadas de API, tratamento de respostas e gerenciamento de erros. Isso torna a integração com APIs mais organizada e testável, além de facilitar a troca de APIs sem afetar a camada de apresentação.

Fez sentido?

https://cursos.alura.com.br/course/flutter-praticando-arquitetura-padrao-mvc

@@08
O que aprendemos?

Nessa aula, você aprendeu a:
Entender a importância da camada controller e intermediar os dados entre a camada de dados e UI;
Implementar um controller na sua aplicação para a busca na API;
Aplicar um controller na sua aplicação para gerenciamento dos métodos de banco de dados.
Mais uma etapa concluída. Vejo você na próxima aula!

#### 18/11/2023

@05-Camada presenter

@@01
Projeto da aula anterior

Você pode revisar o seu código e acompanhar o passo a passo do desenvolvimento do nosso projeto e, se preferir, pode baixar o projeto da aula anterior.
Bons estudos!

https://github.com/alura-cursos/3117-clean_architecture/archive/refs/heads/Aula4.zip

@@02
Construindo a estrutura da home e o tema

Tudo isto que montamos foi apenas para construir a lógica da aplicação. O cliente ressaltou a importância de ter toda a regra de negócios bem definida e estruturada.
Não é relevante se a cor do botão é azul, verde, grande ou pequeno, o que realmente importa é que a pessoa consiga clicar naquele botão e executar uma ação. Essas ações podem ser adicionar uma entrada, remover uma entrada, listar a entrada, buscar algo de uma API e assim por diante.

Entretanto, para ter esse botão e realizar essa conexão, é preciso ter a base da aplicação bem construída. Com essa base pronta, conseguimos expandir nas camadas e implementar bibliotecas que vão sempre se comunicando de fora para dentro, fazendo essa ponte.

A camada Presenter
Finalmente chegamos na camada Presenter (Apresentação), onde vamos apresentar as informações para a pessoa na tela. Para isso, podemos abrir o nosso emulador.

Vamos diminuir o espaço do editor de código para alocar o emulador à sua direita. Agora, assim como em todas as camadas que montamos, vamos criar uma nova pasta chamada "screens" na raiz da pasta "lib".

A escolha de nomenclatura pode variar de acordo com a equipe com a qual você está trabalhando. Eu, Matheus, prefiro utilizar "screens", mas isso pode ser alterado, não é uma regra.

Dentro de "screens" vamos criar a página de categorias, ou categories.dart. No interior desse arquivo, vamos usar as ferramentas do próprio Visual Studio Code para gerar um Stateless Widget, digitando fls e selecionando a opção "fstless" na lista suspensa de sugestões.

Isso gerará a estrutura abaixo.

class Categories extends StatelessWidget {
const Categories({ Key? key }): super(key: key);
    
    @override
    Widget build(BuildContext context){
        return Container();
    }
}
COPIAR CÓDIGO
Aqui não há segredo, se trata da estrutura de Widget que já fizemos inúmeras vezes. Mas agora, a estrutura dele será um Safe Area, um Scaffold, e dentro desse Scaffold também vamos inserir um AppBar.

Vamos substituir o Container() por SafeArea(), que terá um child que é um Scaffold(). Este, por sua vez, terá um appBar que é um AppBar().

Dentro do AppBar(), teremos um title que é um const Text(). Ele será constante, pois não será alterado.

Dentro de const Text(), teremos a mensagem "Escolha uma categoria". Também queremos centralizar esse texto, adicionando um centerTitle: true à direita do const Text().

class Categories extends StatelessWidget {
const Categories({ Key? key }): super(key: key);
    
    @override
    Widget build(BuildContext context){
        return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                title: const Text("Escolha uma categoria"),
                centerTitle: true
                ), // AppBar
            ), // Scaffold
        ); // SafeArea
    }
}
COPIAR CÓDIGO
Salvaremos a página de categoria. Agora, em nosso main.dart, acessaremos o Widget build dentro do qual temos que substituir o Container() por Categories().

class Hyrule extends StatelessWidget {
    const Hyrule({super.key});
    
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Hyrule',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
        ), // ThemeData
        home: Categories(),
    ); // MaterialApp
}
COPIAR CÓDIGO
Ao digitar "Categories", selecionaremos a segunda sugestão da lista fornecida pelo editor: "Categories(_)", o que fará sua autoimportação conforme abaixo.

import 'package: hyrule/screens/categories.dart';
COPIAR CÓDIGO
Salvaremos o main.dart, e agora podemos rodar o nosso aplicativo no emulador clicando na opção “Run and Debug” ou pressionando “Ctrl+Shift+D”.

Enquanto o aplicativo está rodando, faremos uma observação rápida. Por padrão, o nosso ThemeData possui um tema claro. No emulador, veremos que o aplicativo está com o tema claro.

Contudo, se observarmos nosso design no Figma, notamos que ele usa um tema escuro. Existem algumas configurações que podemos modificar no ThemeData para se adaptar ao que vamos usar em nossa aplicação.

Voltando ao editor de código, trocaremos as informações de ColorScheme() e de brightness. Substituiremos a linha colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple) pela linha colorSchemeSeed: Colors.blue.

Abaixo dessa linha, adicionaremos o brightness: Brightness.dark para utilizar o tema escuro.

class Hyrule extends StatelessWidget {
    const Hyrule({super.key});
    
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Hyrule',
        theme: ThemeData(
            colorSchemeSeed: Colors.blue,
            brightness: Brightness.dark,
            useMaterial3: true,
        ), // ThemeData
        home: Categories(),
    ); // MaterialApp
}
COPIAR CÓDIGO
Salvaremos o main.dart e veremos no emulador que já estamos com o tema escuro.

Já a página principal de categorias. A seguir, preencheremos as informações.

@@03
Para saber mais: aprofundando a camada presenter

Se você perceber, fomos construindo o aplicativo Hyrule em pequenas etapas, subindo um degrau por vez. Em cada aula, você aprendeu uma camada diferente para deixar o projeto bem organizado e facilitar o trabalho com ele.
Fomos construindo blocos que, finalmente, serão combinados para que o aplicativo seja funcional e possa ser utilizado pelas pessoas!

Assim, finalmente chegamos na última camada: a presenter (apresentação). Como o título indica, essa camada é responsável por apresentar as informações na tela, permitindo que o usuário veja os dados das entradas e interaja com elas, salvando as entradas em favoritos.

Imagem que representa as camadas da arquitetura limpa ou clean code. Há várias esferas que envolvem uma a outra: domínio, dados, utils e controller. Em destaque, a esfera mais exterior está na cor vermelha e dentro dela pode-se ler a palavra “presenter”

Os benefícios de se trabalhar com uma camada presenter são inúmeros, como já vimos nas aulas anteriores com domínio, dados, utils etc.

Fez sentido?

https://caelum-online-public.s3.amazonaws.com/3117-flutte-+arquitetura-clean-code/imagem7.jpg

@@04
Componente de categoria

Para preencher a tela de categorias com informações, precisamos criar os componentes de categorias. Olhando no Figma, esses componentes são InkWells com uma imagem central e um texto na parte inferior.
Criando o Componente de Categoria
Vamos criar esse componente. Como faz parte da identidade visual, é indicado inserir os componentes dentro do mesmo diretório "screens", em uma subpasta chamada "components". Isso ajuda a distinguir a tela dos componentes da tela.

Dentro de "components", criaremos um arquivo chamado category.dart. Ele terá a estrutura padrão de Stateless Widget, importando do Material.

import 'package:flutter/material.dart';

class Category extends StatelessWidget {
const Category({ Key? key }): super(key: key);

    @override
    Widget build(BuildContext context){
        return Container();
    }
}
COPIAR CÓDIGO
Precisamos receber o valor da categoria para preencher a informação dentro do cartão. Na linha const Category(), à direita de key, adicionaremos um required this.category, que será a string que receberemos mais tarde.

Abaixo dessa linha, inicializaremos ela como final String category.

No interior de Widget build(), vez de retornar um Container(), retornaremos uma Column(). Esta precisa de um children, que será uma lista de Widgets (<Widget>[]). Entre os colchetes deste Widget, teremos o InkWell e o texto.

Vamos começar com um InkWell(). Entre seus parênteses, ele precisa de uma função OnTap: (){}, que será uma função anônima que, por enquanto, não fará nada.

O InkWell também terá um child que será um Ink(). Entre os parênteses desse Ink() haverá um child que será um Center(). Este, por sua vez, terá um child, que é uma Image. Como estamos obtendo as imagens do nosso dispositivo e elas estão na pasta "assets", usaremos o Image.asset().

Entre os parênteses Image.asset(), adicionaremos seu nome, que é o caminho de origem das imagens: "assets/images/" junto ao nome da categoria que estamos buscando — neste caso, podemos usar o $category.png, onde category é a variável em que estamos trabalhando e png é o padrão das imagens que estamos manipulando.

Vamos indentar o arquivo. Após construir o InkWell, abaixo dos parênteses que fecham seu bloco, teremos o Text(category) que corresponde ao texto da categoria.

import 'package:flutter/material.dart';

class Category extends StatelessWidget {
const Category({ Key? key }): super(key: key);

    @override
    Widget build(BuildContext context){
        return Column(children: <Widget>[
            Inkwell(
                onTap: () {},
                child: Ink(
                    child: Center(
                        child: Image.asset("assets/images/$category.png"),
                    ), // Center
                ), // Ink
            ), // Inkwell
            Text(category),
        ],); // <Widget>[] // Column
    }
}
COPIAR CÓDIGO
Há dois detalhes muito importantes a salientar: assets/images/ é um caminho e, assim como fizemos com a URL da API, podemos separar esse texto em uma constante.

Acessando o explorador, criaremos um novo arquivo na pasta utils/consts. Ele será chamado categories.dart. Agora temos Categories em "screens" e categories, que são constantes. Precisamos tomar cuidado para não confundir um com o outro mais tarde.

No interior desse novo arquivo, criaremos uma constante, String imagePath, que será igual àquele valor do caminho de assets: assets/images/.

const String imagePath = "assets/images/";
COPIAR CÓDIGO
Vamos salvar o arquivo categories.dart. Em seguida, acessaremos o arquivo category.dart do caminho de pastas "screens > components".

Em seu interior, substituiremos o trecho assets/images/ por $imagePath e a importação do caminho de categories será feita automaticamente.

import 'package:flutter/material.dart';

class Category extends StatelessWidget {
const Category({ Key? key }): super(key: key);

    @override
    Widget build(BuildContext context){
        return Column(children: <Widget>[
            Inkwell(
                onTap: () {},
                child: Ink(
                    child: Center(
                        child: Image.asset("$imagePath$category.png"),
                    ), // Center
                ), // Ink
            ), // Inkwell
            Text(category),
        ],); // <Widget>[] // Column
    }
}
COPIAR CÓDIGO
Isso deixa o código mais limpo, porque agora temos o imagePath. Se quisermos alterar o caminho, por exemplo, para usar outra pasta, temos acesso a ele.

Outro detalhe muito importante é que, ao olharmos o Figma, o nome da categoria tem a primeira letra maiúscula, mas se olharmos o resultado da API, category é tudo minúsculo.

{
    "data": [
        {
            "category": "monsters",]
            "common_locations": [
                "Gerudo Desert"
            ]
            "description": "This massive monster swims beneath the desert's sand. It spends most of its time submerged, but if it senses sound, it will breach the surface to feast on whatever it can grab. Running around carelessly can be dangerous if you suspect there may be one in the area."
            "dlc": false,
            "drops": [
                "molduga fin",
                "molduga guts"
            ],
            "id": 151,
            "image": "https://botw-
compendium.herokuapp.com/api/v3/compendium/entry/molduga/image",
            // Retorno omitido
        }
    ]
}
COPIAR CÓDIGO
No exemplo acima, o nosso objeto de resposta possui "monsters" escrito totalmente em minúsculas.

Para sabermos quando usar cada formato e relacionar um valor com outro, podemos criar um dicionário.

Criando um Dicionário
Voltando ao editor de código, dentro do nosso arquivo de constantes categories.dart, podemos criar na linha 3 um dicionário const Map que terá a chave e o valor do tipo String. Podemos chamá-lo de categories, que são as listas de categorias, as nossas chaves.

const String imagePath = "assets/images/";

const Map<String, String> categories {

}
COPIAR CÓDIGO
Nele, devolveremos um objeto, e esse objeto terá como chave o que está escrito na API, e a resposta será o que está escrito no Figma.

Precisamos ter cuidado, pois algumas palavras estão no plural e outras no singular. Usaremos como referência os nomes das imagens, pois elas estão relacionadas à API (isso já foi considerado anteriormente). Ao invés de alternar constantemente para a nossa página, verificaremos as imagens.

Começaremos com creatures. A chave será creatures, toda em minúsculo, e o valor será Creatures, com a primeira letra maiúscula. Ambos estarão entre aspas simples.

Faremos o mesmo com equipment (termo no singular), materials, monsters e, finalmente, treasure (que por algum motivo, também está no singular).

const String imagePath = "assets/images/";

const Map<String, String> categories {
    'creatures': 'Creatures',
    'equipment': 'Equipment',
    'materials': 'Materials',
    'monsters': 'Monsters',
    'treasure': 'Treasure',
}
COPIAR CÓDIGO
Perfeito. Temos nosso dicionário pronto. Agora, quando formos buscar a categoria e preenchê-la com o nome da categoria, podemos simplesmente chamar nosso mapa, que nomeamos de categories. Vamos adicioná-lo entre os parênteses de Text, no arquivo category.dart da pasta "components".

import 'package:flutter/material.dart';

class Category extends StatelessWidget {
const Category({ Key? key }): super(key: key);

    @override
    Widget build(BuildContext context){
        return Column(children: <Widget>[
            Inkwell(
            
                // Código omitido
                
            ), // Inkwell
            Text(categories),
        ],); // <Widget>[] // Column
    }
}
COPIAR CÓDIGO
Precisamos ter cuidado para importar esse categories do lugar certo. Na lista de sugestões do editor, devemos selecionar a opção "categories" do tipo Map<String, String> (um mapa de string com string).

import 'package:hyrule/utils/consts/categories.dart';
COPIAR CÓDIGO
Vamos adicionar a esse categories um par de colchetes. Entre elas, estamos solicitando exatamente a chave, que é de category.

Veremos um erro sendo acusado, pois ele não sabe se haverá algum valor. Para resolver isso, podemos forçar um Required adicionando um ponto de exclamação à direita dos colchetes, pois sabemos que ele vai existir dentro do nosso mapa, já que se trata do que estamos enviando e trabalhando em cima.

import 'package:flutter/material.dart';
import 'package:hyrule/utils/consts/categories.dart';

class Category extends StatelessWidget {
const Category({ Key? key }): super(key: key);

    @override
    Widget build(BuildContext context){
        return Column(children: <Widget>[
            Inkwell(
            
                // Código omitido
                
            ), // Inkwell
            Text(categories[category]!),
        ],); // <Widget>[] // Column
    }
}
COPIAR CÓDIGO
Com isso, temos nossa chave, nosso valor, nosso mapa e, portanto, a categoria está completa. O próximo passo será preencher a categoria.

@@05
Mostrando categorias e a página de resultados

Para preencher a tela de categorias utilizando o componente de categorias, podemos utilizar uma GridView. Vamos acessar o arquivo categories.dart dentro da página de categorias.
Adicionando a GridView
Em seu interior, abaixo do bloco de chaves da AppBar(), incluiremos a propriedade body que será um GridView(). Entre seus parênteses, ele precisa de um gridDelegate, que é um SliverGridDelegateWithFixedCrossAxisCount(). Este, por sua vez, precisa ter um crossAxisCount, que terá o valor 2.

À direita do crossAxisCount, teremos um crossAxisSpacing com o valor de 16 pixels e um mainAxisSpacing que também possuirá o valor 16 pixels.

A seguir, indentaremos o código rapidamente. Para indentar no VS Code, podemos utilizar o atalho "Alt+Shift+F".

O GridDelegate precisará de um children. Vamos adicioná-lo abaixo dos parênteses de SliverGridDelegateWithFixedCrossAxisCount. Esse children precisa ser uma lista. Portanto, podemos pegar o nosso dicionário, e a partir dele, iterar e devolver uma categoria no formato correto.

Para isso, deletaremos a lista [] adicionada automaticamente, saltaremos uma linha e chamaremos categories.keys.map((e) => ). Nesse comando, queremos obter as chaves e, a partir delas, faremos um mapa. Para cada elemento e dentro desse mapa — ou seja, para cada chave —, queremos obter e retornar um Category().

class Categories extends StatelessWidget {
const Categories({ Key? key }): super(key: key);
    
    @override
    Widget build(BuildContext context){
        return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                    title: const Text("Escolha uma categoria"),
                    centerTitle: true
                ), // AppBar
                body: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16), // SliverGridDelegateWithFixedCrossAxisCount
                        children:
                            categories.keys.map((e) => Category(category: category))
                ), // GridView
            ), // Scaffold
        ); // SafeArea
    }
}
COPIAR CÓDIGO
Devemos nos assegurar de que estamos referindo o Category correto. Na sugestão de importação do editor, devemos selecionar aquele que é um required String category. A autoimportação correta está abaixo e deve ter sido adicionada à seção de importações do arquivo.

import 'package:hyrule/screens/components/category.dart';
COPIAR CÓDIGO
Entre os parênteses de Category(), ao invés de devolver uma category: category, devolveremos um category: e, elemento com o qual estamos trabalhando, junto a um .toList(), pois temos que retornar uma lista.

categories.keys.map((e) => Category(category: e))
COPIAR CÓDIGO
Vamos salvar o arquivo e verificar o emulador. Veremos que a seção "Creatures" (criaturas) já apareceu, junto a seu ícone com o perfil da cabeça de um cavalo, comprovando que as imagens estão carregando corretamente. O nome da criatura também está aparecendo.

Neste momento, não nos preocuparemos com a estilização. Vamos apenas fazer a aplicação funcionar primeiro.

Finalizamos a página de categoria. Agora, podemos criar a página de resultados porque, quando clicarmos em uma categoria, ela precisa direcionar para algum lugar.

Criando a Página de Resultados
Para isso, podemos criar uma nova página de telas chamada result.dart, dentro da pasta "screens".

No interior desse arquivo, a página de resultados terá a estrutura padrão de um StatelessWidget, o qual devemos importar do nosso Material.

import 'package:flutter/material.dart';

class Results extends StatelessWidget {
const Results({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Container();
    }
}
COPIAR CÓDIGO
Precisamos receber uma categoria dentro desses resultados, pois será a partir dela que faremos a busca para a API, passando para dentro de um FutureBuilder que, posteriormente, fará a requisição a partir da categoria.

Para isso, à direita da key de const Results()vamos receber required this.category. E ela será uma String, portanto, abaixo da linha atual, adicionaremos um final String category.

Conforme essa estrutura básica, vamos substituir o retorno do Container() por um SafeArea(), e entre os parênteses deste, adicionar um children: Scaffold().

Dentro de Scaffold(), temos o appBar, que é um AppBar(). Dentro do AppBar, temos um title que é um Text().

Esse Text() ficará no topo da tela, portanto, pode usar o nosso dicionário dentro de categories. À direita de categories, informaremos uma category entre colchetes.

Ele acusará um erro porque não temos certeza se essa propriedade realmente existe. Confirmaremos a existência dela com o Null Safety, adicionando uma exclamação (!) à direita de [category].

class Results extends StatelessWidget {
const Results({ Key? key, required this.category }) : super(key: key);
  final String category;
    
    @override
    Widget build(BuildContext context) {
        return SafeArea(child: Scaffold(appBar: AppBar(title: Text(categories[category]!),),),);
    }
}
COPIAR CÓDIGO
Devemos nos assegurar de que estamos referindo o categories correto. Na sugestão de importação do editor, devemos selecionar aquele que possui chave e valor (ou seja, Map<String, String>. A autoimportação correta está abaixo e deve ter sido adicionada à seção de importações do arquivo.

import 'package:hyrule/utils/consts/categories.dart';
COPIAR CÓDIGO
Vamos indentar automaticamente o código desse arquivo, cujo resultado veremos abaixo.

class Results extends StatelessWidget {
const Results({ Key? key, required this.category }) : super(key: key);
  final String category;
    
    @override
    Widget build(BuildContext context) {
        return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                    title: Text(categories[category]!),
            ), // AppBar
        ), // Scaffold
    ); // SafeArea
}
COPIAR CÓDIGO
Posteriormente montaremos o nosso Body. Salvaremos o arquivo atual e com isso, quando clicarmos em uma categoria, ela deve direcionar para a página de resultado.

Acessando o arquivo category.dart do nosso componente de Category, faremos um Navigator.push(context, route) entre as chaves do onTap.

O context continuará assim. Já a route será um MaterialPageRoute(). Entre os parênteses, este receberá a função anônima builder: (context), a partir do qual adicionaremos uma seta => e um Results().

Dentro de Results(), uma categoria é solicitada. A categoria que vamos passar é exatamente a category: category. Para isso, vamos digitar "category:" e selecionar a opção "category" na lista de sugestões do editor.

import 'package:flutter/material.dart';

class Category extends StatelessWidget {
const Category({ Key? key }): super(key: key);

    @override
    Widget build(BuildContext context){
        return Column(children: <Widget>[
            Inkwell(
                onTap: () {
                        Navigator.push(context, MaterialPageRoute (builder: (context) => Results(category: category)));
                },
                child: Ink(
                    child: Center(
                        child: Image.asset("$imagePath$category.png"),
                    ), // Center
                ), // Ink
            ), // Inkwell
            Text(categories[category]!),
        ],); // <Widget>[] // Column
    }
}
COPIAR CÓDIGO
Salvaremos todo o código e veremos se está funcionando. Se acessarmos a aplicação e clicarmos em "Creatures", ele navegará para a página "Creatures". No topo desta, aparece o nome da categoria. O mesmo ocorre em outras categorias.

A seguir, faremos a busca. Assim que clicarmos, a busca será carregada.

@@06
Construindo o cartão de entrada

Antes de começarmos com o nosso FutureBuilder, precisamos de uma maneira de apresentar cada uma das entradas. Teremos um cartão com uma imagem, título, descrição e localizações.
Criando os Cartões
Para isso, precisaremos do componente adicional EntryCard. Este componente ficará dentro da pasta "components" e seu arquivo será chamado de entry_card.dart. Ele também terá a estrutura básica de um StatelessWidget do Flutter.

import 'package:flutter/material.dart';

class EntryCard extends StatelessWidget {
const EntryCard({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Container();
    }
}
COPIAR CÓDIGO
No entanto, uma vez que o FutureBuilder retornará uma lista de Entries (entradas), o EntryCard receberá basicamente uma Entry (entrada). Portanto, à direita da key, vamos adicionar o required this.entry, que será um final Entry entry, adicionado na linha de baixo.

Por fim, vamos importar o entry da pasta "models".

import 'package:flutter/material.dart';
import 'package: hyrule/domain/models/entry.dart';

class EntryCard extends StatelessWidget {
const EntryCard({ Key? key, required this.entry }) : super(key: key);
    final Entry entry;

    @override
    Widget build(BuildContext context) {
        return Container();
    }
}
COPIAR CÓDIGO
A partir dessa entrada, podemos preencher as informações do cartão.

Qual será a estrutura desse cartão? Ele será um Card, portanto vamos substituir o return Container() do build por um return Card().

Entre os parênteses dele haverá um child. A partir desse child, teremos a primeira sessão, que será dividida em duas partes:

A parte de cima, onde nós temos a imagem, título e descrição;
A parte de baixo, onde as localizações serão apresentadas.
Podemos adicionar ao child um Column(), que terá entre seus parênteses um children, que será uma lista de Widget (<Widget>[]).

O primeiro item entre os colchetes será um Row(), porque na parte de cima do cartão temos a imagem à esquerda. Já o título e a descrição estão à direita e serão um Column.

Começando pelo nosso Row(), ele receberá entre parênteses um children com uma lista de Widgets (<Widget>[]). Dentro do Row() — ou seja, entre os colchetes da lista —, o primeiro item será a imagem por meio de um Image.network(), porque vamos buscar a imagem da internet. No lugar de src, usaremos entry.image, que é a URL da imagem.

Como elemento secundário, abaixo do Image.network() teremos outro Column() com um children e uma lista de Widgets. Entre os colchetes da lista teremos dois Text()s: o primeiro receberá entry.name, e o segundo texto receberá entry.description.

class EntryCard extends StatelessWidget {
const EntryCard({ Key? key, required this.entry }) : super(key: key);
    final Entry entry;

    @override
    Widget build(BuildContext context) {
        return Card(
            child: Column(
                children: <Widget>[
                    Row(
                        children: <Widget>[
                            Image.network(entry.image),
                            Column(children: <Widget>[
                                Text(entry.name),
                                Text(entry.description),
                            ],) // <Widget>[] // Column
                        ], // <Widget>[]
                    ), // Row
                ], // <Widget>[]
            ), // Column
        ); // Card
    }
}
COPIAR CÓDIGO
Abaixo dos parênteses da Row(), teremos um Wrap(). Ele possuirá como filho (children) uma lista de Chips. Os Chips são as tags que serão apresentadas posteriormente com a localização e que possuem estilização própria, a qual adicionaremos posteriormente.

Ou seja, o Wrap() precisaria de um children, que será uma lista de Widget (<Widget>[]). No entanto, em vez de uma lista comum, ela precisa de uma lista de filhos.

Nós já temos essa lista. Se adicionarmos o entry e um ponto nessa children, veremos na lista de sugestões do editor que temos a função commonLocationsConverter().

Ela é uma lista de Strings que quando é salva no banco de dados, precisa ser uma String única. Com isso, precisamos converter de uma String para uma lista de Strings.

Essa função nos retorna uma lista. Podemos iterar sobre essa lista, e adicionar um Chip baseado em cada um dos valores dessa lista de Strings.

Então, após adicionar nossa função entry.commonLocationsConverter(), adicionaremos um .map((e) => ), pois queremos o mapeamento dela. Para cada elemento, desejamos retornar um Chip(). Entre seus parênteses, o Chip() precisa de um label que será um Text() com o valor do elemento e entre seus parênteses.

Após o Chip(), temos que enviar um .toList(). Ou seja, vamos adicionar esse método à direita dos parênteses que finalizam o map().

Vamos indentar o código para enxergar melhor o que está acontecendo.

class EntryCard extends StatelessWidget {
const EntryCard({ Key? key, required this.entry }) : super(key: key);
    final Entry entry;

    @override
    Widget build(BuildContext context) {
        return Card(
            child: Column(
                children: <Widget>[
                    Row(
                        children: <Widget>[
                            Image.network(entry.image),
                            Column(children: <Widget>[
                                Text(entry.name),
                                Text(entry.description),
                            ],) // <Widget>[] // Column
                        ], // <Widget>[]
                    ), // Row
                    Wrap(
                        children: entry.commonLocationsConverter().map(
                            (e) => Chip(
                                label: Text(e),
                            ), // Chip
                        ).toList(),
                    ), // Wrap
                ], // <Widget>[]
            ), // Column
        ); // Card
    }
}
COPIAR CÓDIGO
Com isso, temos o nosso Entry Card. Com ele, podemos montar o Future Builder. E o resultado do Future Builder retornará para nós o Entry Card, que receberá uma entrada.

Vamos acrescentar um detalhe final: essa entrada deve ser clicável, portanto, devemos envolver o nosso Row() (lugar em que poderemos clicar) com um InkWell().

Para isso, vamos posicionar o cursor na linha inicial da Row(), pressionar "Ctrl+." e selecionar a opção "Wrap with widget" para envolvê-lo com um widget(). Ele criará transformará o Row() em seu child.

Vamos renomear esse widget() para InkWell().

Vamos pressionar "Enter" e abrir espaço da primeira linha dentro dos parênteses desse InkWell() para adicionar um onTap() {}. Este irá navegar para uma outra lista de detalhes e serve apenas para preparar a função onTap, já que temos essa opção.

O child, na verdade, não pode ser um Row() e sim um Ink() para ter o efeito de InkWell(). Portanto, selecionaremos novamente o Row() com o cursor para envolvê-lo em mais um widget(), que renomearemos como Ink().

class EntryCard extends StatelessWidget {
const EntryCard({ Key? key, required this.entry }) : super(key: key);
    final Entry entry;

    @override
    Widget build(BuildContext context) {
        return Card(
            child: Column(
                children: <Widget>[
                    Inkwell(
                        onTap() {},
                        child: Ink(
                            child: Row(
                                children: <Widget>[
                                    Image.network(entry.image),
                                    Column(children: <Widget>[
                                        Text(entry.name),
                                        Text(entry.description),
                                    ],) // <Widget>[] // Column
                                ], // <Widget>[]
                            ), // Row
                        ), //Ink
                    ), // Inkwell
                    Wrap(
                        children: entry.commonLocationsConverter().map(
                            (e) => Chip(
                                label: Text(e),
                            ), // Chip
                        ).toList(),
                    ), // Wrap
                ], // <Widget>[]
            ), // Column
        ); // Card
    }
}
COPIAR CÓDIGO
Com isso, finalmente concluímos o Entry Card.

@@07
Fazendo a conexão com a API

Agora, podemos exibir o resultado da API no componente Results por meio de um FutureBuilder.
Conectando à API
Dentro do arquivo results.dart, necessitamos receber as informações da API para implementar o FutureBuilder. E para estabelecer a conexão com a API, precisamos utilizar o Controller.

Abaixo da final String category, podemos criar uma instância final ApiController chamada apiController. Ela receberá uma instância ApiController() porque precisamos chamar a função dentro dela, a qual nos retornará uma Future.

No entanto, agora temos um problema — nosso resultado não é mais constante. Podemos deletar a palavra-chave const do construtor const Results().

Abaixo dos parênteses da AppBar(), precisamos declarar e exibir um body que será um FutureBuilder(). Antes de inserir o builder como recomendado, vamos deletar a sugestão do editor e declarar primeiro a future, pois ela virá do ApiController.

Portanto, vamos chamar apicontroller.getEntriesByCategory(). Entre seus parênteses, receberemos a category nesta página, como propriedade.

Abaixo da future, precisamos montar nosso builder. Ao escrever "builder:", ele já nos fornece a opção { context, snapshot } que abre um bloco de chaves vazio.

class Results extends StatelessWidget {
Results({ Key? key, required this.category }) : super(key: key);
  final String category;
    
    final ApiController apiController = ApiController();
    
    @override
    Widget build(BuildContext context) {
        return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                    title: Text(categories[category]!),
                ), // AppBar
                body: FutureBuilder(
                    future: apiController.getEntriesByCategory(category: category),
                    builder: (context, snapshot) {}
                ), // FutureBuilder
            ), // Scaffold
        ); // SafeArea
    }
}
COPIAR CÓDIGO
Antes de começar a utilizar o snapshot e verificar o ConnectionState, queremos definir um retorno padrão, para evitar que nosso Builder seja interrompido. Para isso, entre as chaves do builder, o retorno padrão será um Container() vazio.

Acima do return, precisamos verificar um comando switch ecase. Portanto, escreveremos "switch" e selecionaremos "switch statement" para implementar essa estrutura.

A expressão que queremos validar é o que provém deste snapshot.connectionState, portanto, vamos adicioná-la entre os parênteses do switch().

Nosso primeiro ConnectionState será o .active, portanto vamos apagar o value do case e adicioná-lo em seu lugar. Esse active não terá nada, mesmo ativo. Então, podemos manter somente o break e pular essa parte.

O próximo caso que temos é o ConnectionState.none, portanto, vamos adicionar um case com ele abaixo do primeiro. Não há nada para ele executar, então, adicionaremos apenas o break.

class Results extends StatelessWidget {
Results({ Key? key, required this.category }) : super(key: key);
  final String category;
    
    final ApiController apiController = ApiController();
    
    @override
    Widget build(BuildContext context) {
        return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                    title: Text(categories[category]!),
                ), // AppBar
                body: FutureBuilder(
                    future: apiController.getEntriesByCategory(category: category),
                    builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                            case ConnectionState.active:
                                break;
                            case ConnectionState.none:
                                break;
                            default:
                        }
                        return Container();
                    },
                ), // FutureBuilder
            ), // Scaffold
        ); // SafeArea
    }
}
COPIAR CÓDIGO
O próximo case será o ConnectionState.done, com o qual realmente exibiremos algo na tela. Porém, antes de exibir algo, precisamos validar se o snapshot realmente virá com alguma informação. Portanto, faremos uma declaração if dentro desse case, verificando se o snapshot.hasData, ou seja, se snapshot possui alguma informação.

Se ele tiver, que é o que esperamos, ele retornará para nós um ListView.builder(). Entre seus parênteses, o itemBuilder precisa receber dois valores: um context e um index, ambos entre novos parênteses.

Utilizaremos esse index para iterar sobre a lista de dados que recebemos da API. Como se trata de uma lista de entradas, precisamos iterar e depois percorrê-la. Por isso, passamos o índice também ao itemBuilder.

À direita do (context, index), adicionaremos uma seta => e retornaremos um EntryCard(). Entre seus parênteses, adicionaremos a entrada que iremos receber: o entry: snapshot.data![] na posição do index. Ele nos retornará esse ItemBuilder.

O data garante que receberemos algo, porque já fizemos a validação com o hasData.

O nosso último caso será o ConnectionState.waiting, onde "waiting" corresponde ao momento de carregamento. Quando ele estiver carregando, seu retorno será a const Center(child: CircularProgressIndicator()), informando que está carregando.

class Results extends StatelessWidget {
Results({ Key? key, required this.category }) : super(key: key);
  final String category;
    
    final ApiController apiController = ApiController();
    
    @override
    Widget build(BuildContext context) {
        return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                    title: Text(categories[category]!),
                ), // AppBar
                body: FutureBuilder(
                    future: apiController.getEntriesByCategory(category: category),
                    builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                            case ConnectionState.active:
                                break;
                            case ConnectionState.none:
                                break;
                            case ConnectionState.done:
                                if(snapshot.hasData) {
                                    return ListView.builder(itemBuilder: (context, index) => EntryCard (entry: snapshot.data! [index]));
                                }
                            case ConnectionState.waiting:
                                return const Center(child: CircularProgressIndicator(),);
                            default:
                        }
                        return Container();
                    },
                ), // FutureBuilder
            ), // Scaffold
        ); // SafeArea
    }
}
COPIAR CÓDIGO
Salvaremos os resultados do código. Vamos ver se está funcionando agora. No emulado, clicaremos em "Creatures". Com isso, a página "Creatures" será exibida, com as imagens das criaturas. Apesar dos textos se mostrarem fora de formato, vimos que a aplicação está conseguindo carregar as informações.

Faremos um pequeno ajuste para podermos visualizar as imagens e o texto. Acessando o arquivo entry_card.dart veremos a linha Column(children: <Widget>[ dentro da Row().

Vamos quebrar a linha entre Column( e children: <Widget>[, adicionando uma linha vazia entre ambas. Nessa linha vazia, criaremos um crossAxisAlignment: CrossAxisAlignment.start.

class EntryCard extends StatelessWidget {
const EntryCard({ Key? key, required this.entry }) : super(key: key);
    final Entry entry;

    @override
    Widget build(BuildContext context) {
        return Card(
            child: Column(
                children: <Widget>[
                    Inkwell(
                        onTap() {},
                        child: Ink(
                            child: Row(
                                children: <Widget>[
                                                                    Image.network(entry.image),
                                    Column(
                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                            children: <Widget>[
                                        Text(entry.name),
                                        Text(entry.description),
                                    ],) // <Widget>[] // Column
                                ], // <Widget>[]
                            ), // Row
                        ), //Ink
                    ), // Inkwell
                    Wrap(
                        children: entry.commonLocationsConverter().map(
                            (e) => Chip(
                                label: Text(e),
                            ), // Chip
                        ).toList(),
                    ), // Wrap
                ], // <Widget>[]
            ), // Column
        ); // Card
    }
}
COPIAR CÓDIGO
Com isso, conseguimos mais ou menos ver o título. Temos, portanto, o título e a descrição aparecendo. Eles estão meio desconfigurados por conta do tamanho, mas estamos conseguindo capturar as informações.

Reforçando que não precisamos nos preocupar com a cor do botão ainda. Nosso foco é conseguir exibir as informações. Se conseguimos exibir a imagem, as localizações, o título e a descrição cumprimos nossa tarefa.

A etapa seguinte é clicar nesse cartão e realizar o redirecionamento para outro lugar. Trataremos disso na próxima aula.

@@08
Entendendo a conexão entre ApiController e página de resultados

Você foi contratado(a) para trabalhar na Meteora, uma loja de roupas que está desenvolvendo um aplicativo de e-commerce usando Flutter. Sua gerente, Roberta, pediu que você conectasse o ApiController com a página de resultados, para que quando um(a) usuário(a) selecionasse uma categoria de produto, o aplicativo fosse capaz de retornar as principais entradas dessa categoria.
A Roberta encaminhou a você o código de base abaixo para trabalhar:

class Results extends StatelessWidget {
Results({ Key? key, required this.category }) : super(key: key);
  final String category;

  final ApiController apiController = ApiController();

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(categories[category]!),
        ),
        body: FutureBuilder(
          future: apiController.getEntriesByCategory(category: category),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
                break;

              case ConnectionState.none:
                break;

              case ConnectionState.done:
                if(snapshot.hasData) {
                  return ListView.builder(itemBuilder: (context, index) => EntryCard(entry: snapshot.data![index]));
                }

              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator(),);
              default:
            }
            return Container();
          },
        ),
      ),
    );
  }
}
COPIAR CÓDIGO
A partir da sua compreensão deste código, qual é o principal papel da classe ApiController neste contexto?


Alternativa correta
É uma classe que serve para criar os cards de cada produto.
 
Alternativa correta
É a classe que permite selecionar uma categoria de produtos.
 
Alternativa correta
É responsável por conectar-se com a API e trazer todas as categorias de produtos.
 
Alternativa correta
É responsável por trazer as entradas da categoria selecionada de produtos a partir da conexão com uma API.
 
A classe ApiController é usada no código para trazer as entradas da categoria selecionada de produtos da API.

@@09
Faça como eu fiz: conectando as camadas

Hora da prática!
Para mostrar as informações da API siga os passos:

Para criar a camada de presenter, crie a pasta screens e dentro dela a pasta components;
Altere o ThemeData para mostrar o tema escuro e altere o esquema de cores para azul;
Crie as telas de categorias e resultados com a estrutura básica de tela;
Crie os componentes de categoria e cartão de entrada;
Para relacionar os dados da API com a maneira que a informação precisa ser mostrada em tela, crie um dicionário dentro de utils/consts;
Preencha a tela de categoria com as informações do dicionário e os componentes;
Na tela de resultados utilize o ApiController para fazer a conexão com a API;
Mostre os resultados com o componente de cartão de entrada.
Vamos lá?

Você pode conferir o gitHub ou ver o passo a passo para mostrar os resultados da API:
Alterando o ThemeData:
Defina o tema do aplicativo com a propriedade ThemeData(), passando colorSchemeSeed como Colors.blue e brightness como Brightness.dark.
Defina o valor de useMaterial3 como true.
Defina a propriedade home como Categories()
Para o dicionário:
Crie o arquivo categories.dartdentro de consts;
Crie uma constante imagePath que contém a parte inicial do caminho para as imagens;
Crie um Map<String, String> categories que transforma a chave de uma entrada de lowercase para um valor em capitalize;
Criando a página de categorias:
Crie uma pasta chamada screens dentro de lib;
Crie um arquivo chamado categories.dart;
Faça a estrutura básica de SafeArea e Scaffold com AppBar;
No corpo crie um GridView com um crossAxisCount 2 e espaçamentos horizontais e verticais de 16px;
Como filho do GridView, itere sobre o dicionário devolvendo um componente de categoria passando como valor uma chave do dicionário;
Criando o componente de categoria:
Dentro de screens crie uma pasta chamada components;
Crie um stateless widget dentro de components que recebe como parâmetro uma String categoria;
No corpo do widget coloque um Column com um InkWell que na função onTap redireciona o usuário para a página de resultados;
O filho de InkWell é um Center com uma imagem que tem como caminho a constante imagePath e a categoria concatenada (não se esqueça de colocar .png no final do caminho).
Como irmão de InkWell, coloque um Text buscando pelo dicionário a chave que é a String que recebemos no widget;
Criando a página de resultados:
Crie um arquivo chamado results.dart dentro de screens;
Faça a estrutura básica de SafeArea e Scaffold com AppBar recebendo como parâmetro uma String category;
O AppBar recebe com title a categoria do dicionário, passando como chave a categoria recebida no widget;
Crie uma instância de ApiController;
No body do Scaffold, crie um FutureBuilder que recebe como Future a função getEntriesByCategory do ApiController;
Faça a validação padrão do ConnectionState de snapshot;
Retorne um ListView.builder que monta um EntryCard que recebe como parâmetro o snapshot.data na posição de index;
Criando o cartão de entrada:
Crie um arquivo chamado entry_card.dart dentro de components;
Crie um stateless widget que recebe como parâmetro um Entry entry;
Utilize o componente do Flutter Card;
Dentro de Card coloque um Column;
O primeiro item de Column deve ser um InkWell com a função onTap vazia;
O filho deve ser um Ink que tem como filho um Row;
O primeiro filho de Row é uma imagem que tem como caminho entry.image;
O segundo filho de Row é um Column que vai ter dois Texts:
O primeiro é o nome da entrada;
O segundo é a descrição da entrada;
O segundo filho de Column é um Wrap;
Dentro de Wrap, na propriedade children, devolva uma lista de commonLocations utilizando a função commonLocationsConverter();
A lista deve ser iterada devolvendo um Chip com a propriedade label sendo um Text com o valor iterado.
Pronto, temos as estruturas das páginas de categorias e resultados completadas!

https://github.com/alura-cursos/3117-clean_architecture/archive/refs/heads/Aula5.zip

@@10
O que aprendemos?

Nessa aula, você aprendeu como:
Adicionar mais informações dentro da camada de utils;
Importância da funcionalidade antes da estilização de componentes e páginas;
Integrar as telas com a API utilizando a camada de controller.
Parabéns por ter concluído mais uma aula. Bons estudos!