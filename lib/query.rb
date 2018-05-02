module TotalVoice

  class Query
    # * *Args*    :
    #   - +paths+ -> Array com valores para montar a rota
    #
    def initialize(values)
      @values = values
    end

    #
    # Monta a URL de acordo com os parâmetros
    #
    def to_query()
      @query = "?" + @values.map{|k,v| "#{k}=#{v}"}.join('&')
    end

  end

end
