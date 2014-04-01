# == Schema Information
#
# Table name: categorizations
#
#  id          :integer          not null, primary key
#  product_id  :integer
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Categorization < ActiveRecord::Base
  belongs_to :category
  belongs_to :product
end
