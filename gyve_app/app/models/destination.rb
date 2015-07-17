# == Schema Information
#
# Table name: destinations
#
#  id          :integer          not null, primary key
#  destination :string           not null
#

class Destination < ActiveRecord::Base
  belongs_to :client
end
