module TotalVoice

  class Route
    # * *Args*    :
    #   - +paths+ -> Array com valores para montar a rota
    #
    def initialize(paths)
      @paths = paths
    end

    #
    # Monta a URL de acordo com os parâmetros
    #
    def build()
      @paths.join("/")
    end

  end

end
