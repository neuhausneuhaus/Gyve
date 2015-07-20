class StaticPagesController < ApplicationController
  def about
    render :layout => false
  end
end
