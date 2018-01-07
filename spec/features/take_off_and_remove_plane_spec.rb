require 'airport'
require 'plane'

describe 'plane takes off and plane removed from airport' do
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }
  let(:airport) { Airport.new(weather) }

  it 'removes plane from airport' do
    land_plane_clear_weather(airport, weather, plane)
    airport.take_off(plane)
    expect(airport.hangar).to be_empty
  end
  it 'provides return output to confirm plane has left airport' do
    land_plane_clear_weather(airport, weather, plane)
    expect(airport.take_off(plane)).to eq "#{plane} has now left airport" 
  end
  it 'will not allow a plane that is not landed at the airport to take off' do
    plane.landed
    expect { airport.take_off(plane) }.to raise_error "Plane is not at this airport"
  end
  it 'confirms plane is flying after take off from airport' do
    land_plane_clear_weather(airport, weather, plane)
    airport.take_off(plane)
    expect(plane.flying?).to eq true
  end
  it 'will not allow plane to take off if weather is stormy' do
    land_plane_clear_weather(airport, weather, plane)
    allow(weather).to receive(:rand).and_return(5)
    expect { airport.take_off(plane) }.to raise_error 'Unable to take off - weather is stormy'
  end
end
