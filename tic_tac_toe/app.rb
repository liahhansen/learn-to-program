require 'rubygems'
require 'sinatra'
require 'tic_tac_toe'

$tic_tac_toe = TicTacToe.new

get '/game/:make_move' do
  move_array = params[:make_move].split("-")
  outer_index = move_array[0].to_i
  inner_index = move_array[1].to_i
  player = move_array[2]
  
  $tic_tac_toe.play(outer_index, inner_index, player)
  html_row = ''
  $tic_tac_toe.game_status.each do |row| 
    html_row += '<br>' + row.join(' | ') 
  end 
  "Outer Index: #{outer_index}, Inner Index: #{inner_index}, Player: #{player}, <br> TICTACTOE: <br> #{html_row}"
  
end

# get '/game/:name' do
#   # matches "GET /hello/foo" and "GET /hello/bar"
#   # params[:name] is 'foo' or 'bar'
#   "Hello #{params[:name]}!"
# end
