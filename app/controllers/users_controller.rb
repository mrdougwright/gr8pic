class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
   
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_photo_path 
    else
      flash[:error] = @user.errors.empty? ? "Error" : @user.errors.full_messages.to_sentence
      redirect_to new_user_path
    end
  end

end
