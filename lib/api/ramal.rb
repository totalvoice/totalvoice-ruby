require_relative '../route'
require_relative '../query'

module TotalVoice
  # Inicializa o HTTP client
  class Ramal
    attr_reader :client
    ROTA_RAMAL = "/ramal"

    def initialize(client)
      @client = client
    end

    ##
    # Cria um novo ramal
    #
    # @param [Hash] data
    # @return [json]
    #
    def criar(data)
      @client.post(Route.new([ROTA_RAMAL]), data)
    end

    ##
    # Remove um ramal
    #
    # @param [Integer] id
    # @return [json]
    #
    def excluir(id)
      @client.delete(Route.new([ROTA_RAMAL, id.to_s]))
    end

    ##
    # Busca as informações do registro do ramal
    #
    # @param [Integer] id
    # @return [json]
    #
    def buscar(id)
      @client.get(Route.new([ROTA_RAMAL, id.to_s]))
    end

    ##
    # Atualiza as informações do Ramal
    #
    # @param [Integer] id
    # @param [Hash] data
    # @return [json]
    #
    def atualizar(id, data)
      @client.put(Route.new([ROTA_RAMAL, id.to_s]), data)
    end

    ##
    # Gera relatório de ramais criados
    #
    # @param [DateTime|String] data_inicio
    # @param [DateTime|String] data_fim
    # @return [json]
    #
    def relatorio(data_inicio, data_fim)
      @client.get(
        Route.new([ROTA_RAMAL, 'relatorio']),
        Query.new({ 'data_inicio': Time.parse(data_inicio.to_s).utc, 'data_fim': Time.parse(data_fim.to_s).utc })
      )
    end
    
    ##
    # Gera relatório de pausas de um ramal
    #
    # @param [Integer] id
    # @param [DateTime|String] data_inicio
    # @param [DateTime|String] data_fim
    # @return [json]
    #
    def relatorio_pausa_ramal(id, data_inicio, data_fim)
      @client.get(
        Route.new([ROTA_RAMAL,id.to_s, 'pausas']),
        Query.new({'data_inicio': Time.parse(data_inicio.to_s).utc, 'data_fim': Time.parse(data_fim.to_s).utc })
      )
    end
  end
end