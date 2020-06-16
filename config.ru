require_relative 'time_formatter'
require_relative 'routes'
require_relative 'app'
require 'cgi'

use Routes
run App.new
