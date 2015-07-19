class GoalsController < ApplicationController

  def create
    
    client = Client.find(params[:client_id])
    goal = Goal.new(client: client)
    binding.pry  
    if goal.update(new_goal_params)
      # confirm goal created
      redirect_to :back #change to on page confirmation text
    else
      binding.pry
    redirect_to :back
    #donation.error in view raises error message
    end

  end



  private
  def new_goal_params
    params.permit(:card_type, :card_start_date, :client_id, :amount)
  end

end
