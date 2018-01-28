require 'airport'

describe Airport do

  let(:airport) {Airport.new}
  let(:plane) {Plane.new}

  describe '#land' do
    before(:each) do
      airport.land(plane)
    end

    it 'stores a plane that has landed' do
      expect(airport.storage).to include(plane)
    end
  end

  describe '#takeoff' do
    before(:each) do
      airport.takeoff(plane)
    end

    it 'releases a plane due for takeoff' do
      expect(airport.storage.include?(plane)). to eq false
    end
  end
end
