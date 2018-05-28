require_relative '../route'

module TotalVoice
  # Inicializa o HTTP client
  class Did
    attr_reader :client
    ROTA_DID = "/did"
    ROTA_DID_ESTOQUE = "/did/estoque"
    ROTA_DID_CHAMADA = "/did/chamada"

    def initialize(client)
      @client = client
    end

    ##
    # Lista todos os dids pertencentes
    #
    # @return [json]
    #
    def listar()
      @client.get(Route.new([ROTA_DID]))
    end

    ##
    # Remove uma Conta
    #
    # @param [Integer] id
    # @return [json]
    #
    def excluir(id)
      @client.delete(Route.new([ROTA_DID, id.to_s]))
    end

    ##
    # Atualiza um did
    #
    # @param [Integer] id
    # @param [Integer] ramal_id
    # @param [Integer] ura_id
    # @return [json]
    #
    def atualizar(id, ramal_id, ura_id)
      @client.put(Route.new([ROTA_DID, id.to_s]), {
          ramal_id: ramal_id,
          ura_id: ura_id
      })
    end

    ##
    # Lista todos os dids disponiveis
    #
    # @return [json]
    #
    def lista_estoque()
      @client.get(Route.new([ROTA_DID_ESTOQUE]))
    end

    ##
    # Lista todos os dids disponiveis
    #
    # @param [Integer] id
    # @return [json]
    #
    def adquirir(id)
      @client.post(Route.new([ROTA_DID_ESTOQUE, id.to_s]))
    end

    ##
    # Busca uma chamada recebida pelo seu ID
    #
    # @param [Integer] id
    # @return [json]
    #
    def busca_chamada_recebida(id)
      @client.get(Route.new([ROTA_DID_CHAMADA, id.to_s]))
    end

    ##
    # Gera relatório de chamadas recebidas pelo DID
    #
    # @param [DateTime|String] data_inicio
    # @param [DateTime|String] data_fim
    # @return [json]
    #
    def relatorio(data_inicio, data_fim)
      @client.get(
        Route.new([ROTA_DID, 'relatorio']),
        Query.new({ 'data_inicio': Time.parse(data_inicio.to_s).utc, 'data_fim': Time.parse(data_fim.to_s).utc })
      )
    end
  end
end
