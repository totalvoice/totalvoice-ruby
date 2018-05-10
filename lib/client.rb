require 'httparty'
require_relative 'query'
require_relative 'api/audio'
require_relative 'api/sms'
require_relative 'api/tts'
require_relative 'api/chamada'
require_relative 'api/perfil'
require_relative 'api/ramal'

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
      @webphone = nil
      @ramal = nil
      @did = nil
    end

    def audio
        @audio ||= Audio.new self
    end

    def sms
        @sms ||= Sms.new self
    end

    def tts
        @tts ||= Tts.new self
    end

    def chamada
        @chamada ||= Chamada.new self
    end

    def perfil
        @perfil ||= Perfil.new self
    end

    def ramal
        @ramal ||= Ramal.new self
    end

    def webphone
        @webphone ||= Webphone.new self
    end

    def get(route, query = nil)

      url = @host + route.build()
      if(query.instance_of?(Query))
        url = url + query.to_query()
      end

      self.class.get(url, @options);
    end

    def post(route, params)
      data = {
        body: params
      }
      @options.merge!(data)
      self.class.post(@host + route.build(), @options);
    end

    def put(route, params)
      data = {
        body: params
      }
      @options.merge!(data)
      self.class.put(@host + route.build(), @options);
    end

    def delete(route)
      self.class.delete(@host + route.build(), @options);
    end
  end
end
