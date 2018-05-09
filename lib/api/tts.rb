require_relative '../route'
require_relative '../query'

module TotalVoice
  # Inicializa o HTTP client
  class Tts
    attr_reader :client
    ROTA_TTS = "/tts"

    def initialize(client)
      @client = client
    end

    ##
    # Enviar TTS
    #
    # @param [String] numero_destino
    # @param [String] mensagem
    # @param [Hash] opcoes
    # @return [json]
    #
    def enviar(numero_destino, mensagem, opcoes = {})
      data = {
        numero_destino: numero_destino,
        mensagem: mensagem
      }
      data.merge!(opcoes)
      @client.post(Route.new([ROTA_TTS]), data)
    end

    ##
    # Busca as informações do registro de TTS
    #
    # @param [Integer] id
    # @return [json]
    #
    def buscar(id)
      @client.get(Route.new([ROTA_TTS, id.to_s]))
    end

    ##
    # Gera relatório de TTS
    #
    # @param [DateTime|String] data_inicio
    # @param [DateTime|String] data_fim
    # @return [json]
    #
    def relatorio(data_inicio, data_fim)
      @client.get(
        Route.new([ROTA_TTS, 'relatorio']),
        Query.new({ 'data_inicio': Time.parse(data_inicio.to_s).utc, 'data_fim': Time.parse(data_fim.to_s).utc })
      )
    end
  end
end
