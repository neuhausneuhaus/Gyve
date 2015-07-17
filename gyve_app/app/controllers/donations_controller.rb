class DonationsController < ApplicationController

  def create
    donation = Donation.new

    if donation.update(new_donation_params)
      # update donor's funds
      binding.pry
      # confirm donation, and new balance
      redirect_to '/home'
    end
    
  end



  private
  def new_donation_params
    params.permit(:amount, :donor_id, :client_id, :goal_id)
  end

end