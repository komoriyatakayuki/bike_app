class RenameTypeColumnToUse < ActiveRecord::Migration[5.1]
  def change
    rename_column :bikes, :type, :category
  end
end
