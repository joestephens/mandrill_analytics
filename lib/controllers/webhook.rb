class MandrillAnalytics < Sinatra::Base
  post '/create' do
    params = JSON.parse(request.body.read)

    webhook = Webhook.create(address: params["Address"],
                   email_type: params["EmailType"],
                   event: params["Event"],
                   timestamp: Time.at(params["Timestamp"]))
  end

  get '/' do
    @data = Webhook.get_data
    erb :index
  end
end
