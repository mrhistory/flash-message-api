require 'spec_helper'

describe FlashMessageAPI do
  before(:all) do
    FlashMessageAPI.set_endpoint(
      'https://flash-message-service-dev.herokuapp.com',
      'web_service_user',
      'thenitdoesntreallymatter')
  end

  before(:each) do
  end

  it 'should create a flash message and delete it' do
    message = FlashMessageAPI::FlashMessage.new( { message: 'New Message' })
    response = FlashMessageAPI.create_message(message)
    response.message.should eq(message.message)

    response2 = FlashMessageAPI.delete_message(response.id)
    response2.should eq(true)
  end
end