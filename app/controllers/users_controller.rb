class UsersController < ApplicationController

  def create
    user = Donor.new
    # binding.pry
    if user.update(new_user_params)
      session[:user_id] = user.id
      redirect_to '/home'
    else
      # binding.pry
      redirect_to '/signup'
    end
  end

  def new
    @user = Donor.new
    render :donor_new
  end
  

  private

  def new_user_params
    params.require(:donor).permit(:f_name, :l_name, :email, :password, :password_confirmation)
  end

end
