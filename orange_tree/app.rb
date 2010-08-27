require 'rubygems'
require 'sinatra'
require 'active_record'
require 'haml'
require 'orange_tree'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :dbfile =>  'db/sinatra.sqlite3.db.sqlite',
  :host => "localhost",
  :username => "root",
  :password => "root"  
)

before do
  content_type "text/html", :charset => "utf-8"
end

get '/' do
  haml :index
end

get '/create' do
  orange_tree = OrangeTree.create!(:age => 0, :height => 0, :fruit => 0)
  redirect "/orange_tree?id=#{orange_tree.id}"
end

get '/orange_tree/:id' do
  @orange_tree = OrangeTree.find(params[:id])
  @taste = params[:taste] == nil ? "" : params[:taste]
  if @orange_tree.alive?
    haml :orange_tree
  else
    haml :orange_tree_memorial
  end
end

get '/one_year_passes' do
  orange_tree = OrangeTree.find(params[:id])
  if orange_tree.alive?
    orange_tree.one_year_passes
    orange_tree.save
    redirect "/orange_tree?id=#{orange_tree.id}"
  else
    redirect "/orange_tree?id=#{orange_tree.id}&condition=dead"
  end
end

get '/pick_orange' do
  orange_tree = OrangeTree.find(params[:id])
  taste = orange_tree.pick_orange
  orange_tree.save
  redirect "/orange_tree?id=#{orange_tree.id}&taste=#{taste}"
end