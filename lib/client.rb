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
    def initialize(access_token, host = nil)
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

    def get(route, query = nil)
      self.class.get(@host + route.build(), @options);
    end

    def post(route, data)
      @options.merge!(data)
      self.class.post(@host + route.build(), @options);
    end

    private def buildRequest(route, method, params = [], data = [])

    end
  end
end
