require_relative '../route'

module TotalVoice
  # Inicializa o HTTP client
  class Fila
    attr_reader :client
    ROTA_FILA = "/fila"

    def initialize(client)
      @client = client
    end

    ##
    # Busca as informações da Fila de Atendimento
    #
    # @param [Integer] id
    # @return [json]
    #
    def buscar(id)
      @client.get(Route.new([ROTA_FILA, id.to_s]))
    end
  end
end
