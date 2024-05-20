# frozen_string_literal: true

require 'selenium-webdriver'

module WebDriverConfig
  def self.setup
    options = Selenium::WebDriver::Chrome::Options.new
    # options.add_argument('--headless') - remove the comment if you don't want to see the browser
    @driver = Selenium::WebDriver.for :chrome, options: options
  end
end
