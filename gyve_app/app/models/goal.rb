# == Schema Information
#
# Table name: goals
#
#  id              :integer          not null, primary key
#  card_type       :string
#  card_start_date :datetime
#  cost            :float            default(0.0)
#  funds_raised    :float            default(0.0)
#  status          :string
#

class Goal < ActiveRecord::Base
  belongs_to :client
  has_many :donations
end
