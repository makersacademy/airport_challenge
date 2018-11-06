require 'plane.rb'

describe Plane do
  before(:each) do
  airport = Airport.new
  it 'checks that plane has landed at given airport' do
    airport.weather.setweather("sunny")
    expect(subject.land(airport)).to eq("The plane has landed at #{airport}")
  end
  it 'checks that plane can take off from a given airport' do
    airport.plane_is_added_to_available_fleet(subject)
    airport.weather.setweather("sunny")
    expect(subject.takeoff(airport)).to eq("The plane has taken off from #{airport}")
  end
  it 'checks that plane cannot take off it already has' do
    airport.plane_is_added_to_available_fleet(subject)
    subject.takeoff(airport)
    expect { subject.takeoff(airport) }.to raise_error("Plane is not in the airport")
  end
  it 'checks that plane cannot take off from a given airport if it has not been added to fleet' do
    expect { subject.takeoff(airport) }.to raise_error("Plane is not in the airport")
  end
  it 'checks weather before taking off and will not if stormy' do
    airport.weather = "stormy"
    airport.plane_is_added_to_available_fleet(subject)
    expect { subject.takeoff(airport) }.to raise_error("Stormy so the plane cannot take off")
  end
  it 'checks plane will not land if stormy' do
    airport.weather = "stormy"
    expect { subject.land(airport) }.to raise_error("Stormy so the plane cannot land")
  end
  end
end
