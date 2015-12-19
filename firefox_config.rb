Capybara.register_driver :firefox do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new

  # Enable Webdriver extension which might be disable in firefox (case of Mac).
  profile['xpinstall.signatures.required'] = false

  # Save downloads automatically to specified folder.
  profile['browser.download.folderList'] = 2
  profile['browser.download.dir'] = File.expand_path(File.join(__dir__, 'tmp/download'))
#  profile['browser.helperApps.alwaysAsk.force'] = false
#  profile['browser.download.manager.showWhenStarting']= false

  # Suppress "open with" dialog
  profile['browser.helperApps.neverAsk.saveToDisk'] = 'application/vnd.ms-excel'
  Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile)
end