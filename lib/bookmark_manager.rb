# require 'sinatra/base'
# require 'server'
# require 'link'

# class Bookmark_Manager < Sinatra::Base

# 	set :views, Proc.new { File.join(root, "..", "views") }


#   get '/' do
#     @links = Link.all
#     erb :index
#   end

#   # start the server if ruby file executed directly
#   run! if app_file == $0
# end
