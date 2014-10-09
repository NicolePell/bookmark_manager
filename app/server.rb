require 'data_mapper'
require 'sinatra'
require 'rack-flash'
require 'sinatra/partial'

# However, the database tables don't exist yet. Let's tell datamapper to create them

# require_relative 'models/link'
# require_relative 'models/user'
# require_relative 'models/tag'
require_relative 'helpers/application'

require_relative 'controllers/application'
require_relative 'controllers/links'
require_relative 'controllers/sessions'
require_relative 'controllers/tags'
require_relative 'controllers/users'

require_relative 'data_mapper_setup'

DataMapper.auto_upgrade!

	enable :sessions
	set :session_secret, 'super secret'
	use Rack::Flash, :sweep => true
	set :partial_template_engine, :erb
 	set :root, File.dirname(__FILE__)