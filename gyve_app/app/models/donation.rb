# == Schema Information
#
# Table name: donations
#
#  id         :integer          not null, primary key
#  amount     :float            default(0.0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Donation < ActiveRecord::Base
  belongs_to :client
  belongs_to :donor
  belongs_to :goal
end
