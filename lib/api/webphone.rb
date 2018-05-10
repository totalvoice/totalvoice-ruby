require_relative '../route'

module TotalVoice
  # Inicializa o HTTP client
  class Webphone
    attr_reader :client
    ROTA_WEBPHONE = "/webphone"

    def initialize(client)
      @client = client
    end

    ##
    # Requisita a URL do webphone de um ramal
    #
    # @param [Hash] data
    # @return [json]
    #
    def url(data)
      @client.get(Route.new([ROTA_WEBPHONE]), data)
    end
  end
end
