require 'spec_helper'

describe Quote do

  it { should validate_presence_of(:content) }

end

