require_relative '../route'
require_relative '../query'

module TotalVoice
  # Inicializa o HTTP client
  class Chamada
    attr_reader :client
    ROTA_CHAMADA = "/chamada"

    def initialize(client)
      @client = client
    end

    ##
    # Realiza uma chamada telefônica entre dois números: A e B
    #
    # @param [String] numero_origem
    # @param [String] numero_destino
    # @param [Hash] opcoes
    # @return [json]
    #
    def ligar(numero_origem, numero_destino, opcoes = {})

      body = {
        numero_origem: numero_origem,
        numero_destino: numero_destino
      }
      body.merge!(opcoes)

      data = {
        body: body
      }
      @client.post(Route.new([ROTA_CHAMADA]), data)
    end

    ##
    # Encerra uma chamada ativa
    #
    # @param [Integer] id
    # @return [json]
    #
    def encerrar(id)
      @client.delete(Route.new([ROTA_CHAMADA, id.to_s]))
    end

    ##
    # Busca as informações do registro da chamada
    #
    # @param [Integer] id
    # @return [json]
    #
    def buscar(id)
      @client.get(Route.new([ROTA_CHAMADA, id.to_s]))
    end

    ##
    # Busca as informações do registro da chamada
    #
    # @param [Integer] id
    # @return [json]
    #
    def download_gravacao(id)
      @client.get(Route.new([ROTA_CHAMADA, id.to_s, 'gravacao']))
    end

    ##
    # Gera relatório de chamadas
    #
    # @param [DateTime|String] data_inicio
    # @param [DateTime|String] data_fim
    # @return [json]
    #
    def relatorio(data_inicio, data_fim)
      @client.get(
        Route.new([ROTA_CHAMADA, 'relatorio']),
        Query.new({ 'data_inicio': Time.parse(data_inicio.to_s).utc, 'data_fim': Time.parse(data_fim.to_s).utc })
      )
    end

    ##
    # (Beta) Escuta uma chamada ativa
    #
    # @param [Integer] id
    # @param [String] numero
    # @param [Integer] modo
    # @return [json]
    #
    def escutar(id, numero, modo)
      data = {
        body: {
          numero: numero,
          modo: modo
        }
      }
      @client.post(Route.new([ROTA_CHAMADA, id.to_s, 'escuta']), data)
    end

    ##
    # (Beta) Faz uma transferência da chamada atual
    #
    # @param [Integer] id
    # @param [String] numero
    # @param [String] perna
    # @return [json]
    #
    def transferir(id, numero, perna)
      data = {
        body: {
          numero: numero,
          perna: perna
        }
      }
      @client.post(Route.new([ROTA_CHAMADA, id.to_s, 'transfer']), data)
    end

    ##
    # Avalia uma Chamada com nota de 1 a 5
    #
    # @param [Integer] id
    # @param [String] nota
    # @param [String] comentario
    # @return [json]
    #
    def avaliar(id, nota, comentario = nil)
      data = {
        body: {
          nota: nota,
          comentario: comentario
        }
      }
      @client.post(Route.new([ROTA_CHAMADA, id.to_s, 'avaliar']), data)
    end
  end
end
