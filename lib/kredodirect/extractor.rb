require 'capybara/dsl'
module Kredodirect
  class Extractor
    include Capybara::DSL

    def run
      visit '/'
      fill_in('client_id', with: '')
      fill_in('password', with: '')
      find('.login_content .div_content table tr td table tr td input').click


      click_link('Поточний рахунок')
      click_link('Історія рахунку')
      click_link('Експорт в Excel')

      # Read more of capybara functions here
      # https://github.com/jnicklas/capybara#clicking-links-and-buttons
      # click_link('')
      #save_and_open_page
      data = page.driver.html.force_encoding('utf-8')
      File.binwrite('tmp/page.xls', data)
    end
  end
end
