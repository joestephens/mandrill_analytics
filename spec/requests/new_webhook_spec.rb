RSpec.describe MandrillAnalytics, type: :request do
  context 'receiving webhooks from Mandrill' do

    it 'adds a new document to the database' do
      get "/"

      sample_data = {
        "Address": "barney@lostmy.name",
        "EmailType": "Shipment",
        "Event": "send",
        "Timestamp": 1432820696
      }

      post('/create', { "Address":"rehat@lostmy.name","EmailType":"UserConfirmation","Event":"send","Timestamp":1471775553 }.to_json, { "CONTENT-TYPE" => "application/json" })

      expect(Webhook.count).to eq(1)
      expect(Webhook.first.address).to eq("rehat@lostmy.name")
      expect(Webhook.first.email_type).to eq("UserConfirmation")
      expect(Webhook.first.event).to eq("send")
      expect(Webhook.first.timestamp).to eq(Time.at(1471775553))
    end

  end

end
