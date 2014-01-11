class ChangeAuthorColumnToString < ActiveRecord::Migration
  def change
    change_column :quotes, :author, :string
  end
end
