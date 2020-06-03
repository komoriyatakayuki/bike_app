class AddDescriptionToBikes < ActiveRecord::Migration[5.1]
  def change
    add_column :bikes, :description, :text
  end
end
