require 'spec_helper'

describe FlashMessageAPI do
  before(:all) do
    FlashMessageAPI.set_endpoint(
      'https://flash-message-service-dev.herokuapp.com',
      'web_service_user',
      'thenitdoesntreallymatter')
  end

  before(:each) do
    @mess1 = FlashMessageAPI::FlashMessage.new( {
      message: 'Message 1',
      application_ids: ['1', '2'],
      organization_ids: ['11', '12'],
      expiration: Time.now + 3600,
      created_by: '006'
      })
    @mess2 = FlashMessageAPI::FlashMessage.new( {
      message: 'Message 2',
      application_ids: ['3', '2'],
      organization_ids: ['11', '13'],
      expiration: Time.now + 3600,
      created_by: '007'
      })
  end

  it 'should create a flash message and delete it' do
    response = FlashMessageAPI.create_message(@mess1)
    expect(response.message).to eq(@mess1.message)
    response2 = FlashMessageAPI.delete_message(response.id)
    expect(response2).to eq(true)
  end

  it 'should get a particular flash message' do
    fm = FlashMessageAPI.create_message(@mess1)
    response = FlashMessageAPI.get_message(fm.id)
    expect(response.message).to eq(fm.message)
    FlashMessageAPI.delete_message(fm.id)
  end

  it 'should update a flash message' do
    fm = FlashMessageAPI.create_message(@mess1)
    fm.message = 'New Message'
    response = FlashMessageAPI.update_message(fm)
    expect(response.message).to eq(fm.message)
    FlashMessageAPI.delete_message(fm.id)
  end

  it 'should get all flash messages' do
    fm1 = FlashMessageAPI.create_message(@mess1)
    fm2 = FlashMessageAPI.create_message(@mess2)
    response = FlashMessageAPI.get_all_messages
    expect(response.count).to eq(2)
    FlashMessageAPI.delete_message(fm1.id)
    FlashMessageAPI.delete_message(fm2.id)
  end
end