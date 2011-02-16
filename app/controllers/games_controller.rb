class GamesController < ApplicationController
  
  respond_to :html, :xml, :json
  
  # create new number and go to index
  def create
	session[:new_number] = play_roulette
  	Game.new(:number => session[:new_number]).save
	 
	redirect_to games_path
  end
  
  
  def index   
    #getting last generated number from session after redirect and remove value from session
    @new_number = session[:new_number]
	session[:new_number] = nil
	
	# display last 10 result
	@games = Game.order("created_at DESC").limit(10) 
    respond_with(@games)
  end


  def play_roulette
    return rand(38)-1
  end

end
