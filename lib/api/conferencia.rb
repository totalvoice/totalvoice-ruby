require_relative '../route'

module TotalVoice
  # Inicializa o HTTP client
  class Conferencia
    attr_reader :client
    ROTA_CONFERENCIA = "/conferencia"

    def initialize(client)
      @client = client
    end

    ##
    # Cria uma conferência
    #
    # @return [json]
    #
    def criar()
      @client.post(Route.new([ROTA_CONFERENCIA]), {})
    end

    ##
    # Envia um audio para um número destino
    #
    # @param [Integer] id
    # @param [String] numero
    # @param [String] bina
    # @param [Boolean] gravar_audio
    # @return [json]
    #
    def add_numero_conferencia(id, numero, bina = nil, gravar_audio = false)
      @client.post(Route.new([ROTA_CONFERENCIA, id.to_s]), {
        numero: numero,
        bina: bina,
        gravar_audio: gravar_audio
      })
    end

    ##
    # Busca um composto pelo seu ID
    #
    # @param [Integer] id
    # @return [json]
    #
    def buscar(id)
      @client.get(Route.new([ROTA_CONFERENCIA, id.to_s]))
    end

    ##
    # Remove uma conferência ativa
    #
    # @param [Integer] id
    # @return [json]
    #
    def excluir(id)
      @client.delete(Route.new([ROTA_CONFERENCIA, id.to_s]))
    end

    ##
    # Gera um relatorio de conferencias
    #
    # @param [DateTime|String] data_inicio
    # @param [DateTime|String] data_fim
    # @return [json]
    #
    def relatorio(data_inicio, data_fim)
      @client.get(
        Route.new([ROTA_CONFERENCIA, 'relatorio']),
        Query.new({ 'data_inicio': Time.parse(data_inicio.to_s).utc, 'data_fim': Time.parse(data_fim.to_s).utc })
      )
    end

    ##
    # Gera um relatorio de chamadas de conferencias
    #
    # @param [DateTime|String] data_inicio
    # @param [DateTime|String] data_fim
    # @return [json]
    #
    def relatorio_chamadas_conferencias(data_inicio, data_fim)
      @client.get(
        Route.new([ROTA_CONFERENCIA, 'chamadas/relatorio']),
        Query.new({ 'data_inicio': Time.parse(data_inicio.to_s).utc, 'data_fim': Time.parse(data_fim.to_s).utc })
      )
    end

  end
end
