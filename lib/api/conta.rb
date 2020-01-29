require_relative '../route'
require_relative '../query'

module TotalVoice
  # Inicializa o HTTP client
  class Conta
    attr_reader :client
    ROTA_CONTA = "/conta"
    ROTA_WEBHOOK_DEFAULT = "/webhook-default"

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
    # Gera uma URL para recarga de créditos
    #
    # @param [String] url
    # @return [json]
    #
    def url_recarga(url)
      @client.get(
        Route.new([ROTA_CONTA, 'urlrecarga']),
        Query.new({ 'url_retorno': url })
      )
    end
    
    ##
    # Adiciona crédito bônus nas contas criadas por mim
    # @param [Integer] id da conta filha
    # @param [String] nome do plano
    # @param [Float] valor
    # @return [json]
    #
    def recarga_bonus(id, nome, valor)
      @client.post(Route.new([ROTA_CONTA, id.to_s, 'bonus']), { nome: nome, valor:valor })
    end

        ##
    # Retorna a lista de webhooks default configurados para esta conta
    # @return [json]
    #
    def webhooks_default()
      @client.get(Route.new([ROTA_CONTA, ROTA_WEBHOOK_DEFAULT]))
    end

    ##
    # Apaga um webhook default
    #
    # @param [String] nome
    # @return [json]
    #
    def excluir_webhook_default(nome)
      @client.delete(Route.new([ROTA_CONTA, ROTA_WEBHOOK_DEFAULT, nome]))
    end

    ##
    # Cadastra ou atualiza um webhook default
    #
    # @param [String] nome
    # @param [String] url
    # @return [json]
    #
    def salva_webhook_default(nome, url)
      @client.put(Route.new([ROTA_CONTA, ROTA_WEBHOOK_DEFAULT, nome]), {
        url: url
      })
    end
  end
end
