require 'rubygems'
require 'sinatra'
require 'active_record'
require 'haml'
require 'orange_tree'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :dbfile =>  'db/sinatra.sqlite3.db',
  :host => "localhost",
  :username => "root",
  :password => "root"  
)

before do
  content_type "text/html", :charset => "utf-8"
end
