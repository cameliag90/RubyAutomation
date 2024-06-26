# RubyAutomation

1. Setting Up Ruby and RubyMine
   Install Ruby:

- Download and install Ruby from the official Ruby website.
- Verify the installation by running ruby -v in your terminal.

2. Install RubyMine:

- Download RubyMine from the JetBrains website.
- Install RubyMine following the installation instructions for your operating system.

3. Clone project from GitHub:
- Open RubyMine
- Go to Git tab and select Clone
- Fill in the URL with: https://github.com/cameliag90/RubyAutomation.git
- Click clone
5. Install the RSpec framework via the terminal: gem install rspec
6. Install Bundle: gem install bundler
7. Install gems: bundle install
8. Initialize RSpec: bundle exec rspec --init
9. Setup ChromeDriver:
   Download ChromeDriver: https://sites.google.com/a/chromium.org/chromedriver/downloads.
   Extract the ChromeDriver executable
   Add ChromeDriver to PATH:
   @@ -28,3 +33,7 @@ Add ChromeDriver to PATH:
- Click "OK" to save the changes and close all windows.
- Restart your computer to apply the changes.
- Verify installation: chromedriver --version
10. Run test cases
- rspec path_to_test - for one test (ex: rspec frontend_tests/1_check_login_page_elements_spec.rb )
- rspec path_to_tests_directory - for all tests in a directory (ex:  rspec api_tests  or  rspec frontend_tests)