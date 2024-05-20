# frozen_string_literal: true

require 'selenium-webdriver'
require 'rspec'
require_relative '../configuration/helpers'

describe 'Login with locked user' do
  before(:all) do
    # initialize driver
    @driver = WebDriverConfig.setup
    @driver.get 'https://www.saucedemo.com/'
    # Create a new wait instance with a timeout of 10 seconds
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    # wait until the elements are found and store them
    @username_field = wait.until { @driver.find_element(id: 'user-name') }
    @password_field = wait.until { @driver.find_element(id: 'password') }
    @login_button = wait.until { @driver.find_element(id: 'login-button') }

    # Perform login action
    @username_field.send_keys 'locked_out_user'
    @password_field.send_keys 'secret_sauce'
    @login_button.click
  end

  after(:all) do
    @driver&.quit
  end

  context 'Locked Username' do
    it 'should display an error message' do
      # Verify that an error message is displayed
      error_message = @driver.find_element(class: 'error-message-container')
      expect(error_message.text).to eq('Epic sadface: Sorry, this user has been locked out.')

      # Verify that the "X" button is displayed on the error message
      error_button = @driver.find_element(class: 'error-button')
      expect(error_button.displayed?).to be true
    end

    it 'should display the error icons next to the username and password fields' do
      error_icons = @driver.find_elements(class: 'error_icon')
      expect(error_icons.size).to eq(2)
      error_icons.each { |icon| expect(icon.displayed?).to be true }
    end

    it 'should check that the fields contain the entered values' do
      expect(@username_field.attribute('value')).to eq('locked_out_user')
      expect(@password_field.attribute('value')).to eq('secret_sauce')
    end
    it "should check that the error message and error icons disappears after clicking the 'X' button" do
      error_button = @driver.find_element(class: 'error-button')
      error_button.click

      # Wait for the error message to disappear
      wait = Selenium::WebDriver::Wait.new(timeout: 30)
      wait.until { @driver.find_elements(css: 'h3').none? }

      # Verify that the error message is no longer displayed
      error_message = @driver.find_elements(css: 'h3')
      expect(error_message.empty?).to be true

      # Verify that the error icons are no longer displayed
      error_icons = @driver.find_elements(class: 'error_icon')
      expect(error_icons.size).to eq(0)
      error_icons.each { |icon| expect(icon.displayed?).to be false }
    end
  end
end
