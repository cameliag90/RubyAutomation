# frozen_string_literal: true

require 'selenium-webdriver'
require 'rspec'
require_relative '../configuration/helpers'

describe 'Login Page Elements' do
  before(:all) do
    @driver = WebDriverConfig.setup
    @driver.get 'https://www.saucedemo.com/'
  end

  after(:all) do
    @driver&.quit
  end

  it 'should display the login title' do
    login_title = @driver.find_element(class: 'login_logo')
    expect(login_title.displayed?).to eq(true)
    expect(login_title.text).to include('Swag Labs')
  end

  it 'should display the username field' do
    username_field = @driver.find_element(id: 'user-name')
    expect(username_field.displayed?).to eq(true)
    expect(username_field.attribute('placeholder')).to eq('Username')
  end

  it 'should display the password field' do
    password_field = @driver.find_element(id: 'password')
    expect(password_field.displayed?).to eq(true)
    expect(password_field.attribute('placeholder')).to eq('Password')
  end

  it 'should display the login button' do
    login_button = @driver.find_element(id: 'login-button')
    expect(login_button.displayed?).to eq(true)
    expect(login_button.attribute('disabled')).to eq(nil)
    expect(login_button.attribute('value')).to eq('Login')
    expect(login_button.attribute('style').include?('background-color: #3ddc91'))
  end

  it 'should display the login credentials information dialog' do
    login_credentials = @driver.find_element(class: 'login_credentials')
    expect(login_credentials.displayed?).to eq(true)
    expect(login_credentials.text).to include('Accepted usernames are:')
    expect(login_credentials.text).to include('standard_user')
    expect(login_credentials.text).to include('locked_out_user')
    expect(login_credentials.text).to include('problem_user')
    expect(login_credentials.text).to include('performance_glitch_user')
    expect(login_credentials.text).to include('error_user')
    expect(login_credentials.text).to include('visual_user')
    password = @driver.find_element(class: 'login_password')
    expect(password.displayed?).to eq(true)
    expect(password.text).to include('Password for all users:')
    expect(password.text).to include('secret_sauce')
  end
end
