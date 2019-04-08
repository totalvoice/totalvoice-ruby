require_relative '../route'
require_relative '../query'

module TotalVoice
  # Inicializa o HTTP client
  class Composto
    attr_reader :client
    ROTA_COMPOSTO = "/composto"

    def initialize(client)
      @client = client
    end

    ##
    # Envia um composto para um número destino
    #
    # @param [String] numero_destino
    # @param [Hash] dados
    # @param [String] bina
    # @param [String] tags
    # @param [Boolean] gravar_audio
    # @param [Boolean] detecta_caixa
    # @return [json]
    #
    def enviar(numero_destino, dados, bina = nil, tags = nil, gravar_audio = false, detecta_caixa = false)
      @client.post(Route.new([ROTA_COMPOSTO]), {
        numero_destino: numero_destino,
        bina: bina,
        tags: tags,
        gravar_audio: gravar_audio,
        dados: dados,
        detecta_caixa: detecta_caixa
      })
    end

    ##
    # Busca um composto pelo seu ID
    #
    # @param [Integer] id
    # @return [json]
    #
    def buscar(id)
      @client.get(Route.new([ROTA_COMPOSTO, id.to_s]))
    end

    ##
    # Relatório do Composto
    #
    # @param [DateTime|String] data_inicio
    # @param [DateTime|String] data_fim
    # @return [json]
    #
    def relatorio(data_inicio, data_fim)
      @client.get(
        Route.new([ROTA_COMPOSTO, 'relatorio']),
        Query.new({ 'data_inicio': Time.parse(data_inicio.to_s).utc, 'data_fim': Time.parse(data_fim.to_s).utc })
      )
    end
  end
end
