require 'capybara/dsl'
module Kredodirect
  class Extractor
    include Capybara::DSL

    attr_reader :url, :downloads_folder

    def initialize(url:, downloads_folder:)
      @url = url
      @downloads_folder = downloads_folder
      @existing_files = files

      configure_firefox
    end

    def run
      visit url
      fill_in('client_id', with: username)
      fill_in('password', with: password)
      find('.login_content .div_content table tr td table tr td input').click

      click_link('Поточний рахунок')
      click_link('Історія рахунку')
      click_link('Експорт в Excel')

      wait_for_download_complete(timeout: 10)
    end

    def files
      Dir.glob(File.join(@downloads_folder, '*.xls'))
    end

    def file
      (files - @existing_files).first
    end

    private

    def wait_for_download_complete(timeout:)
      t = Time.now
      while Time.now < t + timeout
        break if file
        sleep 0.5
      end
    end

    def username
      ENV.fetch('KREDO_USER') do
        raise 'KREDO_USER environment variable is not set.'
      end
    end

    def password
      ENV.fetch('KREDO_PASS') do
        raise 'KREDO_PASS environment variable is not set.'
      end
    end

    def configure_firefox
      Capybara.register_driver :firefox_kredodirect do |app|
        profile = Selenium::WebDriver::Firefox::Profile.new

        # Enable Webdriver extension which might be disable in firefox (case of Mac).
        profile['xpinstall.signatures.required'] = false

        # Save downloads automatically to specified folder.
        profile['browser.download.folderList'] = 2
        profile['browser.download.dir'] = @downloads_folder

        # Suppress "open with" dialog
        profile['browser.helperApps.neverAsk.saveToDisk'] = 'application/vnd.ms-excel, text/html'
        Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile)
      end

      Capybara.configure do |config|
        config.run_server     = false
        config.default_driver = :firefox_kredodirect
      end
    end
  end
end
