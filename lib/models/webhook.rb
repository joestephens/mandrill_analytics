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
      total_number_of_clicks: total_number_of_clicks
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

end
