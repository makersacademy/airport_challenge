require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :list_of_planes }
  it { is_expected.to respond_to :take_off }

  it 'lands a plane' do
    plane1 = double(:plane)
    airport = Airport.new
    airport.land(plane1)
    expect(airport.list_of_planes).to include(plane1)
  end

  it 'takes off' do
    plane1 = double(:plane)
    airport = Airport.new
    airport.take_off(plane1)
    expect(airport.list_of_planes).not_to include(plane1)
  end

  it 'raises an error if airport is full' do
    plane1 = double(:plane)
    airport = Airport.new
    airport.capacity.times { airport.land plane1 }
    expect { airport.land plane1 }.to raise_error 'Airport is full'
  end

  it 'rejects takeoff if plane is already flying' do
    plane1 = double(:plane)
    airport = Airport.new
    airport.flying = true
    expect { airport.land plane1 }.to raise_error 'The plane is already in the airport'
  end
#----- this was my attempt at stormy weather test -----

  #it 'prevents takeoff in stormy weather' do
    #plane = Plane.new
    #airport = Airport.new
    #if airport.weather == "stormy"
      #expect { airport.take_off Plane.new }.to raise_error 'Weather is stormy'
    #end
  # end
end
