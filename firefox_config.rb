Capybara.register_driver :firefox do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new

  # Enable Webdriver extension which might be disable in firefox (case of Mac).
  profile['xpinstall.signatures.required'] = false

  # Save downloads automatically to specified folder.
  profile['browser.download.folderList'] = 2
  profile['browser.download.dir'] = File.expand_path(File.join(__dir__, 'tmp/downloads'))
  profile['browser.helperApps.alwaysAsk.force'] = false
  profile['browser.download.manager.showWhenStarting']= false

  # Suppress "open with" dialog
  profile['browser.helperApps.neverAsk.saveToDisk'] = 'application/vnd.ms-excel, text/html'
  Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile)
end

Capybara.configure do |config|
  config.run_server     = false
  config.save_and_open_page_path = File.join(__dir__, 'tmp')
  config.default_driver = :firefox
end