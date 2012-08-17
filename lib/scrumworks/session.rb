module Scrumworks
  class Session
    def initialize(client)
      @client = client
    end

    def get_product_by_name(name)
      @client.request(:get_product_by_name) do
        soap.body = { product_name: name }
      end.to_hash[:get_product_by_name_response][:return]
    end
  end
end