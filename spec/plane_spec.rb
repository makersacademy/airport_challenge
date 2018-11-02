require 'plane.rb'

describe Plane do
  it 'checks that Plane class exists' do
    expect(Plane.new).to be_instance_of Plane
  end
  it 'checks that #land method exists' do
    expect(Plane.new).to respond_to :land
  end
  it 'checks that plane has landed at given airport' do
    plane = Plane.new
    airport = Airport.new
    expect { plane.land(airport) }.to output("The plane has landed at #{airport}").to_stdout
  end
  it 'checks that plane can take off from a given airport' do
    plane = Plane.new
    airport = Airport.new
    airport.plane_is_added_to_available_fleet(plane)
    expect(plane.takeoff(airport)).to eq("The plane has taken off from #{airport}")
  end
  it 'checks that plane cannot take off it already has' do
    plane = Plane.new
    airport = Airport.new
    airport.plane_is_added_to_available_fleet(plane)
    plane.takeoff(airport)
    expect(plane.takeoff(airport)).to eq("The plane is not in the airport")
  end
  it 'checks that plane cannot take off from a given airport if it has not been added to fleet' do
    plane = Plane.new
    airport = Airport.new
    expect(plane.takeoff(airport)).to eq("The plane is not in the airport")
  end
end
