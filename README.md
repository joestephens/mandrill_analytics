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
## Approach
I decided to use Sinatra over Rails for this application, the reason being that Rails seemed unnecessary for such a lightweight project.

I also decided to use RethinkDB as the datastore (using NoBrainer as the Object-Document-Mapper) - this is because Rethink allows for much faster database reads, which is very important considering how much email data will be posted to the database.
