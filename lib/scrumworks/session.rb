module Scrumworks
  class Session

    # Creates a new session for the given endpoint.
    # @param [Savon::Client] the endpoint to call
    def initialize(endpoint)
      @endpoint = endpoint
    end

    # Calls SOAP API methods defined by the endpoint's interface.
    # @param [Symbol, String] method_name the name of the method
    # @param args the arguments passed to the method. If the last one is a hash, it will be passed as arguments to the
    # API call.
    def method_missing(method_name, *args)
      @endpoint.request(method_name) do
        soap.body = args.last if args.last.is_a? Hash
      end.to_hash["#{method_name}_response".to_sym][:return]
    end

  end
end