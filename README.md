## App de Monitoramento de Pacientes

Este projeto é um APP para monitoramento de pacientes desenvolvido em Flutter, criado para técnicos de enfermagem em Home Care. 
O sistema permite o cadastro de pacientes e o monitoramento de seus sinais vitais e procedimentos realizados durante cada visita.

Funcionalidades Principais

Cadastro de Pacientes: Adicione novos pacientes, incluindo dados como nome, idade, e informações de contato.
Registro de Sinais Vitais: Permite registrar os principais sinais vitais dos pacientes, como:
  Pressão Arterial
  Frequência Cardíaca
  Temperatura
  Saturação de Oxigênio
  Glicemia (HGT)
Registro de Procedimentos: Registre procedimentos realizados com os pacientes, como administração de medicamentos, realização de curativos, e outras observações importantes.
Listagem de Pacientes: Exibe uma lista de todos os pacientes cadastrados, permitindo fácil acesso aos detalhes de cada um.
Navegação Intuitiva: Utilize botões para acessar rapidamente as telas de registro de procedimentos e sinais vitais de cada paciente.

## Tecnologias Utilizadas

Flutter: Framework para desenvolvimento multiplataforma (iOS, Android, Web, Desktop) usando Dart.
Provider: Para gerenciamento de estado global e compartilhamento de dados entre os widgets.
SQLite: Para persistência de dados local, utilizando o pacote sqflite.
Form Builder: Facilita a criação e validação de formulários utilizando o pacote flutter_form_builder.

## Estrutura do Projeto

lib/
├── models/
│   ├── paciente.dart                # Modelo de Paciente
│   ├── sinais_vitais.dart           # Modelo de Sinais Vitais
│   ├── procedimento.dart            # Modelo de Procedimento
│
├── providers/
│   ├── paciente_provider.dart        # Gerencia o estado dos Pacientes
│   ├── sinais_vitais_provider.dart   # Gerencia o estado dos Sinais Vitais
│   ├── procedimento_provider.dart    # Gerencia o estado dos Procedimentos
│
├── screens/
│   ├── home_screen.dart              # Tela inicial de listagem dos Pacientes
│   ├── paciente_list_screen.dart     # Tela com lista de Pacientes
│   ├── paciente_detail_screen.dart   # Tela de detalhes de um Paciente
│   ├── cadastro_paciente_form.dart   # Formulário de cadastro de Paciente
│
├── widgets/
│   ├── procedimento_form.dart        # Formulário para registro de Procedimentos
│   ├── sinais_vitais_form.dart       # Formulário para registro de Sinais Vitais
│
├── main.dart                         # Arquivo principal do projeto

## Como Executar o Projeto

- Pré-requisitos

    Flutter SDK instalado.
    Um editor de texto (recomenda-se o Visual Studio Code ou o Android Studio).
    Emulador Android/iOS ou dispositivo físico.

- Passos para Execução

-Clone este repositório:
-git clone https://github.com/seu-usuario/sistema-monitoramento-pacientes.git
-cd sistema-monitoramento-pacientes

- Instale as dependências:
-flutter pub get

Execute o aplicativo:

    flutter run

- Contribuições

Sinta-se à vontade para contribuir com este projeto! Faça um fork, crie um branch para suas alterações, e submeta um pull request.