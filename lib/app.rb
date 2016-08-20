ENV['RACK_ENV'] ||= 'production'

require 'sinatra/base'
require 'nobrainer'

require_relative 'database'
require_relative 'helpers'
require_relative 'server'

require_relative 'models/webhook'
require_relative 'controllers/webhook'
