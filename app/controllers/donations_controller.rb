class DonationsController < ApplicationController

  def create
    donation = Donation.new

    #define donor and amounts
    donor = Donor.find(params[:donor_id])
    new_funds_remaining = donor.funds_remaining -= params[:amount].to_f
    new_funds_spent = donor.funds_spent += params[:amount].to_f
    
    #if donor has neccesary funds
    if new_funds_remaining > 0 

      #Try to create Donation
      donor.update_attributes(:funds_remaining =>new_funds_remaining, :funds_spent => new_funds_spent)
      if donation.update(new_donation_params)
        # confirm donation, and new balance
        redirect_to :back #change to on page confirmation text
      else #if donation create fails
      #raise error message
      binding.pry
      end

    else #if donor does not have neccesary funds
      #raise error message
      binding.pry
    end
  end



  private
  def new_donation_params
    params.permit(:amount, :donor_id, :client_id, :goal_id)
  end

end