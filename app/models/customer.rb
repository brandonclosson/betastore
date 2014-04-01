# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Customer < ActiveRecord::Base
  has_many :orders
  has_many :credit_cards

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
