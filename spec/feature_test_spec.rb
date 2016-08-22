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
    params = {
      address: "barney@lostmy.name",
      email_type: "Shipment",
      event: "click",
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
    expect(page).to have_content("Total number of clicks: 2")
  end

  it 'should have open rate per email type' do
    2.times do
      Webhook.create(
        address: "barney@lostmy.name",
        email_type: "Shipment",
        event: "open",
        timestamp: Time.at(1432820696)
      )
    end

    3.times do
      Webhook.create(
        address: "barney@lostmy.name",
        email_type: "UserConfirmation",
        event: "open",
        timestamp: Time.at(1432820696)
      )
    end

    5.times do
      Webhook.create(
        address: "barney@lostmy.name",
        email_type: "Order",
        event: "open",
        timestamp: Time.at(1432820696)
      )
    end

    7.times do
      Webhook.create(
        address: "barney@lostmy.name",
        email_type: "GetABookDiscount",
        event: "open",
        timestamp: Time.at(1432820696)
      )
    end

    Webhook.create(
      address: "barney@lostmy.name",
      email_type: "ReferAFriend",
      event: "open",
      timestamp: Time.at(1432820696)
    )

    expect(page).to have_content("Open rate per email type")
    expect(page).to have_content("Shipment: 2")
    expect(page).to have_content("UserConfirmation: 3")
    expect(page).to have_content("Order: 5")
    expect(page).to have_content("GetABookDiscount: 7")
    expect(page).to have_content("ReferAFriend: 1")
  end

  it 'should have click rate per email type' do

  end
end
