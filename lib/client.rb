require 'httparty'
require 'json'

require_relative 'query'
require_relative 'api/audio'
require_relative 'api/bina'
require_relative 'api/fila'
require_relative 'api/chamada'
require_relative 'api/composto'
require_relative 'api/conferencia'
require_relative 'api/conta'
require_relative 'api/did'
require_relative 'api/perfil'
require_relative 'api/ramal'
require_relative 'api/sms'
require_relative 'api/tts'
require_relative 'api/ura'
require_relative 'api/webphone'
require_relative 'api/verificacao'
require_relative 'totalvoice/version'


module TotalVoice
  # Inicializa o HTTP client
  class API
    include HTTParty
    ENDPOINT = 'https://voice-api.zenvia.com'
    # * *Args*    :
    #   - +Access-Token+ -> Access-Token TotalVoice
    #   - +host+ -> Base URL para API
    #
    def initialize(access_token, host = nil, options = {})
      @access_token     = access_token
      @host             = host ? host : ENDPOINT
      @options = {
        headers: {
          'Access-Token' => @access_token,
          'Content-Type' => 'application/json',
          'Accept' => 'application/json',
          'User-Agent' => 'lib-ruby/' + VERSION
        }
      }.merge(options)

      @audio = nil
      @bina = nil
      @fila = nil
      @chamada = nil
      @conta = nil
      @composto = nil
      @conferencia = nil
      @did = nil
      @perfil = nil
      @ramal = nil
      @sms = nil
      @tts = nil
      @ura = nil
      @webphone = nil
      @verificacao = nil
    end

    def audio
        @audio ||= Audio.new self
    end

    def bina
        @bina ||= Bina.new self
    end

    def fila
        @fila ||= Fila.new self
    end

    def chamada
        @chamada ||= Chamada.new self
    end

    def composto
        @composto ||= Composto.new self
    end

    def conferencia
        @conferencia ||= Conferencia.new self
    end

    def conta
        @conta ||= Conta.new self
    end

    def did
        @did ||= Did.new self
    end

    def perfil
        @perfil ||= Perfil.new self
    end

    def ramal
        @ramal ||= Ramal.new self
    end

    def sms
        @sms ||= Sms.new self
    end

    def tts
        @tts ||= Tts.new self
    end

    def ura
        @ura ||= Ura.new self
    end

    def webphone
        @webphone ||= Webphone.new self
    end

    def verificacao
      @verificacao ||= Verificacao.new self
    end
    #
    # GET HTTP Method
    #
    # @param [Route] route
    # @param [Query] query
    # @return [json]
    #
    def get(route, query = nil)

      url = @host + route.build()
      if(query.instance_of?(Query))
        url = url + query.to_query()
      end

      self.class.get(url, @options);
    end

    #
    # POST HTTP Method
    #
    # @param [Route] route
    # @param [Hash] params
    # @return [json]
    #
    def post(route, params)
      data = {
        body: params.to_json
      }
      @options.merge!(data)
      self.class.post(@host + route.build(), @options);
    end

    #
    # PUT HTTP Method
    #
    # @param [Route] route
    # @param [Hash] params
    # @return [json]
    #
    def put(route, params)
      data = {
        body: params.to_json
      }
      @options.merge!(data)
      self.class.put(@host + route.build(), @options);
    end

    #
    # DELETE HTTP Method
    #
    # @param [Route] route
    # @return [json]
    #
    def delete(route)
      self.class.delete(@host + route.build(), @options);
    end
  end
end
