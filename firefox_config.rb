Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile['browser.download.dir'] = '/tmp'
  profile['browser.download.folderList'] = 2
  profile["browser.helperApps.alwaysAsk.force"] = false
  profile["browser.download.manager.showWhenStarting"]= false

  # Suppress "open with" dialog
  profile['browser.helperApps.neverAsk.saveToDisk'] = ''
  Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile)
end