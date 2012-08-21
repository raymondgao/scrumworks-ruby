require "scrumworks/session"

module Scrumworks
  class Client

    # Creates a new client connection to the given SOAP endpoint.
    # @param [String] endpoint_url the ScrumWorks API endpoint
    # @param [String] username the username with which to authenticate
    # @param [String] password the password with which to authenticate
    def initialize(endpoint_url, username, password)
      @endpoint = Savon::Client.new("#{endpoint_url}?wsdl") do
        wsdl.endpoint = endpoint_url
        http.auth.ssl.verify_mode = :none
        http.auth.basic username, password
      end
    end

    # Creates a new session, or returns an existing one, for the endpoint created when this client
    # was initialized.
    # @return [Scrumworks::Session] the session for this endpoint
    def session
      @session ||= Session.new(@endpoint)
    end

  end
end