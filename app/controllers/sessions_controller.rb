class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_username(params[:username])
  	if user && user.authenticate(params[:password])
  		login user
  		flash[:sucess] = 'You are now logged in!'
  		redirect_to root_url
  	else
  		flash.now[:error] = 'Your username/password combination was incorrect.'
  		render 'new'
  	end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'You are now logged out!'
  end
end
