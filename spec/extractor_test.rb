require_relative 'spec_helper'
describe Kredodirect::Extractor do

  it 'extracts an xls file' do
    extractor = Kredodirect::Extractor.new(
      url: 'file://' + File.join(__dir__, '../test/test.html'),
      downloads_folder: File.join(__dir__, '../tmp/downloads'))

    extractor.run

    extractor.file.wont_be_nil
  end
end