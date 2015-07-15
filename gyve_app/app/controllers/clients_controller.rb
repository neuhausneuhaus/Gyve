class ClientsController < ApplicationController

  def index
    # binding.pry
    if current_user.is_a?(Donor)
      @clients = Client.all
      render :donor_client_index
    else # elsif user is Caseworker
      @clients = current_user.clients
      render :caseworker_client_index
    end

  end

end
