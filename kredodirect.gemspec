# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kredodirect/version'

Gem::Specification.new do |spec|
  spec.name          = 'kredodirect'
  spec.version       = Kredodirect::VERSION
  spec.authors       = ['Dima Samodurov']
  spec.email         = ['dimasamodurov@gmail.com']
  spec.licenses      = ['MIT']
  spec.summary       = 'kredodirect.com.ua data extractor'
  spec.description   = %q{Retrieves account history data from kredodirect.com.ua using Capybara}
  spec.homepage      = 'http://github.com/dimasamodurov/kredodirect'

  spec.files         = Dir.glob("{lib,spec,bin}/**/*") + %w(README.md LICENSE)
  spec.bindir        = 'bin'
  spec.executables   << 'kredodirect'
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'capybara', '~> 2.1'
  spec.add_runtime_dependency 'selenium-webdriver', '~> 2.0'
  spec.add_runtime_dependency 'dotenv', '~> 2.0'
  spec.add_runtime_dependency 'rainbow', '~> 2.0'
  spec.add_runtime_dependency 'slop', '~> 4.2'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.8'
  spec.add_development_dependency 'minitest-reporters', '~> 1.1'
  spec.add_development_dependency 'pry'
end
