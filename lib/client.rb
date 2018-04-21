require 'httparty'
require_relative 'api/audio'

module TotalVoice
  # Inicializa o HTTP client
  class API
    include HTTParty
    ENDPOINT = 'https://api2.totalvoice.com.br'
    # * *Args*    :
    #   - +Access-Token+ -> Access-Token TotalVoice
    #   - +host+ -> Base URL para API
    #
    def initialize(access_token, host: nil)
      @access_token     = access_token
      @host             = host ? host : ENDPOINT
      @options = {
        headers: {
          "Access-Token" => @access_token,
          "Accept" => "application/json"
        }
      }

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

    def get(path)
      response = self.class.get(@host + path, @options);
      if response.success?
        response  
      else  
        raise response.response  
      end
    end

    def post(path, data)
      @options.merge(data)
      response = self.class.post(@host + path, @options);
      if response.success?
        response  
      else  
        raise response.response  
      end
    end
  end
end
