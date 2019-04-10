require_relative '../route'
require_relative '../query'

module TotalVoice
  # Inicializa o HTTP client
  class Ura
    attr_reader :client
    ROTA_URA = "/ura"

    def initialize(client)
      @client = client
    end

    ##
    # Cria um nova URA
    #
    # @param [String] nome
    # @param [Hash] data
    # @return [json]
    #
    def criar(nome, data)
      @client.post(Route.new([ROTA_URA]), {
        nome: nome,
        dados: data
      })
    end

    ##
    # Remove uma Ura
    #
    # @param [Integer] id
    # @return [json]
    #
    def excluir(id)
      @client.delete(Route.new([ROTA_URA, id.to_s]))
    end

    ##
    # Busca uam URA pelo seu ID
    #
    # @param [Integer] id
    # @return [json]
    #
    def buscar(id)
      @client.get(Route.new([ROTA_URA, id.to_s]))
    end

    ##
    # Atualiza uma ura
    #
    # @param [Integer] id
    # @param [Hash] data
    # @return [json]
    #
    def atualizar(id, data)
      @client.put(Route.new([ROTA_URA, id.to_s]), data)
    end

    ##
    # Gera relatório de todas as URAs da conta
    #
    # @param [DateTime|String] data_inicio
    # @param [DateTime|String] data_fim
    # @return [json]
    #
    def relatorio(data_inicio, data_fim)
      @client.get(
        Route.new([ROTA_URA, 'relatorio']),
        Query.new({ 'data_inicio': Time.parse(data_inicio.to_s).utc, 'data_fim': Time.parse(data_fim.to_s).utc })
      )
    end

  end
end
