require_relative 'spec_helper'
describe Kredodirect::AccountHistoryExtractor do

  it 'extracts an xls file' do
    extractor = Kredodirect::AccountHistoryExtractor.new(
      url: 'file://' + File.join(__dir__, '../test/test.html'))

    extractor.run

    extractor.file.wont_be_nil
  end
end