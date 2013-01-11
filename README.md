# heroku-invoice

publish invoice on your heroku account.

## Installation

```
$ heroku plugins:install https://github.com/hsbt/heroku-invoice.git
```

## Usage

```
$ heroku invoice # publish current invoice.
$ heroku invoice 201203 # publish 2012/3 invoice.
$ heroku invoice:pdf # publish pdf (use wkhtmltopdf)
```
