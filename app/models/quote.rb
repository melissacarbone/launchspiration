class Quote < ActiveRecord::Base
  validates_presence_of :content
  validates_presence_of :author

  def self.random
    find_by_id(rand(Quote.count)+1)
  end

end
