NoBrainer.configure do |config|
  config.app_name = "mandrill_analytics"

  config.environment = ENV['RACK_ENV']

  config.rethinkdb_urls = [config.default_rethinkdb_url]

  config.ssl_options = nil

  config.driver = :regular

  config.logger = config.default_logger

  config.colorize_logger = true

  config.warn_on_active_record = true

  config.durability = config.default_durability

  config.table_options = \
    { :shards => 1, :replicas => 1, :write_acks => :majority }

  config.max_string_length = 255

  config.user_timezone = :local

  config.db_timezone = :unchanged

  config.geo_options = { :geo_system => 'WGS84', :unit => 'm' }

  config.distributed_lock_class = "NoBrainer::Lock"

  config.lock_options = { :expire => 60, :timeout => 10 }

  config.per_thread_connection = false

  config.machine_id = config.default_machine_id

  config.criteria_cache_max_entries = 10_000
end
