require 'airport'
require 'plane'

describe Airport do
  let (:airport) {Airport.new}
  let (:plane) {Plane.new}

  context '#land' do

    it 'responds to land' do
      expect(airport).to respond_to(:land)
    end

    it 'adds the plane to the airport' do
      airport.land(plane)
      expect(airport.planes).to eql([plane])
    end

  end

  context '#take_off' do

    it 'responds to take off' do
      expect(airport).to respond_to(:take_off)
    end

    it 'removes the plane from the airport' do
      airport.land(plane)
      airport.take_off
      expect(airport.planes).to eql([])
    end

  end

#   context 'stormy #weather' do
#     before { allow(airport).to receive(:weather).and_return("stormy") }
#
#     it 'cannot take off if weather is stormy' do
#       expect{airport.take_off}.to raise_error
#     end
#
#   end
#
# end
