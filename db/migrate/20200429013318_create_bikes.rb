class CreateBikes < ActiveRecord::Migration[5.1]
  def change
    create_table :bikes do |t|
      t.string :name
      t.string :type
      t.string :image_url
      t.string :price

      t.timestamps
    end
  end
end
