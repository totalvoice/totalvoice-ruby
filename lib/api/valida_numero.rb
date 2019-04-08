require 'date'

require_relative '../route'
require_relative '../query'

module TotalVoice
  # Inicializa o HTTP client
  class ValidaNumero
    attr_reader :client
    ROTA_VALIDA_NUMERO = "/valida_numero"

    def initialize(client)
      @client = client
    end

    ##
    # Envia um Numeoro para verificação
    #
    # @param [String] numero_destino
    # @return [json]
    #
    def enviar(numero_destino)
      @client.post(Route.new([ROTA_VALIDA_NUMERO]), {
        numero_destino: numero_destino
      })
    end

    ##
    # Busca as informações de um número validado
    #
    # @param [Integer] id
    # @return [json]
    #
    def buscar(id)
      @client.get(Route.new([ROTA_VALIDA_NUMERO, id.to_s]))
    end

    ##
    # Gera relatório de números validados
    #
    # @param [DateTime|String] data_inicio
    # @param [DateTime|String] data_fim
    # @return [json]
    #
    def relatorio(data_inicio, data_fim)
      @client.get(
        Route.new([ROTA_VALIDA_NUMERO, 'relatorio']),
        Query.new({ 'data_inicio': Time.parse(data_inicio.to_s).utc, 'data_fim': Time.parse(data_fim.to_s).utc })
      )
    end
  end
end