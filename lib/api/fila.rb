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

    ##
    # Criar fila
    #
    # @param [String] nome
    # @param [String] estrategia_ring
    # @param [String] timeout_ring
    # @return [json]
    #
    def criar(nome, estrategia_ring, timeout_ring = nil)
      data = {
        nome: nome,
        estrategia_ring: estrategia_ring,
        timeout_ring: timeout_ring
      }
      @client.post(Route.new([ROTA_FILA]), data)
    end

    ##
    # Adiciona um ramal na fila
    #
    # @param [String] nome
    # @param [String] estrategia_ring
    # @param [String] timeout_ring
    # @return [json]
    #
    def adiciona_ramal(id, ramal_id)
      data = {
        ramal_id: ramal_id
      }
      @client.post(Route.new([ROTA_FILA, id.to_s]), data)
    end

    ##
    # Busca as informações de um ramal da Fila de Atendimento
    #
    # @param [Integer] id
    # @return [json]
    #
    def buscar_ramal(id, ramal_id)
      @client.get(Route.new([ROTA_FILA, id.to_s, ramal_id.to_s]))
    end

    ##
    # Atualiza as informações da fila
    #
    # @param [Integer] id
    # @param [Hash] data
    # @return [json]
    #
    def atualizar(id, data)
      @client.put(Route.new([ROTA_FILA, id.to_s]), data)
    end

    ##
    # Remove um ramal da fila
    #
    # @param [Integer] id
    # @param [Integer] ramal_id
    # @return [json]
    #
    def excluir_ramal(id, ramal_id)
      @client.delete(Route.new([ROTA_RAMAL, id.to_s, ramal_id.to_s]))
    end
  end
end
