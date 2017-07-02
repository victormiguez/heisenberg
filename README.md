# Heisenberg

![Logo](http://www.princiweb.com.br/heisenberg/logo.jpg)

## Iniciando o projeto

### Database

```
CREATE TABLE Posts(
   Id int IDENTITY(1,1) NOT NULL,
   Title nvarchar(100) NOT NULL,
   Description nvarchar(max) NOT NULL,
   PRIMARY KEY(Id)
);
```

### App

Primeiro de tudo, o básico que você precisa ter instalado é:

- [Node.js](http://nodejs.org/)

E as seguintes depêndencias:

- Gulp
- Bower
- CoffeeScript

```        
npm install -g gulp bower coffee-script
```

Depois vá a até a pasta do projeto e rode esse comando:

```
npm install && bower install
```

Agora é só rodar `gulp` e pronto, o projeto estará rodando :)

## Testes

Para rodar os testes, você precisará do [Mocha](http://mochajs.org/):

```
npm install -g mocha
```

Após isso, certifique-se que os dados do arquivo `/test/dal/database.coffee` estão de acordo com o BD de testes.

Agora é só rodar os testes:

```
npm test
```

Caso queira rodar testes específicos, veja abaixo.

### Server

- **DAL:** Testes de persistência do BD.

```
mocha test/dal
```

- **API:** Testes da API.

```
mocha test/api
```

### Client

- **TODO:** TODO

```
TODO
```

## Based on

- [SEA = SQL + Express + AngularJS](https://github.com/tdumitrescu/sea-blog)
- [Angular Express Seed](https://github.com/btford/angular-express-seed)
