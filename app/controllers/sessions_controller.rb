class SessionsController < ApplicationController

  #renders the login form
  def new 
  end

  #creates a session
  def create
    user = User.find_by({email: params[:email]})
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/home"
    else
      #flash error
      flash[:notice] = "Invalid username/password combination" 
      # rerender the form
      redirect_to '/login'
    end
  end

  #nulls user session (logout)
  def destroy
    session[:user_id] = nil
    session[:user_name] = nil
    session[:type] = nil
    redirect_to '/login'
  end

end