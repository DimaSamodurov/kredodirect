require 'slop'
require 'rainbow'
module Kredodirect
  class Application
    def run
      opts = Slop.parse do |o|
        o.bool '--test', '-t', 'Test mode'
        o.string '--output', '-o', 'Output folder',
                 default: File.expand_path(File.join(__dir__, '../../tmp/downloads'))
        o.string '--url', '-url', 'Site url', default: nil
      end

      if opts[:test] && opts[:url]
        railse 'Please specify either --test or --url option, not both.'
      end

      if opts[:test]
        puts Rainbow('Running in test mode.').blue
        url = 'file://' + File.join(__dir__, '../../test/test.html')
      else
        url = 'https://kredodirect.com.ua'
      end

      if opts[:url]
        url = opts[:url]
      end

      extractor = Kredodirect::AccountHistoryExtractor.new(
        url: url,
        downloads_folder: opts[:output])

      extractor.run

      if extractor.success?
        puts Rainbow("Success. Downloaded file: #{extractor.file}").green
        exit 0
      else
        puts Rainbow('Error. No file has been downloaded.').red
        exit 1
      end
    end
  end
end