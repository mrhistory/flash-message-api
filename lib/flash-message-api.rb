require 'flash-message-api/version'
require 'flash-message-api/flash-message'
require 'rest-client'
require 'json'

module FlashMessageAPI

  def self.set_endpoint(host, username, password)
    @endpoint = RestClient::Resource.new(host, username, password)
  end

  def self.create_message(message)
    response = @endpoint['messages/.json'].post(message.to_json)
    FlashMessage.new(parse_json(response.to_str))
  rescue Exception => e
    raise Exception, e.response if e.respond_to? response
    raise Exception, e.message
  end

  def self.delete_message(id)
    response = @endpoint["messages/#{id}.json"].delete
    parse_json(response.to_str)[:deleted]
  rescue Exception => e
    raise Exception, e.response if e.respond_to? response
    raise Exception, e.message
  end

  def self.get_message(id)
    response = @endpoint["messages/#{id}.json"].get
    FlashMessage.new(parse_json(response.to_str))
  rescue Exception => e
    raise Exception, e.response if e.respond_to? response
    raise Exception, e.message
  end

  def self.update_message(message)
    response = @endpoint["messages/#{message.id}.json"].put(message.to_json)
    FlashMessage.new(parse_json(response.to_str))
  rescue Exception => e
    raise Exception, e.response if e.respond_to? response
    raise Exception, e.message
  end

  def self.get_all_messages
    response = @endpoint["messages/.json"].get
    messages = []
    parse_json(response.to_str).each do |message|
      messages << FlashMessage.new(message)
    end
    return messages
  rescue Exception => e
    raise Exception, e.response if e.respond_to? response
    raise Exception, e.message
  end
  
  protected

  def self.parse_json(json)
    JSON.parse(json, symbolize_names: true)
  end

end
