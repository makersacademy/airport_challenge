require 'plane'

describe Plane do
  
  describe '#flying' do
    it 'checks that flying planes cannot takeoff' do
      airport = Airport.new
      weather = Weather.new
      allow(airport.weather).to receive(:stormy?).and_return(false)
      plane1 = Plane.new
      plane2 = Plane.new
      airport.land(plane1)
      airport.land(plane2)
      airport.takeoff(plane1)
      expect{airport.takeoff(plane1)}.to raise_error("Plane is already flying")
    end

    it 'checks landed plane cannot land again' do
      airport = Airport.new
      weather = Weather.new
      allow(airport.weather).to receive(:stormy?).and_return(false)
      plane = Plane.new
      airport.land(plane)
      expect{airport.land(plane)}.to raise_error("Plane is already landed")
    end
  end

end