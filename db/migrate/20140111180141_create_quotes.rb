class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text :content, null: false
      t.integer :author_id

      t.timestamps
    end
  end
end
