# Mandrill Analytics
A web application that receives Mandrill webhooks, stores the data in a RethinkDB database, and groups that data into helpful statistics.

## Installation / Usage
```
git clone https://github.com/joestephens/mandrill_analytics.git
cd mandrill_analytics
brew update && brew install rethinkdb
rethinkdb
```
In a separate terminal window:
```
cd mandrill_analytics
ruby lib/app.rb
```
