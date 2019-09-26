require_relative '../route'

module TotalVoice
  # Inicializa o HTTP client
  class Conta
    attr_reader :client
    ROTA_CONTA = "/conta"

    def initialize(client)
      @client = client
    end

    ##
    # Cria uma conta abaixo da sua - Subconta
    #
    # @param [Hash] data
    # @return [json]
    #
    def criar(data)
      @client.post(Route.new([ROTA_CONTA]), data)
    end

    ##
    # Atualiza os dados da Subconta
    #
    # @param [Integer] id
    # @param [Hash] data
    # @return [json]
    #
    def atualizar(id, data)
      @client.put(Route.new([ROTA_CONTA, id.to_s]), data)
    end

    ##
    # Busca os dados da Subconta
    #
    # @param [Integer] id
    # @return [json]
    #
    def buscar(id)
      @client.get(Route.new([ROTA_CONTA, id.to_s]))
    end

    ##
    # Remove uma Subconta
    #
    # @param [Integer] id
    # @return [json]
    #
    def excluir(id)
      @client.delete(Route.new([ROTA_CONTA, id.to_s]))
    end

    ##
    # Lista todas as subconta criadas por mim
    # @return [json]
    #
    def relatorio()
      @client.get(Route.new([ROTA_CONTA, 'relatorio']))
    end
    
    ##
    # Adiciona crédito bônus nas contas criadas por mim
    # @param [Integer] id da conta filha
    # @param [Float] valor
    # @return [json]
    #
    def recarga_bonus(id, valor)
      @client.post(Route.new([ROTA_CONTA, id.to_s, 'bonus']), { valor:valor })
    end
  end
end
