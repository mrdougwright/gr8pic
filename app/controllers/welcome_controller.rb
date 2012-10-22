class WelcomeController < ApplicationController
  
  def index
  	@winning_photo = Rating.winner
  end

  def about
  	
  end
end
