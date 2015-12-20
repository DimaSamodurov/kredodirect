require 'bundler'
Bundler.require(:default)
Dotenv.load
$LOAD_PATH.unshift('lib', '.')

require 'kredodirect/account_history_extractor'

opts = Slop.parse do |o|
  o.bool '--test', '-t', 'Test mode'
end

if opts[:test]
  puts Rainbow('Running in test mode.').blue
  url = 'file://' + File.join(__dir__, 'test/test.html')
else
  url = 'https://kredodirect.com.ua/'
end

extractor = Kredodirect::AccountHistoryExtractor.new(
  url: url,
  downloads_folder: File.join(__dir__, 'tmp/downloads'))

extractor.run

if extractor.success?
  puts Rainbow("Success. Downloaded file: #{extractor.file}").green
  exit 0
else
  puts Rainbow('Error. No file has been downloaded.').red
  exit 1
end
