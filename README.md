# heroku-invoice

publish invoice on your heroku account.

## Installation

    $ heroku plugins:install https://github.com/hsbt/heroku-invoice.git

## Usage

    # publish current invoice.
    $ heroku invoice --app myapp
    # publish 2012/3 invoice.
    $ heroku invoice 201203 -app myapp
    # publish pdf (use wkhtmltopdf)
    $ heroku invoice:pdf --app myapp
