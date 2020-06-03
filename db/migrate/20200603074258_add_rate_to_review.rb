class AddRateToReview < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :rate, :float, default: 0
  end
end
