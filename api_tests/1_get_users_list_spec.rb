# frozen_string_literal: true

require 'rspec'
require 'httparty'
require 'json-schema'

describe 'Get user list' do
  before :all do
    @endpoint = 'https://reqres.in'
  end
  context 'Send Get request' do
    before :all do
      $response = HTTParty.get("#{@endpoint}/api/users?page=2")
      expect($response.code).to eq 200
    end
    it 'Check the totals field' do
      expect($response).to have_key('total')
      expect($response['total']).to be_an Integer
      expect($response['total']).to eq 12
    end
    it 'Check the last_name of the first user' do
      expect($response['data'][0]).to have_key('last_name')
      expect($response['data'][0]['last_name']).to be_a String
      expect($response['data'][0]['last_name']).to eq 'Lawson'
    end
    it 'Check the last_name of the second user' do
      expect($response['data'][1]).to have_key('last_name')
      expect($response['data'][1]['last_name']).to be_a String
      expect($response['data'][1]['last_name']).to eq 'Ferguson'
    end
    it 'Compare count users to totals' do
      expect($response['data']).to be_an_instance_of(Array)
      expect($response['data'].size).not_to eq $response['total']
    end
    it 'Check data types of fields' do
      # Check the presence of keys
      expect($response).to have_key('page')
      expect($response).to have_key('per_page')
      expect($response).to have_key('total')
      expect($response).to have_key('total_pages')
      expect($response).to have_key('data')
      expect($response['data']).to be_an_instance_of(Array)
      $response['data'].each do |user|
        expect(user).to have_key('id')
        expect(user).to have_key('email')
        expect(user).to have_key('first_name')
        expect(user).to have_key('last_name')
        expect(user).to have_key('avatar')
      end

      # Validate the data types
      expect($response['page']).to be_an(Integer)
      expect($response['per_page']).to be_an(Integer)
      expect($response['total']).to be_an(Integer)
      expect($response['total_pages']).to be_an(Integer)
      $response['data'].each do |user|
        expect(user['id']).to be_an(Integer)
        expect(user['email']).to be_a(String)
        expect(user['first_name']).to be_a(String)
        expect(user['last_name']).to be_a(String)
        expect(user['avatar']).to be_a(String)
      end
    end
  end
end
