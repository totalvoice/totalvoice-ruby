require_relative '../route'
require_relative '../query'

module TotalVoice
  # Inicializa o HTTP client
  class Audio
    attr_reader :client
    ROTA_AUDIO = "/audio"

    def initialize(client)
      @client = client
    end

    ##
    # Envia um Audio para numero de destino
    #
    # @param [String] numero_destino
    # @param [String] url_audio
    # @param [Boolean] resposta_usuario
    # @param [String] bina
    # @param [Boolean] gravar_audio
    # @return [json]
    #
    def enviar(numero_destino, url_audio, resposta_usuario = false, bina = nil, gravar_audio = false)
      data = {
        body: {
          numero_destino: numero_destino,
          url_audio: url_audio,
          resposta_usuario: resposta_usuario,
          bina: bina,
          gravar_audio: gravar_audio
        }
      }
      @client.post(Route.new([ROTA_AUDIO]), data)
    end

    ##
    # Busca as informações do audio
    #
    # @param [Integer] id
    # @return [json]
    #
    def buscar(id)
      @client.get(Route.new([ROTA_AUDIO, id.to_s]))
    end

    ##
    # Busca as informações do audio
    #
    # @param [String] data_inicio
    # @param [String] data_fim
    # @return [json]
    #
    def relatorio(data_inicio, data_fim)
      @client.get(
        Route.new([ROTA_AUDIO, 'relatorio']),
        Query.new({ 'data_inicio': data_inicio, 'data_fim': data_fim })
      )
    end
  end
end
