# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  price      :decimal(, )
#  created_at :datetime
#  updated_at :datetime
#  image_url  :string(255)
#

class Product < ActiveRecord::Base
  has_many :categorizations
  has_many :categories, :through => :categorizations

  validates_presence_of :name, :price
  validates :price, numericality: { greater_than: 0, allow_blank: true }

  scope :search, -> (q) { where('name like ?', "%#{q}%") }
end
