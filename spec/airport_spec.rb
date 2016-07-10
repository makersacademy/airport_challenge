require 'airport'

describe Airport do

subject(:airport) { Airport.new }
subject(:plane) { Plane.new }
subject(:weather) { Weather.new } 

  describe '#land: is should work for single planes' do

    after(:all) do
      weather=Weather.new
      weather.stormy? == false
    end

    it 'can tell a plane to land' do
      allow(weather).to receive(:stormy?) {false}
      expect(airport.land(plane)).to include plane
    end


    it 'planes should not be able to land in a storm' do
      allow(weather).to receive(:stormy?) {true}
      expect{airport.land(plane)}.to raise_error("Storm")
    end

    it 'should not allow planes to land when full' do
      allow(weather).to receive(:stormy?) {false}
      airport = Airport.new(1)
      airport.land(plane)
      expect{airport.land(plane)}.to raise_error("Full")
    end

    it 'knows if a plane has landed' do
      allow(weather).to receive(:stormy?) {false}
      airport.land(plane)
      expect(airport.planes).to include plane
    end
  end

  describe '#take-off' do

    before do
      airport.land(plane)
    end

    after(:all) do
      weather=Weather.new
      weather.stormy? == false
    end

    it 'should tell a plane to take-off' do
      allow(weather).to receive(:stormy?) {false}
      airport.take_off(plane)
      expect(airport).to respond_to(:take_off)
    end

    it 'should prevent a plane taking off in a storm' do
      allow(weather).to receive(:stormy?) {true}
      expect{airport.take_off(plane)}.to raise_error("Storm")
    end

    it 'should know when a plane has taken-off' do
      allow(weather).to receive(:stormy?) {false}
      airport.take_off(plane)
      expect(airport.planes).not_to eq plane
    end
  end

  describe '#take-off: it should work for multiple planes' do

    after(:all) do
      weather=Weather.new
      weather.stormy? == false
    end

    it 'knows when a plane has taken-off' do
      allow(weather).to receive(:stormy?) {false}
      planeA = Plane.new
      planeB = Plane.new
      planeC = Plane.new
      airport.land(planeA)
      airport.land(planeB)
      airport.land(planeC)
      airport.take_off(planeB)
      expect(airport.planes).not_to include (planeB)
    end

  end

  describe 'edge-cases' do

    it 'only allows planes that have landed to take-off' do
      allow(weather).to receive(:stormy?) {false}
      plane2 = Plane.new
      expect{airport.take_off(plane2)}.to raise_error "Error: that plane isn't at this airport"
    end

    it 'does not allow planes that are already flying to take-off' do
      allow(weather).to receive(:stormy?) {false}
      plane2 = Plane.new
      airport.land(plane2)
      airport.take_off(plane2)
      expect{airport.take_off(plane2)}.to raise_error "Error: that plane isn't at this airport"
    end
  end

  end
