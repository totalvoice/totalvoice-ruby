module TotalVoice
  # Inicializa o HTTP client
  class Api
    attr_reader :client

    def initialize(client)
        @client = client
        @host = nil
        @base_url = nil
        @port = nil
    end

    def request(method, uri, params = {}, data = {}, headers = {}, auth = nil, timeout = nil)
        url = uri.match(/^http/) ? uri : absolute_url(uri)

        @client.request(
          @host,
          @port,
          method,
          url,
          params,
          data,
          headers,
          auth,
          timeout
        )
    end
  end
end
