require 'airport'
require 'plane'

describe Airport do
  it 'airport instructs a plane to land' do
    airport = Airport.new
    plane = Plane.new
    expect(airport).to respond_to(:land).with(1).argument 
  end

  it 'aiprort instructs a plane to takeoff' do
    airport = Airport.new
    plane = Plane.new
    expect(airport).to respond_to(:takeoff).with(1).argument
  end
end
