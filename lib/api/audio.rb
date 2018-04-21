module TotalVoice
  # Inicializa o HTTP client
  class Audio
    attr_reader :client
    ROTA_AUDIO = "/audio"

    def initialize(client)
      @client = client
    end

    def enviar(numero_destino, url_audio, resposta_usuario: false, bina: nil, gravar_audio: false)  
      data = {
        body: {
          numero_destino: numero_destino, # your columns/data
          url_audio: url_audio,
          resposta_usuario: resposta_usuario,
          bina: bina,
          gravar_audio: gravar_audio
        }
      }  
      @client.post(ROTA_AUDIO, data)
    end
  end
end
