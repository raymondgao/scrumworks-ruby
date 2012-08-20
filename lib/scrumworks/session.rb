module Scrumworks
  class Session
    def initialize(client)
      @client = client
    end

    def method_missing(method_name, *args)
      @client.request(method_name) do
        soap.body = args.last
      end.to_hash["#{method_name}_response".to_sym][:return]
    end
  end
end