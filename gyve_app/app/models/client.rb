# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  f_name     :string           not null
#  l_name     :string           not null
#  gender     :string
#  alias      :string
#  about      :text
#  zip        :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Client < ActiveRecord::Base
  belongs_to :caseworker
  has_many :donors, through: :donations
  has_many :goals
  has_many :donations
  has_many :destinations
end
