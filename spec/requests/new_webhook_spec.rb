RSpec.describe WebhookController, type: :request do

  context 'receiving webhooks from Mandrill' do

    it 'adds a new document to the database' do
      sample_data = {
        "Address": "barney@lostmy.name",
        "EmailType": "Shipment",
        "Event": "send",
        "Timestamp": 1432820696
      }

      post '/create', params: { data: sample_data, format: :json }

      expect(Webhook.count).to eq(1)
      expect(Webhook.first.address).to eq(sample_data["Address"])
      expect(Webhook.first.email_type).to eq(sample_data["EmailType"])
      expect(Webhook.first.event).to eq(sample_data["Event"])
      expect(Webhook.first.timestamp).to eq(sample_data["Timestamp"])
    end

  end

end
