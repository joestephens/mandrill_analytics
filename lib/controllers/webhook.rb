class MandrillAnalytics < Sinatra::Base
  post '/create' do
    Webhook.add(request.body.read)
  end

  get '/' do
    @data = Webhook.get_data
    erb :index
  end
end
