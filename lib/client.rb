require 'ruby_http_client'

module TotalVoice
  # Inicializa o HTTP client
  class API
    attr_accessor :client
    attr_reader :host
    # * *Args*    :
    #   - +Access-Token+ -> Access-Token TotalVoice
    #   - +host+ -> Base URL para API
    #
    def initialize(access_token, host: nil)
      @access_token     = access_token
      @host             = host ? host : 'https://api2.totalvoice.com.br'
      @request_headers  = JSON.parse('
        {
          "Access-Token": "' + @access_token + '",
          "Accept": "application/json"
        }
      ')
      @client = Client.new(host: "#{@host}",
                           request_headers: @request_headers)

      @audio = nil
      @chamada = nil
      @perfil = nil
      @conta = nil
      @composto = nil
      @conferencia = nil
      @sms = nil
      @tts = nil
      @central = nil
      @did = nil
    end

    def audio
        @audio ||= Audio.new self
    end
  end
end
