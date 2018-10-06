require 'plane'

describe Plane do

  it 'plane location updates to in flight once taken off' do
    plane = Plane.new
    airport = double :Airport, planes: [plane]
    allow(airport).to receive(:take_off).with(plane).and_return(plane.location = :in_flight)
    airport.take_off(plane)
    expect(plane.location).to eq :in_flight

  end

end
