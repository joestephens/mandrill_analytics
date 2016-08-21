class MandrillAnalytics < Sinatra::Base
  post '/create' do
    params = JSON.parse(request.body.read)

    webhook = Webhook.new(address: params["Address"],
                   email_type: params["EmailType"],
                   event: params["Event"],
                   timestamp: Time.at(params["Timestamp"]))

    webhook.save!
  end
end
