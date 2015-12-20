# Retrieves account history data from kredodirect.com.ua

Capybara and selenium webdriver are used to download .xls reports.

## How to use

### Configure and install dependencies

- Install gems 

        bundle

- Configure environment variables

        cp .env.example .env

- Set real credentials in .env file


### Run from command line

    ruby run.rb


Program exits with the success (0) flag in case file has been downloaded.
Otherwise it exits with the error flag (1).
Success or failure will be also reported to the console with red or green message.
The output .xls file will be saved to the tmp/downloads folder.


### Run in test mode (no connection to real site)

    ruby run.rb --test
or 
    
    ruby run.rb -t
    
## Use within your application
    
    require 'kredodirect/extractor'
    
    extractor = Kredodirect::AccountHistoryExtractor.new
    
    extractor.run
    
    if extractor.success?
      # Do anything you want with the file:
      # copy_to_shared_folder(extractor.file) 
      # send_via_email(extractor.file)
    end
    
## Testing

No internet connection is required to run tests. 

We do not use VCR, instead we use the mock page 'test/test.html' 
which contains links and controls of real pages. 
 
To run tests enter:
 
    ruby spec/extractor_test.rb 
    
We use Minitest, thus `ruby` instead of `rspec`.