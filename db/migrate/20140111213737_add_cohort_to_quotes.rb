class AddCohortToQuotes < ActiveRecord::Migration
  def up
    add_column :quotes, :cohort, :string
  end

  def down
    remove_column :quotes, :cohort
  end
end
