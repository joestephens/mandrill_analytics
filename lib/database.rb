NoBrainer.configure do |config|
  config.app_name = "mandrill_analytics"
  config.environment = ENV['RACK_ENV']
  config.driver = :regular
  config.durability = :hard
  config.max_string_length = 255
end
