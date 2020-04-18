require 'airport'
require 'plane'

describe Airport do

  # I want to instruct a plane to land at an airport
  it 'shout be able to instruct the plane to #land ' do
    is_expected.to respond_to(:land).with(1).argument
  end

  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  it 'should instruct the plane to #take_off and receive a respond' do
    subject.land "Boeing 777"
    message = "Elvis has left the bulding"
    expect { subject.take_off }.to raise_error message
  end
  
  # I want to prevent landing when the airport is full
  it 'should prevent #land if @plane' do
    plane = Plane.new
    message = "Airport is full"
    Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error message
  end

end