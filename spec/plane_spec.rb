require "airport.rb"
require "plane.rb"

describe Plane do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  before (:each) do
    allow(airport).to receive(:stormy?).and_return(false)
  end
  describe '#landed?' do
    it 'should update status of plane when landed' do
      airport.land_plane(plane)
      expect(plane.landed?).to eq false
    end
  end

  before (:each) do
    allow(airport).to receive(:stormy?).and_return(false)
  end
  describe '#fly?'do
    it 'should update status of plane when taking off' do
      airport.take_off(plane)
      expect(plane.fly?).to eq true
    end
  end
end
