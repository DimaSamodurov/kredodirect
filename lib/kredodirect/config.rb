require 'selenium-webdriver'
module Kredodirect
  module Config

    module_function

    def configure_firefox(downloads_folder)
      Capybara.register_driver :firefox_kredodirect do |app|
        profile = ::Selenium::WebDriver::Firefox::Profile.new

        # Enable Webdriver extension which might be disable in firefox (case of Mac).
        profile['xpinstall.signatures.required'] = false

        # Save downloads automatically to specified folder.
        profile['browser.download.folderList'] = 2
        profile['browser.download.dir'] = downloads_folder

        # Suppress "open with" dialog
        profile['browser.helperApps.neverAsk.saveToDisk'] = 'application/vnd.ms-excel, text/html'
        Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile)
      end

      Capybara.configure do |config|
        config.run_server     = false
        config.current_driver = :firefox_kredodirect
      end
    end
  end
end