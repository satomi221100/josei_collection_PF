class RenameBookContentColumnToBookComments < ActiveRecord::Migration[6.1]
  def change
    rename_column :book_comments, :book_content, :comment
  end
end
