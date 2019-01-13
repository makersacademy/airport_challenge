require 'airport'
require 'plane'

RSpec.describe 'Airport: Feature Tests' do
  it 'instruct a plane to land' do
    airport = Airport.new
    plane = Plane.new
    expect { airport.land(plane) }.to_not raise_error
  end

  it 'instruct a plane to take off and confirm' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    airport.take_off(plane)

    expect(airport.plane).to_not eq plane
  end
end

RSpec.describe 'Weather: Feature Tests' do
  it 'instruct to receive current weather' do
    expect { Weather.current }.to_not raise_error
  end
end
