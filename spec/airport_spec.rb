require 'airport'
require 'plane'

describe Airport do
  plane = Plane.new
  airport = Airport.new

  it 'can land a plane' do
    expect(airport.land(plane)).to eq([plane])
  end

  it 'a plane can take off' do
    expect(airport.takeoff(plane)).to eq(airport.airborne)
  end

  describe 'docking 20 planes' do
    it 'does not land a plane when airport is full (20)' do
      20.times do airport.docked << plane end
      expect { airport.land(plane) }.to raise_error('Airport Full')
    end
  end

  it 'airports have a default capacity of 20' do
    expect(airport.capacity).to eq(20)
  end

  describe 'it lets us change default capacity' do
    it 'lets us change the capacity' do
      expect(airport = 50).to eq(50)
    end
  end

  it 'prevents takeoff when weather is stormy' do
    airport.forecast = "stormy"
    expect { airport.takeoff(plane) }.to raise_error('Cannot take off in this weather')
  end

  it 'prevents landing when weather is stormy' do
    airport.forecast = 'stormy'
    expect { airport.land(plane) }.to raise_error('Cannot land in this weather')
  end
end
