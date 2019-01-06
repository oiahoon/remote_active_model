module RemoteActiveModel
  class Retrieve
    def initialize(remote = nil)
      # TODO base on remote get url from database
      remote.nil? && @remote_url = 'http://localhost:3000'
      @client = Faraday.new(:url => @remote_url)
    end

    def carte
      response = @client.get '/remote_models'
      JSON.parse response.body
    end

    def query(params)
      response = @client.post '/remote_models/query', params
      JSON.parse response.body
    end

  end
end
