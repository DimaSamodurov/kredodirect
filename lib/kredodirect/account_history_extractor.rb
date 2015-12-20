require 'capybara/dsl'
require 'tmpdir'
module Kredodirect
  # Retrieves account history xls file from kredodirect.com.ua
  class AccountHistoryExtractor
    include Capybara::DSL

    attr_reader :url, :downloads_folder

    def initialize(url: 'https://kredodirect.com.ua/', downloads_folder: nil)
      @url = url
      @downloads_folder = downloads_folder || Dir.tmpdir
      @existing_files = files
    end

    def run
      Config.configure_firefox(@downloads_folder)

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

    def success?
      !file.nil?
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
  end
end
