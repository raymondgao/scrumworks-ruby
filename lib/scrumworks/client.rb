require "scrumworks/session"

module Scrumworks
  class Client

    def initialize(endpoint_url, username, password)
      @endpoint = Savon::Client.new("#{endpoint_url}?wsdl").tap do |conn|
        conn.wsdl.endpoint = endpoint_url
        conn.http.auth.ssl.verify_mode = :none
        conn.http.auth.basic username, password
      end
    end

    def session
      @session ||= Session.new(@endpoint)
    end
  end
end