require 'airport'
require 'plane'

describe Airport do

  # I want to instruct a plane to land at an airport
  it 'shout be able to instruct the plane to #land ' do
    is_expected.to respond_to(:land).with(1).argument
  end

  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  it 'should instruct the plane to #take_off if #land' do
    message = "Elvis has left the bulding"
    expect { subject.take_off }.to raise_error message
  end

end