# == Schema Information
#
# Table name: goals
#
#  id              :integer          not null, primary key
#  card_type       :string
#  card_start_date :datetime
#  cost            :float            default(0.0)
#  status          :string
#

class Goal < ActiveRecord::Base
  belongs_to :client, touch: true
  has_many :donations


  #set amount according to card type selection
  before_validation(on: :create) do
    
    # determine cost

    if self.card_type == 'monthly'
      self.cost = 116.50
    elsif self.card_type = 'weekly'
      self.cost = 31
    end

  end

  # #check that card date starts > 2 weeks from current date
  # #check if card dates conflict with existing cards

  # validate :goal_date_conflicts
  # def goal_date_conflicts
  #   # errors.add(:card_start_date, 'card date conflicts with existing goal') unless client.goals _______
  #   # errors.add(:card_start_date, 'goals must start at least two weeks in the future') unless self.card_start_date > two weeks from now
  # end


end
