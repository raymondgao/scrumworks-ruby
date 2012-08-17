require "savon"
require "scrumworks/version"
require "scrumworks/client"

module Scrumworks

  Savon.configure do |config|
    config.log = false
    config.log_level = :info
  end
  HTTPI.log = false

end
