require 'ruby_http_client'

module TotalVoice
  # Inicializa o HTTP client
  class Audio < Api
    attr_reader :client
    # * *Args*    :
    #   - +Access-Token+ -> Access-Token TotalVoice
    #   - +host+ -> Base URL para API
    #

    def initialize(client)
      super
    end

    def enviar(numero_destino, url_audio, resposta_usuario: false, bina: nil, gravar_audio: false)
      
      @client.request()
    end
  end
end
