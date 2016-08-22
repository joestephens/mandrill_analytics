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
bundle install
rackup
```
Set your Mandrill Webhooks POST URL to http://localhost:9292/create and visit http://localhost:9292 in your browser window to see the output.

## Configuration
Email types can be added/removed inside lib/models/webhook.rb. Just amend the EMAIL_TYPES constant.

## Approach
I decided to use Sinatra over Rails for this application, the reason being that Rails seemed bloated and unnecessary for such a lightweight project.

I also decided to use RethinkDB as the datastore (using NoBrainer as the Object-Document-Mapper) - this is because Rethink allows for much faster database reads, which is very important considering how much email data will be posted to the database.

It became clear that the Webhooks are set up to post to a URL, so I firstly started by testing a JSON POST request that would submit the data it receives to the datastore, and I then implemented the code for this. I chose to convert the Timestamp seconds to a Ruby Time object, so in future it would be easier to filter through date ranges etc.

I then feature tested the displaying of the statistics, and for every test I wrote another database query within the model for retrieving this data. I've aimed to keep the controller as light as possible, so the model has one method that invokes all of the methods necessary to display information on the home page and returns all of this information to the controller.

## Obstacles
I struggled initially with testing the JSON POST request. Firstly, the Rack::Test post method wasn't calling the controller. I later realised (after going back over the Sinatra rack-test documentation) that this was because I incorrectly set the wrong return value on the app function.

After this, I was struggling with posting in JSON format - I've done it previously in Rails, but in Sinatra it seems to be a bit more fiddly. I later found a blog post that cleared this up.

Upon running RSpec, there are some NoBrainer warning messages. These don't affect the running of the application, but I haven't quite worked out how to silence these yet.

## Possible Features
Features I would add - given additional time - would likely include: charts for displaying of the data in a more visual format; and also the option to see statistics based on date ranges (e.g. in the last week, month, year etc.).
