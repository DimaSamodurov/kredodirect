require 'capybara/dsl'
module Kredodirect
  class Extractor
    include Capybara::DSL

    def run
      visit '/'
      fill_in('client_id', with: username)
      fill_in('password', with: password)
      find('.login_content .div_content table tr td table tr td input').click

      click_link('Поточний рахунок')
      click_link('Історія рахунку')
      click_link('Експорт в Excel')

      # Wait for download complete
      sleep 5
    end

    private

    def username
      ENV.fetch('KREDO_USER') do
        'KREDO_USER environment variable is not set.'
      end
    end

    def password
      ENV.fetch('KREDO_PASS') do
        'KREDO_PASS environment variable is not set.'
      end
    end
  end
end
