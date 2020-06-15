require_relative 'routes'
require_relative 'params'
require_relative 'app'
require 'cgi'

use Routes
use Params
run App.new
