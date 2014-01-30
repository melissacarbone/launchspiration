class Quote < ActiveRecord::Base
  validates_presence_of :content
  validates_presence_of :author

  def self.random
    limit(1).offset(rand(self.count)).first
  end

end
