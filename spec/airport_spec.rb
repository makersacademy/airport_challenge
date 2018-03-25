require 'airport.rb'
describe Airport do
  subject(:airport) { described_class.new(5, "sunny") }
  let(:plane) { double :plane }

    it 'has the plane after landing' do
      airport.land(plane)
      expect(airport.planes.include?(plane)).to be_truthy
    end

    it 'does not have the plane after takeoff' do
      airport.takeoff(plane)
      expect(airport.planes.include?(plane)).to be_falsey
    end

    it 'should raise error when trying to land in stormy weather' do
      expect{ Airport.new(5,"stormy").land(plane)}.to raise_error("Unable to land due to stormy weather")
    end

    it 'should raise error when trying to takeoff in stormy weather' do
      expect{ Airport.new(5,"stormy").takeoff(plane)}.to raise_error("Unable to takeoff due to stormy weather")
    end

    it 'should raise error when trying to land when airport is at capacity' do
      5.times {airport.land(plane)}
      expect {airport.land(plane)}.to raise_error("Unable to land. Airport at capacity!")
    end
end
