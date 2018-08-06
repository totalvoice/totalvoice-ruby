require_relative '../route'
require_relative '../query'

module TotalVoice
  # Inicializa o HTTP client
  class Bina
    attr_reader :client
    ROTA_BINA = "/bina"

    def initialize(client)
      @client = client
    end

    ##
    # Envia um número pra receber um código de validação
    #
    # @param [String] telefone
    # @return [json]
    #
    def enviar(telefone)
      @client.post(Route.new([ROTA_BINA]), {telefone: telefone})
    end

    ##
    # Verifica se o código é válido para o telefone
    #
    # @param [String] codigo
    # @param [String] telefone
    # @return [json]
    #
    def validar(codigo, telefone)
      @client.get(
        Route.new([ROTA_BINA]),
        Query.new({ 'codigo': codigo, 'telefone': telefone })
      )
    end

    ##
    # Remove o telefone cadastrado na sua Conta
    #
    # @param [String] telefone
    # @return [json]
    #
    def excluir(telefone)
      @client.delete(Route.new([ROTA_BINA, telefone]))
    end

    ##
    # Gera relatório com os números cadastrados
    #
    # @return [json]
    #
    def relatorio()
      @client.get(Route.new([ROTA_BINA, 'relatorio']))
    end
  end
end
