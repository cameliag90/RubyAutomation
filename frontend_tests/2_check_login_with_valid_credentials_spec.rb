# frozen_string_literal: true

require 'selenium-webdriver'
require 'rspec'
require_relative '../configuration/helpers'

describe 'Login with valid credentials' do
  before(:all) do
    @driver = WebDriverConfig.setup
    @driver.get 'https://www.saucedemo.com/'
  end
  after(:all) do
    @driver&.quit
  end

  it 'should log in successfully with valid credentials' do
    # Create a new wait instance with a timeout of 10 seconds
    wait = Selenium::WebDriver::Wait.new(timeout: 20)
    # wait until the elements are found and store them
    username_field = wait.until { @driver.find_element(id: 'user-name') }
    password_field = wait.until { @driver.find_element(id: 'password') }
    login_button = wait.until { @driver.find_element(id: 'login-button') }

    username_field.send_keys 'standard_user'
    password_field.send_keys 'secret_sauce'
    login_button.click

    wait.until { (@driver.current_url == 'https://www.saucedemo.com/inventory.html') }
  end
end
