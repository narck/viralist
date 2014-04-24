viralist [![Build Status](https://api.travis-ci.org/narck/viralist.png)](https://travis-ci.org/narck/viralist)
========

**viralist** keeps track of your company visitations. It's a small ERP-type app to record where you've been having a visit, for situations where you would for example keep track when you have delivered some goods to a store and need to do it often within a schedule.

## Data model


Usage
========

## Running **viralist**
You will need `rails 4` and preferrably `ruby 2.0.0p353` (both tested, newer versions should work just as well).

After installing these, you can simply clone this repository with `git clone https://narck/viralist`.
Next run:

```shell
bundle install
rake db:migrate
rails s
```

## Using the mailer
The app features an ActionMailer implementation to inform subscribed users of stores of their visitation status, in case their visitation threshold goes above limit. By default it is configured to use SMTP, with the following environment variables:

* MSENDER - The "sender" name (for servers where you need to check if sender address is owned by the host/domain)
* MUSERNAME - The account username you wish to relay from
* MPASSWORD - The password for the user above
* MDOMAIN - Domain from which the mail will be sent from
* MADDRESS - Address of the SMTP server

## Rufus
The mailer works mainly with a rufus schedule, located in `app/config/initializers/task_scheduler.rb`

Notable features:
========
* Visitation tracking
* AngularJS dashboard, visitation search
* Mailer
* Google Maps integration