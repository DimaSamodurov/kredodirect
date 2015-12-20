require 'dotenv'
Dotenv.load File.join(__dir__, '../.env.example')

$LOAD_PATH.unshift(File.join(__dir__, '../lib'),
                   File.join(__dir__, '..'))

require 'kredodirect'

require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/reporters'
Minitest::Reporters.use!(Minitest::Reporters::SpecReporter.new)

