require_relative '../route'
require_relative '../query'

module TotalVoice
  # Inicializa o HTTP client
  class Sms
    attr_reader :client
    ROTA_SMS = "/sms"

    def initialize(client)
      @client = client
    end

    ##
    # Enviar SMS
    #
    # @param [String] numero_destino
    # @param [String] mensagem
    # @param [Boolean] resposta_usuario
    # @param [Boolean] multi_sms
    # @param [DateTime|String] data_criacao
    # @param [String] tags
    # @return [json]
    #
    def enviar(numero_destino, mensagem, resposta_usuario = false, multi_sms = false, data_criacao = nil, tags = nil)
      @client.post(Route.new([ROTA_SMS]), {
        numero_destino: numero_destino,
        mensagem: mensagem,
        resposta_usuario: resposta_usuario,
        multi_sms: multi_sms,
        data_criacao: data_criacao != nil ? Time.parse(data_criacao.to_s).utc : nil,
        tags: tags
      })
    end

    ##
    # Busca as informações do registro de SMS
    #
    # @param [Integer] id
    # @return [json]
    #
    def buscar(id)
      @client.get(Route.new([ROTA_SMS, id.to_s]))
    end

    ##
    # Gera relatório de SMS
    #
    # @param [DateTime|String] data_inicio
    # @param [DateTime|String] data_fim
    # @return [json]
    #
    def relatorio(data_inicio, data_fim)
      @client.get(
        Route.new([ROTA_SMS, 'relatorio']),
        Query.new({ 'data_inicio': Time.parse(data_inicio.to_s).utc, 'data_fim': Time.parse(data_fim.to_s).utc })
      )
    end
  end
end
