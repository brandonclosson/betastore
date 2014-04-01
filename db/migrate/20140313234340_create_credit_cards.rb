class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.belongs_to :customer, index: true
      t.string :card_number
      t.string :expiration_date

      t.timestamps
    end
  end
end
