RSpec.describe 'Analytics page' do
  it 'should have total number of emails sent' do
    params = {
      address: "barney@lostmy.name",
      email_type: "Shipment",
      event: "send",
      timestamp: 1432820696
    }

    2.times do
      Webhook.create(
        address: params[:address],
        email_type: params[:email_type],
        event: params[:event],
        timestamp: Time.at(params[:timestamp])
      )
    end

    visit '/'

    expect(page).to have_content("Total number of emails sent: 2")
  end

  it 'should have total number of emails opened' do
    params = {
      address: "barney@lostmy.name",
      email_type: "Shipment",
      event: "open",
      timestamp: 1432820696
    }

    2.times do
      Webhook.create(
        address: params[:address],
        email_type: params[:email_type],
        event: params[:event],
        timestamp: Time.at(params[:timestamp])
      )
    end

    Webhook.create(
      address: params[:address],
      email_type: params[:email_type],
      event: "send",
      timestamp: Time.at(params[:timestamp])
    )

    visit '/'

    expect(page).to have_content("Total number of emails sent: 3")
    expect(page).to have_content("Total number of emails opened: 2")
  end

  it 'should have total number of clicks' do

  end

  it 'should have open rate per email type' do

  end

  it 'should have click rate per email type' do

  end
end
