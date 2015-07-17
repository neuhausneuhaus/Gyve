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

  validate :donor_must_be_funded
  def donor_must_be_funded
    errors.add(:amount, 'donated exceeds your current funds') unless donor.funds_remaining > amount
  end

  after_save :update_donor
  def update_donor 
    new_funds_remaining = donor.funds_remaining -= amount
    new_funds_spent = donor.funds_spent += amount
    donor.update_attributes(:funds_remaining =>new_funds_remaining, :funds_spent => new_funds_spent)
  end

end
