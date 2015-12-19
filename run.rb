require 'bundler'
Bundler.require(:default)
$LOAD_PATH.unshift('lib', '.')

require 'firefox_config'
require 'kredodirect/extractor'

Capybara.configure do |config|
  config.app_host       = 'https://www.kredodirect.com.ua'
  config.run_server     = false
  config.save_and_open_page_path = File.join(__dir__, 'tmp')
  config.default_driver = :firefox
end

extractor = Kredodirect::Extractor.new
extractor.run

