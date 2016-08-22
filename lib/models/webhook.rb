class Webhook
  include NoBrainer::Document

  field :address, type: String
  field :email_type, type: String
  field :event, type: String
  field :timestamp, type: Time

  def self.get_data
    return {
      total_number_of_emails: total_number_of_emails,
      total_number_of_emails_opened: total_number_of_emails_opened,
      total_number_of_clicks: total_number_of_clicks,
      open_rate_per_email_type: open_rate_per_email_type
    }
  end

  private

  def self.total_number_of_emails
    self.count
  end

  def self.total_number_of_emails_opened
    self.where(event: "open").length
  end

  def self.total_number_of_clicks
    self.where(event: "click").length
  end

  def self.open_rate_per_email_type
    email_types = {
      shipment: "Shipment",
      user_confirmation: "UserConfirmation",
      order: "Order",
      get_a_book_discount: "GetABookDiscount",
      refer_a_friend: "ReferAFriend"
    }

    open_rates = {}

    email_types.each do |k, v|
      p k
      p v
      open_rates[k] = self.where(event: "open", email_type: v).length
    end

    open_rates
  end

end
