class Webhook
  include NoBrainer::Document

  field :address, type: String
  field :email_type, type: String
  field :event, type: String
  field :timestamp, type: Time

  def self.get_data
    return {
      total_number_of_emails: total_number_of_emails
    }
  end

  def self.total_number_of_emails
    self.count
  end
end
