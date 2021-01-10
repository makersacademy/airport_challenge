require 'airport'
require 'plane'

describe Airport do

subject(:airport) {described_class.new}
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:land).with(1).argument }

  it 'should instruct a plane to land at the airport' do
    plane = Plane.new
    expect(airport.land(plane)).to include(plane)
  end

  it 'should confirm a plane is not longer at the airport' do
    plane = Plane.new
    expect(airport.take_off(plane)).to eq "#{plane} has buggered off."
  end

  it 'should prevent landing when airport is full' do
    5.times { airport = Airport.new }
    5.times { airport.land Plane.new }
    expect{ airport.land (Plane.new) }.to raise_error("Go away. Airport is full.")
  end

end
