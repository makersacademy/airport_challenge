require 'plane'
require 'airport'

describe Plane do

  subject(:plane) {Plane.new}
  subject(:airport) {Airport.new}

  describe '#land_at' do

    it 'lands at the airport' do
      expect(plane).to respond_to(:land_at).with(1).arguments
    end
    it 'raises error if weather is stormy' do
      allow(airport.weather).to receive(:rand).with(0..9) {9}
      expect {plane.land_at(airport)}.to raise_error 'cannot land in stormy weather'
    end
    it 'raise error if trying to land at a full airport' do
      allow(airport.weather).to receive(:rand).with(0..9) {0}
      airport.capacity.times { Plane.new.land_at(airport) }
      expect {plane.land_at(airport)}.to raise_error 'cannot land at full airport'
    end 

  end

  describe '#take_off_from' do

    it 'confirm a plane has left the airport' do
      allow(airport.weather).to receive(:rand).with(0..9) {0}
      plane.land_at(airport)
      plane.take_off_from(airport)
      expect(airport.planes[0]).to_not eq plane
    end
    it 'raises error if weather is stormy' do
      allow(airport.weather).to receive(:rand).with(0..9) {9}
      expect {plane.take_off_from(airport)}.to raise_error 'cannot take off in stormy weather'
    end

  end

  # it 'takes off from an airport' do
  #   allow(airport.weather).to receive(:rand).with(0..9) {0}
  #   plane.land_at(airport)
  #   plane.take_off_from(airport)
  #   expect {airport.planes[0]}.not_to eq plane
  # end

  it 'cannot land if already landed' do
    allow(airport.weather).to receive(:rand).with(0..9) {0}
    plane.land_at(airport)
    expect {plane.land_at(airport)}.to raise_error 'plane has already landed'
  end

end