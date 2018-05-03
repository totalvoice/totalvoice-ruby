module TotalVoice

  class Query
    # * *Args*    :
    #   - +values+ -> Array com valores para montar a Query String
    #
    def initialize(values)
      @values = values
    end

    #
    # Monta a Query String
    #
    def to_query()
      @query = "?" + @values.map{|k,v| "#{k}=#{v}"}.join('&')
    end

  end

end
