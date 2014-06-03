require 'flash-message-api/version'
require 'flash-message-api/flash-message'
require 'rest-client'
require 'json'

module FlashMessageAPI

  def self.set_endpoint(host, username, password)
    @endpoint = RestClient::Resource.new(host, username, password)
  end

  
  
  protected

  def self.parse_json(json)
    JSON.parse(json, symbolize_names: true)
  end

end
