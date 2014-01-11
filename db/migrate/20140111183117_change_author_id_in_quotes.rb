class ChangeAuthorIdInQuotes < ActiveRecord::Migration
  def change
    rename_column :quotes, :author_id, :author
  end
end
