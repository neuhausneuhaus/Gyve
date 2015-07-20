class DestinationsController < ApplicationController

  def create
    
    client = Client.find(params[:client_id])
    destination = Destination.new(client: client)

    if destination.update(new_destination_params)
      # confirm location created
      redirect_to :back #change to on page confirmation text
    else
      binding.pry
    redirect_to :back
    #destination.error in view raises error message
    end

  end



  private
  def new_destination_params
    params.permit(:client_id, :destination)
  end

end
