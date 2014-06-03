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
end