require "airport.rb"
require "plane.rb"

describe Plane do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  describe '#landed?' do
    it 'should update status of plane when landed' do
      airport.land_plane(plane)
      expect(plane.landed?).to eq false
    end
  end

  describe '#fly?'do
    it 'should update status of plane when taking off' do
      airport.take_off(plane)
      expect(plane.fly?).to eq true
    end
  end
end
