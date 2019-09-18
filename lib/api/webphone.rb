require_relative '../route'
require_relative '../query'

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
      @client.get(Route.new([ROTA_WEBPHONE]), Query.new(data))
    end
  end
end
