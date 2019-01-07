module RemoteActiveModel
  class Retrieve
    REMOTE_PATH = '/remote_active_models'.freeze
    QUERY_PATH  = '/query'.freeze

    def initialize(options = {})
      @options = options
      varify_and_assign_variables
      @client = Faraday.new(url: @remote_url)
    end

    def carte
      response = @client.get(@remote_model_path)
      JSON.parse response.body
    end

    def query(params)
      response = @client.post(@remote_query_path, params)
      JSON.parse response.body
    end

    private

    def varify_and_assign_variables
      options = HashWithIndifferentAccess.new(@options)
      @remote_name = options[:name] || raise(NoNameError)
      @remote_url  = options[:url] || raise(NoUrlError)

      # TODO: will support custom path future
      #
      # @remote_model_path = options[:path] || REMOTE_PATH
      @remote_model_path = REMOTE_PATH
      @remote_query_path = "#{@remote_model_path}#{QUERY_PATH}"
    end
  end
end
