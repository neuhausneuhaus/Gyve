class DonationsController < ApplicationController

  def create
    
    donor = Donor.find(params[:donor_id])
    donation = Donation.new(donor: donor)
      
    if donation.update(new_donation_params)
      # confirm donation, and new balance+++++
      redirect_to :back #change to on page confirmation text
    else
    redirect_to :back
    #donation.error in view raises error message
    end

  end



  private
  def new_donation_params
    params.permit(:amount, :donor_id, :client_id, :goal_id)
  end

end