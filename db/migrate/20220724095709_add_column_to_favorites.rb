class AddColumnToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :book_id, :integer
    add_column :favorites, :user_id, :integer
  end
end
