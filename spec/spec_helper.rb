require 'bundler'
Bundler.require(:default, :test)
Dotenv.load File.join(__dir__, '../.env.example')
$LOAD_PATH.unshift(File.join(__dir__, '../lib'),
                   File.join(__dir__, '..'))
require 'minitest/autorun'
require 'minitest/spec'
require "minitest/reporters"
Minitest::Reporters.use!
require 'kredodirect/extractor'
require 'config/firefox_config'
