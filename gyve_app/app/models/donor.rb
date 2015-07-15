# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  type            :string
#  f_name          :string           not null
#  l_name          :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  funds_remaining :float            default(0.0)
#  funds_spent     :float            default(0.0)
#  agency          :string
#

class Donor < User
  has_many :clients, through: :donations
  has_many :donations
end


