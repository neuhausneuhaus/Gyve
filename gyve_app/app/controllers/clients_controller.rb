class ClientsController < ApplicationController

  def index
    order = case params[:order]
      when nil, 'start_date' then 'goals.card_start_date ASC'
      when 'progress' then ''
    end
    # binding.pry
    if current_user.is_a?(Donor)
      @clients = Client.all.includes(:goals).where(:goals => {:status => "open"}).order(order)
      render :donor_client_index
    else # elsif user is Caseworker
      @clients = current_user.clients
      render :caseworker_client_index
    end
  end

  def show
    # raise current_user.inspect
    @client = Client.find(params[:id])
    if current_user.is_a?(Donor)
      render :donor_client_show
    elsif current_user.is_a?(Caseworker)
      render :caseworker_client_show
    end
  end
  
end
