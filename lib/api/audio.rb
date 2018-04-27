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
      @client.post(ROTA_AUDIO, data)
    end

    ##
    # Busca as informações do audio
    #
    # @param [Integer] id
    # @return [json]
    #
    def buscar(id)
      @client.get(ROTA_AUDIO + "/" + id.to_s)
    end
  end
end
