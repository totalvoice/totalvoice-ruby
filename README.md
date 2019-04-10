# totalvoice-ruby
Client em Ruby para a API da TotalVoice

> ### Funcionalidades

- [X] Gerenciamento das chamadas
- [X] Consulta e envio de SMS
- [X] Consulta e envio de TTS
- [X] Consulta e envio de Audio
- [X] Consulta e envio de Composto
- [X] Gerenciamento da Conta
- [X] Gerenciamento de Ramais
- [X] URL do Webphone
- [X] Gerenciamento de DID
- [X] Validação de Número
- [X] Verificação[Two Dactor Authentication]

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

@client = TotalVoice::API.new("access-token")
puts @client.chamada.ligar("NUMERO-A", "NUMERO-B")
```

> ##### Consulta os dados da chamada pelo ID

```ruby
require 'totalvoice-ruby'
include TotalVoice

@client = TotalVoice::API.new("access-token")
puts @client.chamada.buscar(123456)
```

> ##### Encerra uma chamada ativa

```ruby
require 'totalvoice-ruby'
include TotalVoice

@client = TotalVoice::API.new("access-token")
puts @client.chamada.encerrar(123456)
```

> ##### Envio de SMS

```ruby
require 'totalvoice-ruby'
include TotalVoice

@client = TotalVoice::API.new("access-token")
puts @client.sms.enviar("NUMERO-DESTINO", "MENSAGEM")
```

> ##### Envio de TTS

```ruby
require 'totalvoice-ruby'
include TotalVoice

@client = TotalVoice::API.new("access-token")
puts @client.tts.enviar("NUMERO-DESTINO", "MENSAGEM")
```

> ##### Envio de Audio

```ruby
require 'totalvoice-ruby'
include TotalVoice

@client = TotalVoice::API.new("access-token")
puts @client.audio.enviar("NUMERO-DESTINO", "URL-AUDIO")
```

> ##### Configurações de central telefonica - consultando ramal

```ruby
require 'totalvoice-ruby'
include TotalVoice

@client = TotalVoice::API.new("access-token")
puts @client.ramal.buscar(123)
```

> ##### Buscar os dados da Conta

```ruby
require 'totalvoice-ruby'
include TotalVoice

@client = TotalVoice::API.new("access-token")
puts @client.conta.buscar(123)
```

> ##### Consulta saldo da Minha Conta

```ruby
require 'totalvoice-ruby'
include TotalVoice

@client = TotalVoice::API.new("access-token")
puts @client.perfil.consulta_saldo()
```

> ##### Caso você necessite utilizar seu próprio endereço configurado na Total Voice

```ruby
require 'totalvoice-ruby'
include TotalVoice

@client = TotalVoice::API.new("access-token", "https://meuhost.com.br")
puts @client.perfil.consulta_saldo()
```

> ##### Adquirindo um did

```ruby
require 'totalvoice-ruby'
include TotalVoice

@client = TotalVoice::API.new("access-token")
puts @client.did.adquirir()
```

> ##### Listando seus DIDs

```ruby
require 'totalvoice-ruby'
include TotalVoice

@client = TotalVoice::API.new("access-token")
puts @client.did.listar()
```

> ### To-Do

- Tests

Mais informações sobre os métodos disponíveis podem ser encontrados na documentação da [API](https://api.totalvoice.com.br/doc/#/)

> ### Licença

Esta biblioteca segue os termos de uso da [MIT](https://github.com/totalvoice/totalvoice-ruby/blob/master/LICENSE)
