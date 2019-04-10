require 'date'

require_relative '../route'
require_relative '../query'

module TotalVoice
  # Inicializa o HTTP client
  class Verificacao
    attr_reader :client
    ROTA_VERIFICACAO = "/verificacao"

    def initialize(client)
      @client = client
    end

    ##
    # Envia o código de verificação
    #
    # @param [String] numero_destino
    # @param [String] nome_produto
    # @param [Hash] opcoes
    # @return [json]
    #
    def enviar(numero_destino, nome_produto, opcoes = {})
      data = {
        numero_destino: numero_destino,
        nome_produto: nome_produto
      }
      data.merge!(opcoes)
      @client.post(Route.new([ROTA_VERIFICACAO]), data)
    end

   ##
    # Consulta se o código pin é valido
    #
    # @param [Integer] id
    # @return [json]
    #
    def consultar(id, pin)
        @client.get(
            Route.new([ROTA_VERIFICACAO]),
            Query.new({ 'id': id.to_s, 'pin': pin.to_s })
            )
    end

  end
end
