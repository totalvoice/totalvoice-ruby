# totalvoice-ruby
Client em Ruby para a API da TotalVoice

> ### Funcionalidades

- [X] Gerenciamento das chamadas
- [X] Consulta e envio de SMS
- [X] Consulta e envio de TTS
- [X] Consulta e envio de Audio
- [X] Gerenciamento da Conta
- [X] Gerenciamento de Ramais
- [X] URL do Webphone
- [X] Gerenciamento de DID

> ### Requisitos

- Ruby: 2.4.3
- Gem: 2.6.14

> ### Instalação

```bash
 gem 'totalvoice-ruby'
```

```bash
 gem install totalvoice-ruby
```

> ### Utilização

Para utilizar esta biblioteca, primeiramente você deverá realizar um cadastro no site da [Total Voice](http://www.totalvoice.com.br). Após a criação do cadastro será disponibilizado um AccessToken para acesso a API.

Com o AccessToken em mãos será possível realizar as consultas/cadastros conforme documentação da [API](https://api.totalvoice.com.br/doc/#/)

A seguir exemplos de como utilizar esta biblioteca.

> ##### Realiza uma chamada telefônica entre dois números: A e B

```ruby
require 'totalvoice-ruby'
include TotalVoice

@client = TotalVoice::API.new("{{access-token}}")
puts @client.chamada.ligar("NUMERO-A", "NUMERO-B")
```

> ### To-Do

- Tests

## EM CONSTRUÇÃO - AGUARDE!
