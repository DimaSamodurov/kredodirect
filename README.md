# Retrieves accounting data from kredodirect.com.ua

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
    
