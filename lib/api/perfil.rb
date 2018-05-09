require_relative '../route'
require_relative '../query'

module TotalVoice
  # Inicializa o HTTP client
  class Perfil
    attr_reader :client
    ROTA_SALDO = "/saldo"
    ROTA_PERFIL = "/conta"
    ROTA_WEBHOOK = "/webhook"

    def initialize(client)
      @client = client
    end

    ##
    # Consulta saldo atual
    # @return [json]
    #
    def consulta_saldo()
      @client.get(Route.new([ROTA_SALDO]))
    end

    ##
    # Leitura dos dados da minha conta
    # @return [json]
    #
    def minha_conta()
      @client.get(Route.new([ROTA_PERFIL]))
    end

    ##
    # Atualiza os dados da minha conta
    # @param [Hash] data
    # @return [json]
    #
    def atualizar(data)
      @client.put(Route.new([ROTA_PERFIL]), data)
    end

    ##
    # Busca as informações do registro da chamada
    #
    # @param [Integer] id
    # @return [json]
    #
    def relatorio_recarga()
      @client.get(Route.new([ROTA_PERFIL, 'recargas']))
    end

    ##
    # Gera uma URL para recarga de créditos
    #
    # @param [String] url
    # @return [json]
    #
    def url_recarga(url)
      @client.get(
        Route.new([ROTA_PERFIL, 'urlrecarga']),
        Query.new({ 'url_retorno': url })
      )
    end

    ##
    # Retorna a lista de webhooks configurados para esta conta
    # @return [json]
    #
    def webhooks()
      @client.get(Route.new([ROTA_WEBHOOK]))
    end

    ##
    # Apaga um webhook
    #
    # @param [String] nome
    # @return [json]
    #
    def excluir_webhook(nome)
      @client.delete(Route.new([ROTA_WEBHOOK, nome]))
    end

    ##
    # Cadastra ou atualiza um webhook
    #
    # @param [String] nome
    # @param [String] url
    # @return [json]
    #
    def salva_webhook(nome, url)
      data = {
        url: url
      }
      @client.put(Route.new([ROTA_WEBHOOK, nome]), data)
    end
  end
end
