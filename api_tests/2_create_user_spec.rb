# frozen_string_literal: true

require 'rspec'
require 'httparty'
require 'json-schema'
require 'date'

describe 'Create new user' do
  before :all do
    @endpoint = 'https://reqres.in'
    @body = {
      name: 'John Doe',
      job: 'Software Developer'
    }
  end

  context 'Send Post request' do
    before :all do
      $response = HTTParty.post("#{@endpoint}/api/users", body: @body.to_json)
      expect($response.code).to eql 201
    end

    it 'Check the id field' do
      expect($response['id']).not_to be_nil
      expect($response['id']).to be_a String
    end

    it 'Check the createdAt field' do
      expect($response['createdAt']).not_to be_nil
      created_at = DateTime.parse($response['createdAt']).new_offset(0) # Parse and convert to UTC
      current_time_utc = DateTime.now.new_offset(0) # Current time in UTC
      expect(created_at.to_date).to eq(current_time_utc.to_date)
    end

    it 'Check response time against the limit' do
      start_time = Time.now
      $response = HTTParty.post("#{@endpoint}/api/users", body: @body.to_json,
                                                          headers: { 'Content-Type' => 'application/json' })
      end_time = Time.now

      # Calculate the response time in milliseconds
      response_time_ms = (end_time - start_time) * 1000

      # Define the limit for response time
      limit_ms = 300

      # Assert that the response time is less than the limit
      expect(response_time_ms).to be < limit_ms
    end

    it 'Check the name and job parameters sent against the response ' do
      expect($response['name']).to eq(@body[:name])
      expect($response['job']).to eq(@body[:job])
    end

    it 'Validates the response structure and data types' do
      # Define the JSON schema for response validation
      response_schema = {
        'type' => 'object',
        'required' => %w[name job id createdAt],
        'properties' => {
          'name' => { 'type' => 'string' },
          'job' => { 'type' => 'string' },
          'id' => { 'type' => 'string' },
          'createdAt' => { 'type' => 'string', 'format' => 'date-time' }
        }
      }
      JSON::Validator.validate!(response_schema, $response.body)
    end
  end
end
