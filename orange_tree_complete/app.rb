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

get '/' do
  haml :index
end

get '/create' do
  orange_tree = OrangeTree.create!(:age => 0, :height => 0, :fruit => 0  )
  redirect "/orange_tree?id=#{orange_tree.id}"
end

get '/orange_tree' do
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

__END__

@@ layout
!!! Strict
%html{:xmlns => "http://www.w3.org/1999/xhtml", "xml:lang" => "en", :lang => "en"}
  %head
    %title Sinatra URL Shorter
  %body
    #container
      = yield

@@ index
%a{:href => "/create" } Create an Orange Tree

@@ orange_tree
%p Age: #{@orange_tree.age}
%p Height: #{@orange_tree.height}
%p Fruit: #{@orange_tree.fruit}

%p
  %a{:href => "/one_year_passes?id=#{@orange_tree.id}" } Make a year pass
  
- if @orange_tree.age > 4
  %p
    %a{:href => "/pick_orange?id=#{@orange_tree.id}" } Pick orange 
    %p #{@taste}

@@ orange_tree_memorial
%p The orange tree is being integrated back to the earth, but it lived a good life
%p Age: #{@orange_tree.age}
%p Height: #{@orange_tree.height}
