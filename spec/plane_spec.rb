require 'plane.rb'

describe Plane do
  it 'checks that plane has landed at given airport' do
    plane = Plane.new
    airport = Airport.new
    expect(plane.land(airport)).to eq("The plane has landed at #{airport}")
  end
  it 'checks that plane can take off from a given airport' do
    airport = Airport.new
    airport.plane_is_added_to_available_fleet(subject)
    expect(subject.takeoff(airport)).to eq("The plane has taken off from #{airport}")
  end
  it 'checks that plane cannot take off it already has' do
    airport = Airport.new
    airport.plane_is_added_to_available_fleet(subject)
    subject.takeoff(airport)
    expect(subject.takeoff(airport)).to eq("The plane is not in the airport")
  end
  it 'checks that plane cannot take off from a given airport if it has not been added to fleet' do
    airport = Airport.new
    expect(subject.takeoff(airport)).to eq("The plane is not in the airport")
  end
  it 'checks weather before taking off and will not if raining' do
    airport = Airport.new
    puts airport.weather.setweather("raining")
    airport.plane_is_added_to_available_fleet(subject)
    expect(subject.takeoff(airport)).to eq("It is raining, so the plane can't take off")
  end
  it 'checks plane will not land if raining' do
    airport = Airport.new
    puts airport.weather.setweather("raining")
    expect(subject.land(airport)).to eq("It is raining so the plane can't land")
  end
end
