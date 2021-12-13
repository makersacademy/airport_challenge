require 'airport'
require 'plane'

describe 'Controller can instruct a plane to land at an airport' do
  describe 'plane' do
    it 'can be instructed to land at an airport' do
      plane = Plane.new
      airport = Airport.new
      allow(Weather).to receive(:report) { "Blue Skies Ahead" }
      plane.land(airport)
      expect(plane).to respond_to(:land).with(1).argument
    end
  end
end

describe 'Controller can instruct plane to take off' do
  describe 'plane' do
    it 'can be confirmed as in flight' do
      plane = Plane.new
      airport = Airport.new
      allow(Weather).to receive(:report) { "Blue Skies Ahead" }
      plane.land(airport)
      plane.takeoff
      expect(plane.location).to eq("In Flight")
    end
  end
end

describe 'Controller can prevent landing when airport full' do
  describe 'airport' do
    it 'raises an error if a plane tries to land when full' do
      plane1 = Plane.new
      plane2 = Plane.new
      airport = Airport.new
      allow(Weather).to receive(:report) { "Blue Skies Ahead" }
      plane1.land(airport)
      expect { plane2.land(airport) }.to raise_error("Sorry, Hangar Full")
    end
  end
end

describe 'Designer can override a default capacity' do
  describe 'airport' do
    it 'planes are allowed to reach specified capacity limit' do
      airport = Airport.new(13)
      allow(Weather).to receive(:report) { "Blue Skies Ahead" }
      13.times { Plane.new.land(airport) }
      expect(airport.hangar.count).to eq 13
    end
  end
end

describe 'Controller can prevent takeoff if stormy' do
  describe 'airport' do
    it 'will not allow takeoff if stormy' do
      airport = Airport.new
      plane = Plane.new
      allow(Weather).to receive(:report) { "Blue Skies Ahead" }
      plane.land(airport)
      allow(Weather).to receive(:report) { "Storms on the Horizon" }
      expect { plane.takeoff }.to raise_error "Sorry, Runways Closed, Storms Approaching"
    end
  end
end

describe 'Controller can prevent landing if stormy' do
  describe 'airport' do
    it 'will not allow landing if stormy' do
      plane = Plane.new
      airport = Airport.new
      allow(Weather).to receive(:report) { "Storms on the Horizon" }
      expect { airport.receive(plane) }.to raise_error "Sorry, Runways Closed, Storms Approaching"
    end
  end
end
