# RubyAutomation
1. Setting Up Ruby and RubyMine
Install Ruby:

- Download and install Ruby from the official Ruby website.
- Verify the installation by running ruby -v in your terminal.

2.Install RubyMine:

- Download RubyMine from the JetBrains website.
- Install RubyMine following the installation instructions for your operating system.

3. Clone project from GitHub
4. Install the RSpec framework via the terminal: gem install rspec
5. Install Bundle: gem install bundler
6. Install gems: bundle install
7. Initialize RSpec: bundle exec rspec --init
8. Setup ChromeDriver:
Download ChromeDriver: https://sites.google.com/a/chromium.org/chromedriver/downloads.
Extract the ChromeDriver executable
Add ChromeDriver to PATH:
- Open File Explorer and navigate to the directory where you extracted the ChromeDriver executable.
- Copy the path to this directory.
- Search for "Environment Variables" in the Start menu and open the "Edit the system environment variables" option.
- In the System Properties window, click on the "Environment Variables" button.
- In the Environment Variables window, under "System variables", find the "Path" variable and click "Edit".
- Click "New" and paste the path to the directory containing ChromeDriver.
- Click "OK" to save the changes and close all windows.
- Restart your computer to apply the changes.
- Verify installation: chromedriver --version
