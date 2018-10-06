# This spec tests the plane class in plain.rb
require 'plane'

describe Plane do

  it 'responds to landing' do
    is_expected.to respond_to :land
  end

end
