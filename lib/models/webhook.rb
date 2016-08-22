class Webhook
  include NoBrainer::Document

  field :address, type: String
  field :email_type, type: String
  field :event, type: String
  field :timestamp, type: Time

  EMAIL_TYPES = {
    shipment: "Shipment",
    user_confirmation: "UserConfirmation",
    order: "Order",
    get_a_book_discount: "GetABookDiscount",
    refer_a_friend: "ReferAFriend"
  }

  def self.get_data
    {
      total_number_of_emails: total_number_of_emails,
      total_number_of_emails_opened: total_number_of("open"),
      total_number_of_clicks: total_number_of("click"),
      open_rate_per_email_type: open_rate_per_email_type,
      click_rate_per_email_type: click_rate_per_email_type
    }
  end

  private

  def self.total_number_of_emails
    self.count
  end

  def self.total_number_of(event)
    self.where(event: event).length
  end

  def self.open_rate_per_email_type
    event_rate_per_email_type("open")
  end

  def self.click_rate_per_email_type
    event_rate_per_email_type("click")
  end

  def self.event_rate_per_email_type(event)
    event_rates = {}

    EMAIL_TYPES.each do |k, v|
      event_rates[k] = self.where(event: event, email_type: v).length
    end

    event_rates
  end

end
