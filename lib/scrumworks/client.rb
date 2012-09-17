require "scrumworks/session"

module Scrumworks
  class Client

    # Creates a connection to v2 of the ScrumWorks API.
    # @param [String] root_url the root of the SW installation. ex: http://localhost:8080
    # @param [String] username the username to use for authentication
    # @param [String] password the password to use for authentication
    # @return [Scrumworks::Client] a client configured for API2
    def self.api2(root_url, username, password)
      Scrumworks::Client.new("#{root_url}/scrumworks-api/api2/scrumworks", username, password)
    end

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