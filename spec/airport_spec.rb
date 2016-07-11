require 'airport'

describe Airport do

subject(:airport) { Airport.new }
subject(:plane) { Plane.new }
subject(:weather) { Weather.new } 

  describe '#land: is should work for single planes' do

    after(:all) do
      :weather.stormy? == false
    end

    it 'can tell a plane to land' do
      allow(airport.weather).to receive(:stormy?) {false}
      expect(airport.land(plane)).to include plane
    end

    it 'planes should not be able to land in a storm' do
      allow(airport.weather).to receive(:stormy?) {true}
      expect{airport.land(plane)}.to raise_error("Storm")
    end

    it 'should not allow planes to land when full' do
      allow(airport.weather).to receive(:stormy?) {false}
      airport = Airport.new(1)
      airport.land(plane)
      expect{airport.land(plane)}.to raise_error("Full")
    end

    it 'knows if a plane has landed' do
      allow(airport.weather).to receive(:stormy?) {false}
      airport.land(plane)
      expect(airport.planes).to include plane
    end
  end

  describe '#take-off' do

    before do
      airport.land(plane)
    end

    after(:all) do
      :weather.stormy? == false
    end

    it 'should tell a plane to take-off' do
      allow(airport.weather).to receive(:stormy?) {false}
      airport.take_off(plane)
      expect(airport).to respond_to(:take_off)
    end

    it 'should prevent a plane taking off in a storm' do
      allow(airport.weather).to receive(:stormy?) {true}
      expect{airport.take_off(plane)}.to raise_error("Storm")
    end

    it 'should know when a plane has taken-off' do
      allow(airport.weather).to receive(:stormy?) {false}
      airport.take_off(plane)
      expect(airport.planes).not_to eq plane
    end
  end

  describe '#take-off: it should work for multiple planes' do

    after(:all) do
      :weather.stormy? == false
    end

    it 'knows when a plane has taken-off' do
      allow(airport.weather).to receive(:stormy?) {false}
      plane_a = Plane.new
      plane_b = Plane.new
      plane_c = Plane.new
      airport.land plane_a
      airport.land plane_b
      airport.land plane_c
      airport.take_off plane_b
      expect(airport.planes).not_to include (plane_b)
    end

  end

  describe 'edge-cases' do

    it 'only allows planes that have landed to take-off' do
      allow(airport.weather).to receive(:stormy?) {false}
      plane_2 = Plane.new
      error = "Error: that plane isn't at this airport"
      expect{airport.take_off(plane_2)}.to raise_error error
    end

    it 'does not allow planes that are already flying to take-off' do
      allow(airport.weather).to receive(:stormy?) {false}
      plane_2 = Plane.new
      airport.land(plane_2)
      airport.take_off(plane_2)
      error = "Error: that plane isn't at this airport"
      expect{airport.take_off(plane_2)}.to raise_error error
    end
  end

end
