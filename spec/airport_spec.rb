require 'airport'

describe Airport do
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :list_of_planes }
  it { is_expected.to respond_to :take_off }

  it 'lands a plane' do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    expect(airport.list_of_planes).to include(plane)
  end

  it 'takes off' do
    plane = Plane.new
    airport = Airport.new
    airport.take_off(plane)
    expect(airport.list_of_planes).not_to include(plane)
  end

  it 'raises an error if airport is full' do
    plane = Plane.new
    airport = Airport.new
    airport.capasity.times { airport.land Plane.new }
    expect { airport.land Plane.new }.to raise_error 'Airport is full'
  end
end
