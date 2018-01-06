require 'plane'
require 'airport'

describe 'Plane can confirm its own flying status' do
  it 'confirms plane is flying if plane is not in airport' do
    plane = Plane.new
    expect(plane.flying?).to eq true
  end

  it 'confirms plane is not flying if plane is in airport' do
    weather = Weather.new
    airport = Airport.new(weather)
    plane = Plane.new
    allow(weather).to receive(:rand).and_return(3)
    airport.land(plane)
    expect(plane.flying?).to eq false
  end

  it 'confirms plane is flying if plane lands, and then takes off' do
    weather = Weather.new
    airport = Airport.new(weather)
    plane = Plane.new
    allow(weather).to receive(:rand).and_return(3)
    airport.land(plane)
    expect(plane.flying?).to eq false
    airport.take_off(plane)
    expect(plane.flying?).to eq true
  end
  it 'will raise an error if non flying plane is landed again' do
    weather = Weather.new
    airport = Airport.new(weather)
    plane = Plane.new
    allow(weather).to receive(:rand).and_return(3)
    airport.land(plane)
    expect {airport.land(plane) }.to raise_error "Plane is already grounded"
  end
end
