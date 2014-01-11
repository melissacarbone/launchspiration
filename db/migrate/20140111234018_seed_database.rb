class SeedDatabase < ActiveRecord::Migration
  def up
    2.times do |i|
      Quote.create(content: "When in doubt, get dumplings", author: "Colin Shields", cohort: "Winter 2013")
    end
  end

  def down
    Quote.delete_all
  end
end
