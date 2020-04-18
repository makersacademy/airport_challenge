require 'airport'
require 'plane'

describe Airport do
  
  # I want to instruct a plane to land at an airport
  it 'shout be able to instruct the plane to #land ' do
    is_expected.to respond_to(:land).with(1).argument
  end

end