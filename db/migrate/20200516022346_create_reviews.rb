class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :size
      t.integer :height
      t.integer :weight
      t.text :content
      t.references :bike, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
