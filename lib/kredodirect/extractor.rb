require 'capybara/dsl'
module Kredodirect
  class Extractor
    include Capybara::DSL

    def run
      visit '/'
      fill_in('client_id', with: 'John')
      fill_in('password', with: 'pass')
      find('.login_content .div_content table tr td table tr td input').click

      save_and_open_screenshot

      # Read more of capybara functions here
      # https://github.com/jnicklas/capybara#clicking-links-and-buttons
      # click_link('')
      
      File.write('tmp/page.html', page.html)
    end
  end
end
