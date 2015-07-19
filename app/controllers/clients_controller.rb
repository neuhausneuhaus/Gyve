class ClientsController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    # order = case params[:order]
    #   when nil, 'start_date' then 'goals.card_start_date ASC'
    #   when 'progress' then ''
    # end
    # binding.pry
    if current_user.is_a?(Donor)
      @clients = Client.all.includes(:goals).where(:goals => {:status => "open"}).order(sort_column+" "+sort_direction)
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


  def new
    @client = Client.new
    render "new"
  end

   def create
    client = Client.new
    if client.update(client_params)
      redirect_to '/clients/#{client.id}'
    else
      redirect_to '/home'
    end
  end


  def update
  @client = Client.find params[:id]

    # binding.pry
  respond_to do |format|
    # binding.pry
    if @client.update(client_params)
      # binding.pry
      format.html { redirect_to(@client, :notice => 'Client was successfully updated.') }
      format.json { respond_with_bip(@client) }
    else
      # binding.pry
      format.html { render :action => "edit" }
      format.json { respond_with_bip(@client) }
    end
  end
end


  private
  def client_params
    params.require(:client).permit(:f_name, :l_name, :client_alias, :about, :zip)
  end




  def sort_column
    Client.column_names.include?(params[:sort]) ? params[:sort] : "progress"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end



end
